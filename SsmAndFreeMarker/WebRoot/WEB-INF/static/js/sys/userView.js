/**
 * 用户管理
 */
var vm = new Vue(
  {
    el: '#main',
    data: {
      tableHeight: 200, // 表格高度
      // 对话框相关
      modal: {
        // 是否显示加载动画
        showMask: false,
        // 是否显示按钮加载动画
        loading: true,
        editIdx: -1,
        showInfo: false,
        // 是否显示编辑框
        showEdit: false,
        // 用户角色弹框
        showRole: false,
        //ukey绑定框
        uKeyState:false,
        //ukey和宗地的关系
        zduKeyShow:false,
        //宗地ukey关系
        treeStateShow:false,
        //用户key的关系
        userKeyShow:false
      },
      form: {
        // 编辑表单信息
        edit: {
          userId: '',
          userName: '',
          mobilePhone: '',
          email: '',
          sex: 0,
          state: 0,
          remarks: '',
          userOrg: '',
          orgName: ''
        },
        ukey:{
          ukeyIdUserList:[],
          zduKeybaseData:[],
          ukeyIdList:[],
          ukeyIdIndex:0,
          ukeyId:'',
          type:''//宗地1权限为2
        },
        // 查询表单信息
        search: {
          userId: '',
          userName: ''
        },
        // 最后一次查询表单信息
        lastSearch: {},
        bConnect:0//uKey是否安装程序状态
      },
      roles: [],
      // 表单验证规则
      rule: {
        userId: [{
          required: true,
          message: '帐号必须填写',
          trigger: 'blur'
        }, {
          validator: function(rule, value, callback) {
            if (!/^\w{6,20}$/.test(value)) {
              callback(new Error('帐号必须由6-20位 字、数字或下划线组成'));
              return;
            }

            if (vm.modal.editIdx == -1) {
              $.post(basePath + '/sys/user-check', {
                userId: value
              }, function(res) {
                if (!res.success) {
                  // 重复
                  callback(new Error('该用帐号已经存在'));
                } else {
                  callback();
                }
              }, 'json');
            } else {
              callback();
            }
          },
          trigger: 'blur'
        }],
        userName: [{
          required: true,
          message: '姓名必须填写',
          trigger: 'blur'
        }],
        userOrg: [{
          required: true,
          message: '必须选择',
          trigger: 'blur'
        }],
        mobilePhone: [{
          pattern: '^(((\\d{3,4}-{0,1}){0,1}\\d{7,8}(-{0,1}\\d{3,4}){0,1})|(1[3|4|5|7|8]\\d{9}))$',
          message: '电话格式错误',
          trigger: 'blur'
        }],
        email: [{
          type: 'email',
          message: '邮箱格式错误',
          trigger: 'blur'
        }]
      },
      ruleUkey:{
        ukeyId: [{
          required: true,
          message: 'ukey必须填写',
          trigger: 'blur'
        }],
      },
      // 表格列属性
      columns: [
        {
          title: '帐号',
          key: 'userId'
        },
        {
          title: '姓名',
          key: 'userName',
          align: 'center'
        },
        {
          title: '手机号',
          key: 'mobilePhone'
        },
        {
          title: '邮箱',
          key: 'email'
        },
        {
          title: '操作',
          width: 500,
          render: function(h, params) {
            return h(
              'div',
              [
                h('Button', {
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  on: {
                    click: function() {
                      var that = vm;
                      that.form.edit = $.extend({}, params.row);
                      that.modal.showInfo = true;
                      
                    }
                  }
                }, '查看'),
                h('Button', {
                  style: {
                    marginLeft: '5px'
                  },
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  on: {
                    click: function() {
                      var that = vm;
                      that.form.edit = $.extend({}, params.row);
                      that.modal.editIdx = params.index;
                      that.modal.showEdit = true;
                    }
                  }
                }, '编辑'),
                h('Button', {
                  style: {
                    marginLeft: '5px'
                  },
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  on: {
                    click: function() {
                      var that = vm, r = params.row;
                      $.post(basePath + '/sys/user-getRole', {
                        userId: r.userId
                      }, function(res) {
                        if (res.success) {
                          that.roles = res.data;
                        }
                      }, 'json');
                      that.form.edit = $.extend({}, r);
                      that.modal.showRole = true;
                    }
                  }
                }, '设置用户角色'),
                params.row.userId == 'admin' ? ''
                  : h(
                    'Button',
                    {
                      style: {
                        marginLeft: '5px'
                      },
                      props: {
                        type: 'error',
                        size: 'small'
                      },
                      on: {
                        click: function() {
                          var that = vm, userId = params.row.userId, index = params.index;
                          that.$Modal.confirm({
                            content: '确认删除用户' + userId,
                            loading: true,
                            onOk: function() {
                              $.post(basePath + '/sys/user-remove', {
                                userId: userId
                              }, function(res) {
                                that.$Modal.remove();
                                if (res.success) {
                                  var page = that.page;
                                  if (page.results.length == 1
                                    && page.pageNo != 1) {
                                    page.pageNo--;
                                  }
                                  that.getPage(that.form.lastSearch);
                                  that.$Message.success({
                                    content: res.data
                                  });
                                } else {
                                  that.$Message.error({
                                    content: res.data
                                  });
                                }
                              }, 'json');
                            }
                          });
                        }
                      }
                    }, '删除'), h('Button', {
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  style: {
                    marginLeft: '5px'
                  },
                  on: {
                    click: function() {
                      var that = vm;
                      that.$Modal.confirm({
                        content: '确认重置密码为帐号',
                        loading: true,
                        onOk: function() {
                          $.post(basePath + '/sys/user-resetPassword', {
                            userId: params.row.userId
                          }, function(res) {
                            that.$Modal.remove();
                            if (res.success) {
                              that.$Message.success({
                                content: res.data
                              });
                            } else {
                              that.$Message.error({
                                content: res.data
                              });
                            }
                          }, 'json');
                        }
                      });
                    }
                  }
                }, '重置密码'),
                h('Button', {
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  style: {
                    marginLeft: '5px'
                  },
                  on: {
                    click: function() {
                    	//key 绑定宗地
                      var that = vm;
                      that.form.edit = $.extend({}, params.row);
                      that.modal.editIdx = params.index;
                      //ukey——user页面取消显示
                      that.modal.treeStateShow=true;
                      that.form.ukey.type=1;
                      that.showUkey();
                    }
                  }
                }, 'key绑定宗地'),
                h('Button', {
                  style: {
                	  marginRight: '5px'
                  },
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  on: {
                    click: function() {
                     var that = vm, userId = params.row.userId;
                     that.form.edit = $.extend({}, params.row);
                     //绑定宗地
                      $.post(basePath + '/sys/get-zd-user', {
                        userId:userId
                      }, function(res) {
                        if (res.success) {
                          that.modal.zduKeyShow=true;
                          that.form.ukey.zduKeybaseData= res.data;
                        }
                      }, 'json');
                    }
                  }
                }, '用户绑定宗地')
               ]);
          }
        }],
      columnsUkey:[
          {
          title: 'ukeyId',
          key: 'ukeyId'
         },
         {
         title: '操作',
         width: 200,
         render: function(h, params) {
           return h(
             'div',
             [params.row.state==2?h('Button', {
                 props: {
                   type: 'error',
                   size: 'small'
                 },
                 on: {
                   click: function() {
                     var that = vm;
                    
                     var ukeyId = params.row.ukeyId;
                     that.form.ukey.ukeyIdIndex = params.index;
                     //方法
                     that.openClose(ukeyId,3);
                   }
                 }
               }, '禁用'):
               h('Button', {
                 props: {
                   type: 'info',
                   size: 'small'
                 },
                 on: {
                   click: function() {
                     var that = vm;
                     var ukeyId = params.row.ukeyId;
                     that.form.ukey.ukeyIdIndex = params.index;
                     //方法
                     that.openClose(ukeyId,2);
                   }
                 }
               }, '启动'),
               h('Button', {
                 props: {
                   type: 'info',
                   size: 'small'
                 },
                 style: {
                   marginLeft: '5px'
                 },
                 on: {
                   click: function() {
                     var that = vm;
                     //获取key,
                     var ukeyId = params.row.ukeyId;
                     var userId=that.form.edit.userId;
                     that.form.ukey.ukeyId=ukeyId;
                    //绑定宗地
                     $.post(basePath + '/sys/get-zd-ukey', {
                       ukeyId:ukeyId,
                       userId:userId
                     }, function(res) {
                       if (res.success) {
                         that.modal.zduKeyShow=true;
                         that.form.ukey.zduKeybaseData= res.data;
                       }
                     }, 'json');
                   }
                 }
               }, '绑定宗地')
               ]);
         }}
       ],
       columnsUserUkey:[
                    {
                    title: 'ukeyId',
                    key: 'ukeyId'
                   },
                   {
                   title: '操作',
                   width: 200,
                   render: function(h, params) {
                     return h(
                       'div',
                       [params.row.state==2?h('Button', {
                           props: {
                             type: 'error',
                             size: 'small'
                           },
                           on: {
                             click: function() {
                               var that = vm;
                               var ukeyId = params.row.ukeyId;
                               that.form.ukey.ukeyIdIndex = params.index;
                               //方法
                               that.openClose(ukeyId,3);
                             }
                           }
                         }, '禁用'):
                         h('Button', {
                           props: {
                             type: 'info',
                             size: 'small'
                           },
                           on: {
                             click: function() {
                               var that = vm;
                               var ukeyId = params.row.ukeyId;
                               that.form.ukey.ukeyIdIndex = params.index;
                               //方法
                               that.openClose(ukeyId,2);
                             }
                           }
                         }, '启动')
                         ]);
                   }}
                 ],
      // 分页信息
      page: {
        totalCount: 0,
        pageNo: 1,
        pageSize: 10,
        results: []
      },
      // 字典
      dict: {
        sex: ['未知', '男', '女'],
        state: ['正常', '失效', '锁定', '禁用'],
        userOrg: {}
      }
    },
    methods: {
      // 获取分页
      getPage: function(params) {
        var that = this, page = that.page, p = $.extend({
          pageSize: page.pageSize,
          pageNo: page.pageNo
        }, params ? params : that.form.search);
        that.modal.showMask = true;
        $.post(basePath + '/sys/user-getPage', p, function(res) {
          that.modal.showMask = false;
          if (res.success) {
            that.page = res.data;
          } else {
            that.$Modal.error({
              content: res.data
            });
          }
        }, 'json');
      },
      // 改变页码
      changePage: function(pageNo) {
        this.page.pageNo = pageNo;
        this.getPage(this.form.lastSearch);
      },
      // 点击查询
      search: function() {
        this.page.pageNo = 1;
        this.getPage();
        this.form.lastSearch = $.extend({}, this.form.search);
      },
      // 点击创建
      create: function() {
        var that = this;
        this.$refs.editForm.resetFields();
        // 控制弹框标题显示
        that.modal.editIdx = -1;
        // 新增按钮弹框
        that.modal.showEdit = true;
      },
      // 创建或编辑保存
      save: function() {
        var that = this, form = that.form.edit, editIdx = that.modal.editIdx, p;
        that.$refs.editForm.validate(function(valid) {
          if (valid) {
            p = $.extend({}, form);
            $.post(basePath
              + (editIdx == -1 ? '/sys/user-create' : '/sys/user-modify'), p,
              function(res) {
                if (res.success) {
                  that.modal.showEdit = false;
                  that.$Message.success({
                    content: res.data
                  });
                  if (editIdx == -1) {
                    that.$refs.searchForm.resetFields();
                    that.form.search.userId = p.userId;
                    that.search();
                  } else {
                    that.page.results[editIdx].userName = p.userName;
                    that.page.results[editIdx].mobilePhone = p.mobilePhone;
                    that.page.results[editIdx].email = p.email;
                    that.page.results[editIdx].state = p.state;
                    that.page.results[editIdx].sex = p.sex;
                    that.page.results[editIdx].userOrg = p.userOrg;
                    that.page.results[editIdx].orgName = p.orgName;
                    that.page.results[editIdx].remarks = p.remarks;
                  }
                } else {
                  that.$Message.error({
                    content: res.data
                  });
                  that.modal.loading = false;
                  setTimeout(function() {
                    that.modal.loading = true;
                  }, 0);
                }
              }, 'json');
          } else {
            that.modal.loading = false;
            setTimeout(function() {
              that.modal.loading = true;
            }, 0);
          }
        });
      },
      roleSave: function() {
        // 保存角色用户
        var that = this, arr = that.$refs.roleTree.getCheckedNodes(), roles = [], r;
        for ( var i = 0, l = arr.length; i < l; i++) {
          r = arr[i];
          if (r.parent) {
            roles.push(r.parent + '#' + r.id);
          }
        }
        $.post(basePath + '/sys/user-role', {
          userId: that.form.edit.userId,
          roles: roles.join()
        }, function(res) {
          if (res.success) {
            that.modal.showRole = false;
            that.$Message.success({
              content: res.data
            });
          } else {
            that.$Message.error({
              content: res.data
            });
            that.modal.loading = false;
            setTimeout(function() {
              that.modal.loading = true;
            }, 0);
          }
        }, 'json');

      },
      resetForm: function() {
        this.$refs.searchForm.resetFields();
        this.getPage();
      },
      orgSelect: function(code) {
        this.form.edit.userOrg = code;
        this.form.edit.orgName = this.dict.userOrg[code];
        this.dict.userOrg = {};
      },
      searchOrg: function() { 
        var that = this, key = that.form.edit.userOrg; 
        if (key.length > 1) {
          $.post(basePath + '/sys/userOrg-search', {
            key: key
          }, function(res) {
            if (res.success) {
              that.dict.userOrg = res.data;
            }
          }, 'json');
        } else {
          that.dict.userOrg = {};
        }
      },
      //绑定ukey
      uKeySave:function(){
        var that=this;
        that.$refs.ukeyForm.validate(function(valid) {
          if (valid) {
            //验证通过获取ukey
            var ukeyId=that.form.ukey.ukeyId;
            //获取用户id
            var form = that.form.edit;
            var type=that.form.ukey.type;
            if(type==1){
              type=0;
            }else{
              type=1;
            }
              //如果key没有被禁用的话
                //保存ukeyId
                $.post(basePath + '/sys/user-ukey', {
                  userId: form.userId,
                  ukeyId: ukeyId,
                  type:type
                }, function(res) {
                  if (res.success) {
                    if(type==0){
                      //对应的列赋值ukeyId start
                      that.modal.uKeyState = false;
                      that.$Message.success({
                        content: res.data
                      });
                      that.modal.treeStateShow=true;
                    }else{
                      //对应的列赋值ukeyId start
                      that.modal.uKeyState = false;
                      that.$Message.success({
                        content: "成功"
                      });
                      that.modal.userKeyShow=true;
                    }
                    that.showUkey();
                  } else {
                    that.$Message.error({
                      content: res.data
                    });
                    that.modal.loading = false;
                    setTimeout(function() {
                      that.modal.loading = true;
                    }, 0);
                  }
                }, 'json');
          }else{
            that.modal.loading = false;
            setTimeout(function() {
              that.modal.loading = true;
            }, 0);
          }
        }
        );
      },
      findUkey:function(){
        //查找ukey
       this.login_onclick();
      },
      //绑定用户ukey页面显示
      findUkeyHtml:function(){
        var that=this;
        var type=that.form.ukey.type;
        if(type==1){
          //增加宗地绑定页面显示
          that.modal.treeStateShow=false;
          that.modal.uKeyState=true;
        }else{
          //增加用户绑定页面显示
          that.modal.userKeyShow=false;
          that.modal.uKeyState=true;
        }
       // that.load();//进行ukey验证初始化
      },
      //用户ukey关系页面取消显示
      cancelUkeyHtml:function(){
        var that=this;
        //ukey——user页面取消显示
        that.modal.treeStateShow=false;
      },
      //禁用启用ukey
      openClose:function(a,b){
       var that=this;
        $.post(basePath + '/uKey/uKey-remove', {
          ukeyId: a,
          state:b
        }, function(res) {
          if (res.success) {
            var ukeyIdIndex=that.form.ukey.ukeyIdIndex;
            //判断宗地或者权限类型
            var type=that.form.ukey.type;
            if(type==1){
              that.form.ukey.ukeyIdList[ukeyIdIndex].state =b;
            }else{
              that.form.ukey.ukeyIdUserList[ukeyIdIndex].state =b;
            }
          }
        }, 'json');
      },
      //显示用户宗地ukey列表
      showUkey:function(){
        var that=this;
        var form = that.form.edit;
        //判断宗地或者权限类型
        var type=that.form.ukey.type;
        if(type==1){
          type=0;
        }else{
          type=1;
        }
        $.post(basePath + '/sys/get-user-ukey', {
          userId: form.userId,
          type:type
        }, function(res) {
          if (res.success) {
            if(type==0){
              that.form.ukey.ukeyIdList= res.data;
            }else{
              that.form.ukey.ukeyIdUserList= res.data;
            }
          }else {
            that.$Modal.error({
              content: res.data
            });
          }
        }, 'json');
      },
      //保存ukey_宗地——楼幢
      saveZdUKey:function(){
        var that=this;
        //获取楼幢
        //获取宗地
        //获取用户id ,获取ukey
        var userId=that.form.edit.userId;
        var ukeyId= that.form.ukey.ukeyId;
        var arr = that.$refs.zduKeyTree.getCheckedNodes();
        //筛选一级目录二级目录
        var copyArr=arr;
        for ( var t = copyArr.length-1, l = 0; t >= l; t--) {
          rt = copyArr[t];
          if (!rt.parent) {
            for ( var s = copyArr.length-1, l = 0; s>= l; s--) {
              rs = copyArr[s];
            if(rt.id==rs.parent){
              //数组移除
              arr.splice(s, 1);
            }
            }
          }
        }
        var zduKey=[];
        for ( var i = 0, l = arr.length; i < l; i++) {
          r = arr[i];
          if(!r.parent){
            var obj=r.id+"#**";
            zduKey.push(obj);
          }else{
            var obj=r.parent+'#'+r.id;
            zduKey.push(obj);
          }
        }
        if(ukeyId){
        $.ajax({
          async : false,
          cache : false,
          traditional: true,
          type : 'POST',
          data : {
            ukeyId: ukeyId,
            zduKey: zduKey
          },
          url : basePath + '/sys/modify-zd-ukey',// 请求的action路径
          success : function(res) {
            if (res.success) {
              that.modal.zduKeyShow=false;
              that.$Message.success({
                content: res.data
              });
            } else {
              that.$Message.error({
                content: res.data
              });
              that.modal.loading = false;
              setTimeout(function() {
                that.modal.loading = true;
              }, 0);
            }
          }
      });
    }else{
     //用户绑定	
    	 $.ajax({
             async : false,
             cache : false,
             traditional: true,
             type : 'POST',
             data : {
               userId: userId,
               zduKey: zduKey
             },
             url : basePath + '/sys/modify-zd-user',// 请求的action路径
             success : function(res) {
               if (res.success) {
                 that.modal.zduKeyShow=false;
                 that.$Message.success({
                   content: res.data
                 });
               } else {
                 that.$Message.error({
                   content: res.data
                 });
                 that.modal.loading = false;
                 setTimeout(function() {
                   that.modal.loading = true;
                 }, 0);
               }
             }
         });
    }   
      },
      saveUserUKey:function(){
        var that=this;
        //ukey——user页面取消显示
        that.modal.userKeyShow=false;
      },
      //ukey页面加载完执行 
      load:function(){
        var that = this;
      //如果是IE10及以下浏览器，则跳过不处理
        if(navigator.userAgent.indexOf("MSIE")>0 && !navigator.userAgent.indexOf("opera") > -1) return;
        try
        {
            var s_pnp=new SoftKey3W();
            s_pnp.Socket_UK.onopen = function() 
            {
             vm.form.bConnect=1;//代表已经连接，用于判断是否安装了客户端服务
            };
            //在使用事件插拨时，注意，一定不要关掉Sockey，否则无法监测事件插拨
            s_pnp.Socket_UK.onmessage =function got_packet(Msg) 
            {
                var PnpData = JSON.parse(Msg.data);
                if(PnpData.type=="PnpEvent")//如果是插拨事件处理消息
                {
                    if(PnpData.IsIn) 
                    {
                      that.$Modal.error({
                        content: 'UKEY已被插入'
                      });
                      return;
                    }
                    else
                    {
                      that.$Modal.error({
                        content: 'UKEY已被拨出'
                      });
                      return;
                    } 
                }
            };
            s_pnp.Socket_UK.onclose = function()
            {
            };
       }
       catch(e)  
       {  
         that.$Modal.error({
           content: e.name + ":" + e.message
         });
          return false;
        }  
    },
    //ukey验证
    login_onclick:function(){
      var that = this;
      //如果是IE10及以下浏览器，则使用AVCTIVEX控件的方式
      if(navigator.userAgent.indexOf("MSIE")>0 && !navigator.userAgent.indexOf("opera") > -1) {
        return this.Handle_IE10();
        }
    //判断是否安装了服务程序，如果没有安装提示用户安装
      var bConnect= this.form.bConnect;
      if(bConnect==0)
      {
        that.$Modal.error({
          content: '未能连接服务程序，请确定服务程序是否安装。'
        });
          return false;
      }
      var DevicePath,ret,n,mylen,ID_1,ID_2,addr;
      try
      {
              //由于是使用事件消息的方式与服务程序进行通讯，
              //好处是不用安装插件，不分系统及版本，控件也不会被拦截，同时安装服务程序后，可以立即使用，不用重启浏览器
              //不好的地方，就是但写代码会复杂一些
              var s_simnew1=new SoftKey3W(); //创建UK类
              s_simnew1.Socket_UK.onopen = function() {
              s_simnew1.ResetOrder();//这里调用ResetOrder将计数清零，这样，消息处理处就会收到0序号的消息，通过计数及序号的方式，从而生产流程
              };
           //写代码时一定要注意，每调用我们的一个UKEY函数，就会生产一个计数，即增加一个序号，较好的逻辑是一个序号的消息处理中，只调用我们一个UKEY的函数
          s_simnew1.Socket_UK.onmessage =function got_packet(Msg) 
          {
              var UK_Data = JSON.parse(Msg.data);
              // alert(Msg.data);
              if(UK_Data.type!="Process")return ;//如果不是流程处理消息，则跳过
              switch(UK_Data.order) 
              {
                  case 0:
                      {
                          s_simnew1.FindPort(0);//发送命令取UK的路径
                      }
                      break;//!!!!!重要提示，如果在调试中，发现代码不对，一定要注意，是不是少了break,这个少了是很常见的错误
                  case 1:
                      {
                          if( UK_Data.LastError!=0){
                            that.$Modal.error({
                              content: '未发现加密锁，请插入加密锁'
                            });
                          s_simnew1.Socket_UK.close();
                          return false;
                          } 
                          DevicePath=UK_Data.return_value;//获得返回的UK的路径
                          s_simnew1.GetID_1(DevicePath); //发送命令取ID_1
                      }
                      break;
                  case 2:
                      {
                          if( UK_Data.LastError!=0){ 
                            that.$Modal.error({
                              content: '返回ID号错误，错误码为:'+UK_Data.LastError.toString()
                            });
                            s_simnew1.Socket_UK.close();
                            return false;
                            } 
                          ID_1=UK_Data.return_value;//获得返回的UK的ID_1
                          s_simnew1.GetID_2(DevicePath); //发送命令取ID_2
                      }
                      break;
                   case 3:
                      {
                          if( UK_Data.LastError!=0){
                            that.$Modal.error({
                              content: '返回ID号错误，错误码为:'+UK_Data.LastError.toString()
                            });
                            s_simnew1.Socket_UK.close();
                            return false;
                            } 
                           ID_2=UK_Data.return_value;//获得返回的UK的ID_2
                           that.form.ukey.ukeyId=that.toHex(ID_1)+that.toHex(ID_2);
                           s_simnew1.Socket_UK.close();
                      }
                      break;
              }
          };
         s_simnew1.Socket_UK.onclose = function(){
          };
          return true;
      }
      catch (e) 
      {
        that.$Modal.error({
          content: e.name+':'+e.message
        });
      }
    },
    Handle_IE10:function(){
      var that = this;
      try
      {
         var DevicePath,mylen,ret;
         var s_simnew1;
         //创建控件
         s_simnew1=new ActiveXObject("Syunew3A.s_simnew3");
         DevicePath = s_simnew1.FindPort(0);//'来查找加密锁，0是指查找默认端口的锁
         if( s_simnew1.LastError!= 0 )
         {
             that.$Modal.error({
               content:'未发现加密锁，请插入加密锁'
             });
             s_simnew1.Socket_UK.close();
             return false;
         }
         else
         {
           that.form.ukey.ukeyId=that.toHex(s_simnew1.GetID_1(DevicePath))+that.toHex(s_simnew1.GetID_2(DevicePath));
           s_simnew1.Socket_UK.close();
             return true;
         }
       }
      catch(e)  
       {  
        that.$Modal.error({
          content:e.name+':' + e.message+'。可能是没有安装相应的控件或插件'
        });
         return false;
       }  
    },
    toHex:function(n){
      var digitArray = new Array('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f');
      var result = '';
      var start = true;
        for ( var i=32; i>0; ) {
                i -= 4;
                var digit = ( n >> i ) & 0xf;
                if (!start || digit != 0) {
                        start = false;
                        result += digitArray[digit];
                }
        }
        return ( result == '' ? '0' : result );
    }
    },
    mounted: function() {
      var that = this;
      //that.load();//进行ukey验证初始化
      that.getPage();
    }
  });

vm.$Message.config({
  duration: 3
});
setTimeout(function() {
  $(window).resize(function() {
    vm.tableHeight = $('#main').height() - $('#search').height() - 5;
  }).resize();
}, 500);