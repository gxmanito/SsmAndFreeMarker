/**
 * 用户管理
 */
var vm = new Vue(
  {
    el: '#main',
    data: {
      tableHeight: 200,
      form: {
        search: {
          codeType: '',
          typeName: '',
          code: '',
          name: ''
        },
        lastSearch: {},
        edit: {},
        searchRules:{
          codeType: [{
            pattern: '^((\\d{1,2})|([0-2][0-5]{2}))$',
            message: '请输入0-255之间的数字',
            trigger: 'blur'
          }]
        },
        rules: {
          codeType: [{
            type: 'number',
            required: true,
            message: '代码类型不能为空',
            trigger: 'blur'
          }],
          typeName: [{
            required: true,
            message: '类型名称不能为空',
            trigger: 'blur'
          }, {
            max: 15,
            message: '长度不能大于15',
            trigger: 'blur'
          }],
          code: [{
            required: true,
            message: '代码不能为空',
            trigger: 'blur'
          }, {
            max: 10,
            message: '长度不能大于10',
            trigger: 'blur'
          }, {
            validator: function(rule, value, callback) {
              var that = vm, form;
              if (!/^\w*$/.test(value)) {
                callback(new Error('请输入数字、字母和下划线'));
                return;
              }
              if (that.modal.editIndex == -1) {
                // 根据代码类型和代码判断重复
                form = that.form.edit;
                $.post(basePath + '/sys/dict-check', {
                  codeType: form.codeType,
                  code: form.code
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
          name: [{
            required: true,
            message: '名称不能为空',
            trigger: 'blur'
          }, {
            max: 40,
            message: '长度不能大于40',
            trigger: 'blur'
          }],
          remarks: [{
            max: 100,
            message: '长度不能大于120',
            trigger: 'blur'
          }]
        }
      },
      columns: [{
        title: '代码类型',
        key: 'codeType',
        width: 100,
        align: 'center'
      }, {
        title: '类型名称',
        key: 'typeName',
        width: 200,
        align: 'center'
      }, {
        title: '代码',
        key: 'code',
        width: 120,
        align: 'center'
      }, {
        title: '代码名称',
        key: 'name',
        width: 300,
        align: 'center'
      }, {
        title: '备注',
        key: 'remarks'
      }, {
        title: '操作',
        key: 'action',
        width: 130,
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
                // 点击编辑
                var that = vm;
                that.form.edit = $.extend({}, params.row);
                that.modal.showForm = true;
                that.modal.editIdx = params.index;// 编辑
              }
            }
          }, '编辑'), h('Button', {
            style: {
              marginLeft: '5px'
            },
            props: {
              type: 'error',
              size: 'small'
            },
            on: {
              click: function() {
                var that = vm, r = params.row, i = params.index;
                that.$Modal.confirm({
                  content: '确定要删除',
                  loading: true,
                  onOk: function() {
                    $.post(basePath + '/sys/dict-remove', {
                      codeType: r.codeType,
                      code: r.code
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
      // 对话框相关的
      modal: {
        // 模糊查询表单
        // 是否显示按钮加载动画
        loading: true,
        // 弹出编辑或者新增页面
        showForm: false,
        // 编辑
        editIdx: -1
      },
      // 分页
      page: {
        totalCount: 0,
        pageNo: 1,
        pageSize: 10,
        results: []
      },
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
        $.post(basePath + '/sys/dict-getPage', p, function(res) {
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
        var that=this;
        that.$refs.searchForm.validate(function(valid){
          if(valid){
            that.page.pageNo = 1;
            that.getPage();
            that.form.lastSearch = $.extend({}, that.form.search);
          }
        });
      },
      // 新增
      create: function() {
        var that = this;
        that.form.edit = {
          // 代码类型
          codeType: null,
          // 类型名称
          typeName: '',
          // 代码
          code: '',
          // 名称
          name: '',
          // 备注
          remarks: ''
        };
        // 显示新增弹框
        that.modal.showForm = true;
        // 新增模式
        that.modal.editIdx = -1;
      },
      // 新增--返回按钮
      handleReset: function() {
        // 清空验证消息
        var that = this;
        form = that.$refs.editForm;
        form.resetFields();
        that.modal.showForm = false;
      },
      // 新增--确定按钮
      handleSubmit: function() {
        var that = this, editIdx = that.modal.editIdx, p;
        that.$refs.editForm.validate(function(valid) {
          if (valid) {
            p = $.extend({}, that.form.edit);
            $.post(basePath
              + (editIdx == -1 ? '/sys/dict-create' : '/sys/dict-modify'), p,
              function(res) {
                if (res.success) {
                  if (editIdx == -1) {
                    that.$refs.searchForm.resetFields();
                    that.form.search.codeType = p.codeType;
                    that.search();
                  } else {
                    that.page.results[editIdx].typeName = p.typeName;
                    that.page.results[editIdx].name = p.name;
                    that.page.results[editIdx].remarks = p.remarks;
                  }
                  that.modal.showForm = false;
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
      reset: function() {
        this.$refs.searchForm.resetFields();
        this.getPage();
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
    vm.tableHeight = $('#main').height() - $('#search').height() - 5;
  }).resize();
}, 500);