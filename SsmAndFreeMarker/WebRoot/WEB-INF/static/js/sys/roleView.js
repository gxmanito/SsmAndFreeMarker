/**
 * 用户管理
 */
var vm = new Vue({
  el: '#main',
  data: {
    tableHeight: 200,
    // 搜索条件
    form: {
      search: {
        sysId: '00',
        roleId: '',
        roleName: ''
      },
      lastSearch: {},
      edit: {
        roleName: '',
        remarks: '',
        roleId: ''
      },
      rules: {
        roleId: [{
          required: true,
          message: '角色编号必须填写',
          trigger: 'blur'
        }, {
          validator: function(rule, value, callback) {
            var that = vm;
            if (!/^\w+$/.test(value)) {
              callback(new Error('必须由数字、英文字母或者下划线组成'));
              return;
            }
            if (vm.modal.editIdx == -1) {
              $.post(basePath + '/sys/role-check', {
                sysId: that.form.edit.sysId,
                roleId: value
              }, function(res) {
                if (res.success) {
                  callback();
                } else {
                  callback(new Error(res.data));
                }
              }, 'json');
            } else {
              callback();
            }
          },
          trigger: 'blur'
        }],
        roleName: [{
          required: true,
          message: '角色名称必须填写',
          trigger: 'blur'
        }]
      },
      permission: []
    },
    modal: {
      loading: true,
      title: '',
      showEdit: false,
      editIdx: -1,
      showResource: false,
      showPermission: false
    },
    resource: [{
      expand: true,
      title: '角色资源',
      children: []
    }],
    permission: [],
    columns: [{
      title: '角色编号',
      key: 'roleId',
      align: 'center'
    }, {
      title: '角色名称',
      key: 'roleName',
      align: 'center'
    }, {
      title: '角色描述',
      key: 'remarks'
    }, {
      title: '操作',
      key: 'action',
      align: 'center',
      render: function(h, params) {
        return h('div', [h('Button', {
          style: {
            marginLeft: '5px'
          },
          props: {
            type: 'info',
            size: 'small'
          },
          on: {
            click: function() {
              // 编辑点击事件
              var that = vm;
              that.form.edit = $.extend({}, params.row);
              that.modal.editIdx = params.index;
              that.modal.title = '编辑角色';
              that.modal.showEdit = true;
            }
          }
        }, '编辑'), h('Button', {
          style: {
            marginLeft: '5px'
          },
          props: {
            type: 'info',
            size: 'small'
          },
          on: {
            click: function() {
              // 设置资源
              var that = vm, p = $.extend({}, params.row);
              $.post(basePath + '/sys/role-getPermission', p, function(res) {
                if (res.success) {
                  var data = res.data, checked = [];
                  that.permission = data;
                  for ( var i = 0, l = data.length; i < l; i++) {
                    if (data[i].id) {
                      checked.push(data[i].id);
                    }
                  }
                  that.form.permission = checked;
                }
              }, 'json');
              that.form.edit = p;
              that.modal.showPermission = true;// 弹出权限页面
            }
          }
        }, '设置权限'), h('Button', {
          style: {
            marginLeft: '5px'
          },
          props: {
            type: 'info',
            size: 'small'
          },
          on: {
            click: function() {
              // 设置资源
              var that = vm, p = $.extend({}, params.row);
              $.post(basePath + '/sys/role-getResource', p, function(res) {
                if (res.success) {
                  that.resource = res.data;
                }
              }, 'json');
              // 编辑状态
              that.form.edit = p;
              that.modal.showResource = true;
            }
          }
        }, '设置资源'), params.row.roleId == 'admin' ? '' : h('Button', {
          style: {
            marginLeft: '5px'
          },
          props: {
            type: 'error',
            size: 'small'
          },
          on: {
            click: function() {
              // 删除点击事件
              var that = vm, r = params.row, i = params.index;
              that.$Modal.confirm({
                content: '确认删除',
                loading: true,
                onOk: function() {
                  $.post(basePath + '/sys/role-remove', {
                    sysId: r.sysId,
                    roleId: r.roleId
                  }, function(res) {
                    var page = that.page;
                    that.$Modal.remove();
                    if (res.success) {
                      if (page.results.length == 1 && page.pageNo != 1) {
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
        }, '删除')]);
      }
    }],
    dict: {
      sysId: []
    },
    page: {
      totalCount: 0,
      pageNo: 1,
      pageSize: 10,
      results: []
    }
  },
  methods: {
    // 获取页数
    changePage: function(page) {
      this.page.pageNo = page;
      this.getPage(this.form.lastSearch);
    },
    getPage: function(params) {
      var that = this, page = that.page, p = $.extend({
        pageSize: page.pageSize,
        pageNo: page.pageNo
      }, params ? params : that.form.search);
      $.post(basePath + '/sys/role-getPage', p, function(res) {
        if (res.success) {
          that.page = res.data;
        } else {
          that.$Modal.error({
            content: res.data
          });
        }
      }, 'json');
    },
    // 查询
    search: function() {
      var that = this;
      that.$refs.searchForm.validate(function(valid) {
        if (valid) {
          that.page.pageNo = 1;
          that.getPage();
          that.form.lastSearch = $.extend({}, that.form.search);
        }
      });
    },
    // 新增按钮
    add: function() {
      // 清空表单的数据
      this.$refs.roleForm.resetFields();
      this.form.edit.sysId = this.form.search.sysId;
      this.modal.editIdx = -1;
      this.modal.title = '新增角色';
      this.modal.showEdit = true;
    },
    // 新增、编辑窗口确定 保存
    save: function() {
      var that = this, form = that.form.edit, editIdx = that.modal.editIdx, p;
      that.$refs.roleForm.validate(function(valid) {
        if (valid) {
          p = {
            sysId: form.sysId,
            roleName: form.roleName,
            remarks: form.remarks,
            roleId: form.roleId
          };
          // 验证成功保存数据
          $.post(basePath
            + (editIdx == -1 ? "/sys/role-create" : "/sys/role-modify"), p,
            function(res) {
              if (res.success) {
                if (editIdx == -1) {
                  that.$refs.searchForm.resetFields();
                  that.form.search.roleId = p.roleId;
                  that.search();
                } else {
                  that.page.results[editIdx].roleName = p.roleName;
                  that.page.results[editIdx].remarks = p.remarks;
                }
                that.modal.showEdit = false;
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
        } else {
          that.modal.loading = false;
          setTimeout(function() {
            that.modal.loading = true;
          }, 0);
        }
      });
    },
    resSave: function() {
      var that = this, form = that.form.edit, arr = that.$refs.resTree
        .getCheckedNodes(), res = {}, resIds;

      for ( var i = 0, l = arr.length; i < l; i++) {
        var parent = arr[i].parent;
        res[arr[i].id] = true;
        if (parent) {
          res[parent] = true;
        }
      }
      resIds = $.map(res, function(n, i) {
        return i;
      }).join();
      // 进行操作
      $.post(basePath + '/sys/role-resource', {
        sysId: form.sysId,
        roleId: form.roleId,
        resIds: resIds
      }, function(res) {
        if (res.success) {
          that.$Modal.remove();
          that.modal.showResource = false;
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
    permissionSave: function() {
      // 保存角色用户
      var that = this, form = that.form.edit, permission = that.form.permission
        .join();

      $.post(basePath + '/sys/role-permission', {
        sysId: form.sysId,
        roleId: form.roleId,
        permission: permission
      }, function(res) {
        if (res.success) {
          that.$Modal.remove();
          that.modal.showPermission = false;
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
    reset: function() {
      this.$refs.searchForm.resetFields();
      this.getPage();
    }
  },
  mounted: function() {
    var that = this;
    $.post(basePath + '/common/getSysId', function(res) {
      // 前后台交互的数据 得到状态
      that.dict.sysId = res.data;
    });

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
