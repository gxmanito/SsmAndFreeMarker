/**
 * 用户管理
 */
var vm = new Vue(
  {
    el: '#main',
    data: {
      tableHeight: 200,
      modal: {
        // 新增弹框
        showEdit: false,
        title: '',
        editIdx: -1,
        // 新增按钮的显示
        showButton: false,
        // 确定按钮旋转加载
        loading: true
      },
      // 表单信息
      userOrgForm: {
        code: '',
        parent: '',
        name: '',
        phone: '',
        busiLicense: '',
        delegate: '',
        remarks: '',
        lvl: 0,
        lft: 1,
        rgt: 2,
        befor: 0,
        // 证件类型
        certType: 6,
        // 联系地址
        address: '',
        // 法人电话
        delegatePhone: ''
      },
      // 字典
      dict: {
        beforList: []
      },
      // 验证数据
      ruleInline: {
        code: [{
          required: true,
          message: '必须填写',
          trigger: 'blur'
        }, {
          validator: function(rule, value, callback) {
            var that = vm;
            if (!/^[a-zA-Z0-9_.-]*$/.test(value)) {
              callback('必须为数字字母或者_或者-');
              return;
            }
            // 在新增情况下验证
            if (that.modal.editIdx == -1) {
              $.post(basePath + '/sys/userOrg-check', {
                code: value
              }, function(res) {
                if (res.success) {
                  callback();
                } else {
                  callback(new Error('机构代码已经存在'));
                }
              }, 'json');
            } else {
              callback();
            }
          },
          trigger: 'blur'
        }],
        name: [{
          required: true,
          message: '必须填写',
          trigger: 'blur'
        }],
        phone: [{
          pattern: '^(((\\d{3,4}-{0,1}){0,1}\\d{7,8}(-{0,1}\\d{3,4}){0,1})|(1[3|4|5|7|8]\\d{9}))$',
          message: '手机格式错误',
          trigger: 'blur'
        }],
        delegatePhone: [{
          pattern: '^(((\\d{3,4}-{0,1}){0,1}\\d{7,8}(-{0,1}\\d{3,4}){0,1})|(1[3|4|5|7|8]\\d{9}))$',
          message: '电话格式错误',
          trigger: 'blur'
        }]
      },
      // 资源管理列
      columns: [
        {
          title: '系统资源',
          render: function(h, params) {

            var row = params.row, type = row.lvl;
            return h('div', {
              style: {
                'padding-left': (18 * row.lvl) + 'px'
              }
            }, [
              h('Icon', {
                props: {
                  type: row.lft == row.rgt ? 'link'
                    : row.lft < row.rgt ? 'location' : 'ios-folder'
                }
              }), h('span', row.name), h('span', {
                style: {
                  color: '#ed3f14'
                }
              }, ' (' + row.code + ')')]);
          }
        },
        {
          title: '操作',
          width: 400,
          align: 'center',
          render: function(h, params) {
            return h(
              'div',
              [
                h(
                  'Button',
                  {
                    props: {
                      type: 'info',
                      size: 'small'
                    },
                    style: {
                      marginRight: '5px'
                    },
                    on: {
                      click: function() {
                        var that = vm, row = params.row, modal = that.modal, form = that.userOrgForm;
                        that.$refs.formInline.resetFields();
                        form.parent = row.parent;
                        form.lvl = row.lvl;
                        // 左值
                        form.lft = row.lft;
                        // 右值
                        form.rgt = row.rgt;
                        form.befor = '1';
                        that.dict.beforList = {
                          1: '之前',
                          2: '之后'
                        };
                        // 标题的显示
                        modal.title = row.name + '-新增同级';
                        // 编辑或者新增状态
                        modal.editIdx = -1;
                        // 弹框的显示
                        modal.showEdit = true;
                      }
                    }
                  }, '新增同级'),
                h(
                  'Button',
                  {
                    props: {
                      type: 'info',
                      size: 'small'
                    },
                    style: {
                      marginRight: '5px'
                    },
                    on: {
                      click: function() {
                        var that = vm, row = params.row, modal = that.modal, form = that.userOrgForm;
                        that.$refs.formInline.resetFields();
                        form.parent = row.code;
                        form.code = row.code;
                        form.lvl = row.lvl + 1;
                        // 左值
                        form.lft = row.lft;
                        // 右值
                        form.rgt = row.rgt;
                        form.befor = '3';
                        that.dict.beforList = {
                          3: '最前',
                          4: '最后'
                        };
                        // 标题的显示
                        modal.title = row.name + '-新增子级';
                        // 编辑或者姓曾状态
                        modal.editIdx = -1;
                        // 弹框的显示
                        modal.showEdit = true;
                      }
                    }
                  }, '新增子级'),
                h(
                  'Button',
                  {
                    props: {
                      type: 'success',
                      size: 'small'
                    },
                    style: {
                      marginRight: '5px'
                    },
                    on: {
                      click: function() {
                        var that = vm, row = params.row, modal = that.modal, form = that.userOrgForm;
                        that.$refs.formInline.resetFields();
                        that.userOrgForm = $.extend({}, row);
                        modal.title = row.name + '-编辑';
                        modal.editIdx = params.index;
                        modal.showEdit = true;
                      }
                    }
                  }, '编辑'), h('Button', {
                  props: {
                    type: 'error',
                    size: 'small'
                  },
                  style: {
                    marginRight: '5px'
                  },
                  on: {
                    click: function() {
                      var that = vm;
                      that.$Modal.confirm({
                        content: '确认删除',
                        loading: true,
                        onOk: function() {
                          var row = params.row;
                          $.post(basePath + '/sys/userOrg-remove', {
                            // 主键
                            code: row.code,
                            lft: row.lft,
                            // 右值
                            rgt: row.rgt,
                          }, function(res) {
                            that.$Modal.remove();
                            if (res.success) {
                              that.getPage();
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
              // , h('Button', {
              // props : {
              // type : 'info',
              // size : 'small'
              // },
              // style : {
              // marginRight : '5px'
              // },
              // on : {
              // click : function() {
              // this.remove(params.index);
              //
              // }
              // }
              // }, '上移'), h('Button', {
              // props : {
              // type : 'info',
              // size : 'small'
              // },
              // style : {
              // marginRight : '5px'
              // },
              // on : {
              // click : function() {
              // this.remove(params.index);
              // }
              // }
              // }, '下移')
              ]);
          }
        }],
      data: []
    },
    methods: {
      getPage: function() {
        var that = this;
        $.post(basePath + '/sys/userOrg-get', function(res) {
          // 前后台交互的数据
          that.data = res.data;
          that.modal.showButton = res.data.length === 0;
        });
      },
      // 点击保存按钮
      save: function() {
        var that = this;
        form = that.$refs.formInline;
        form
          .validate(function(valid) {
            var param = that.userOrgForm, befor = param.befor, editIdx = that.modal.editIdx, p;
            if (valid) {
              if (editIdx == -1) {
                switch (befor) {
                case '1':// 之前
                  param.rgt = param.lft + 1;
                  break;
                case '2':// 之后
                  param.lft = param.rgt + 1;
                  param.rgt = param.lft + 1;
                  break;
                case '3':// 最前
                  param.lft = param.lft + 1;
                  param.rgt = param.lft + 1;
                  break;
                case '4':// 最后
                  param.lft = param.rgt;
                  param.rgt = param.lft + 1;
                  break;
                }
              }
              p = $.extend({}, param);

              $.post(basePath
                + (editIdx == -1 ? "/sys/userOrg-create"
                  : "/sys/userOrg-modify"), p, function(res) {
                if (res.success) {
                  if (editIdx == -1) {
                    that.getPage();
                  } else {
                    that.data[editIdx].name = p.name;
                    that.data[editIdx].phone = p.phone;
                    that.data[editIdx].certType = p.certType;
                    that.data[editIdx].busiLicense = p.busiLicense;
                    that.data[editIdx].address = p.address;
                    that.data[editIdx].delegate = p.delegate;
                    that.data[editIdx].delegatePhone = p.delegatePhone;
                    that.data[editIdx].remarks = p.remarks;
                  }
                  that.modal.showEdit = false;
                  that.$Message.success({
                    content: res.data
                  });
                } else {
                  that.$Message.error({
                    title: '错误',
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
      createRes: function() {
        // 数据库没有资源的时候第一次增加数据
        var that = this;
        // 弹框的显示
        that.modal.showEdit = true,
        // 标题的显示
        that.modal.title = '新增机构';
        // 编辑或者姓曾状态
        that.modal.editIdx = -1;
        that.$refs.formInline.resetFields();
        that.userOrgForm.lvl = 0;
        // 左值
        that.userOrgForm.lft = 1;
        // 右值
        that.userOrgForm.rgt = 2;
      }
    },
    mounted: function() {
      this.getPage();
    }
  });

vm.$Message.config({
  duration: 3
});

setTimeout(function() {
  $(window).resize(function() {
    var s = $('#search'), h = s.is(':visible') ? s.height() : 0;
    vm.tableHeight = $('#main').height() - h - 5;
  }).resize();
}, 500);
