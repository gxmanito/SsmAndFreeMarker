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
        showRole: false
      },
      form: {
        // 编辑表单信息
        edit: {
          type:0,
          userId: '',
          userName: '',
          //ukeyid
          ukeyId:''
        },
        // 查询表单信息
        search: {
          userId: '',
          userName: '',
        //ukeyid
          ukeyId:''
        },
        // 最后一次查询表单信息
        lastSearch: {},
        bConnect:0//uKey是否安装程序状态
      },
      roles: [],
      // 表单验证规则
      rule: {
        ukeyId: [{
          required: true,
          message: 'ukey必须填写',
          trigger: 'blur'
        }],
        userId: [{
          required: true,
          message: 'userId必须填写',
          trigger: 'blur'
        }],
      },
      // 表格列属性
      columns: [
          {
            title: 'uKeyId',
            key: 'ukeyId',
            align: 'center'
          },
        {
          title: '帐号',
          key: 'userId'
        },
        {
          title: '创建时间',
          key: 'remarks',
          align: 'center'
        },
        {
          title: '用途',
          width: 230,
          align: 'center',
          render: function(h, params) {
            var that=this;
           var form = $.extend({}, params.row);
            var state=form.state;
            if(state==1){
              return "权限管理";
              }else{
                return "宗地(权限)管理";
                }
          }
        },
        {
          title: '状态',
          width: 230,
          render: function(h, params) {
            var that=this;
           var form = $.extend({}, params.row);
            var state=form.state;
            if(state==1){
              return "未绑定";
              }else if(state==2){
                return "已启用";
                }else{
                return "已禁用";
                }
          }
        },
        {
          title: '操作',
          width: 330,
          render: function(h, params) {
            return h(
              'div',
              [
            params.row.state==2?
                h('Button', {
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  on: {
                    click: function() {
                      var that = vm, userId = params.row.userId, index = params.index,ukeyId=params.row.ukeyId;
                      that.$Modal.confirm({
                        content: '确认禁用该' + ukeyId,
                        loading: true,
                        onOk: function() {
                          $.post(basePath + '/uKey/uKey-remove', {
                            ukeyId: ukeyId,
                            state:3
                          }, function(res) {
                            that.$Modal.remove();
                            if (res.success) {
                              that.$Message.success({
                                content: res.data
                              });
                              params.row.state=3;
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
                }, '禁用'): h('Button', {
                  props: {
                    type: 'info',
                    size: 'small'
                  },
                  on: {
                    click: function() {
                      var that = vm, userId = params.row.userId, index = params.index,ukeyId=params.row.ukeyId;
                      that.$Modal.confirm({
                        content: '确认启动该' + ukeyId,
                        loading: true,
                        onOk: function() {
                          $.post(basePath + '/uKey/uKey-remove', {
                            ukeyId: ukeyId,
                            state:2
                          }, function(res) {
                            that.$Modal.remove();
                            if (res.success) {
                              that.$Message.success({
                                content: res.data
                              });
                              params.row.state=2;
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
                }, '启动'),
                h(
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
                          var that = vm, userId = params.row.userId, index = params.index,ukeyId=params.row.ukeyId;
                          that.$Modal.confirm({
                            content: '确认删除吗' + ukeyId,
                            loading: true,
                            onOk: function() {
                              $.post(basePath + '/uKey/uKey-delete', {
                                ukeyId: ukeyId
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
                    }, '删除')
              ]);
          }
        }],
      // 分页信息
      page: {
        totalCount: 0,
        pageNo: 1,
        pageSize: 10,
        results: []
      },
      dict:{
        name:['绑定宗地(权限)']
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
        $.post(basePath + '/uKey/uKey-getPage', p, function(res) {
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
        this.$refs.ukeyForm.resetFields();
        // 控制弹框标题显示
        that.modal.editIdx = -1;
        // 新增按钮弹框
        that.modal.showEdit = true;
        //that.load();
      },
      // 创建或编辑保存
      save: function() {
        var that = this;
        that.$refs.ukeyForm.validate(function(valid) {
          if (valid) {
            var ukeyId=that.form.edit.ukeyId;
            var userId=that.form.edit.userId;
            var type=that.form.edit.type;
            $.post(basePath + '/uKey/uKey-create',
                {ukeyId:ukeyId,
                 type:type,
                userId:userId
              },
              function(res) {
                if (res.success) {
                  that.modal.showEdit = false;
                  that.$Message.success({
                    content: res.data
                  });
                    that.$refs.searchForm.resetFields();
                    that.form.search.ukeyId=ukeyId;
                    that.search();
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
      resetForm: function() {
        this.$refs.searchForm.resetFields();
        this.getPage();
      },
      findUkey:function(){
        //查找ukey
       this.login_onclick();
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
                           that.form.edit.ukeyId=that.toHex(ID_1)+that.toHex(ID_2);
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
           that.form.edit.ukeyId=that.toHex(s_simnew1.GetID_1(DevicePath))+that.toHex(s_simnew1.GetID_2(DevicePath));
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
      that.load();
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