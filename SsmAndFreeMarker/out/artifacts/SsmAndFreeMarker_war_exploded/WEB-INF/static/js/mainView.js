/**
 * 主页
 */
var vm = new Vue({
  el: '#main',
  data: {
    user: {},
    userOrg:{},
    pwd: {
      oPwd: '',
      nPwd: '',
      rPwd: ''
    },
    time: [],
    navVisiable: true,
    loading: true,
    showUserInfo: false,
    showModifyPwd: false,
    showOrgInfo:false,
    searcher: {
      text: '',
      result: []
    },
    open: [],
    active: 0,
    menu: {},
    tab: [],
    certType:{
      6:'组织机构代码',
      7:'营业执照',
      99:'其他'
    },
    // 验证密码
    formRules: {
      oPwd: [{
        required: true,
        message: '旧密码必须填写',
        trigger: 'blur'
      }, {
        validator: function(rule, value, callback) {
          // 验证旧密码是否正确
          var encrypt = new JSEncrypt();
          encrypt.setPublicKey(publicKey);
           var oPwd = encrypt.encrypt(value);
          $.post(basePath + '/common/user-checkPwd', {
            userPwd:oPwd
          }, function(res) {
            if (!res.success) {
              // 重复
              callback(new Error('旧密码错误'));
            } else {
              callback();
            }
          }, 'json');
        },
        trigger: 'blur'
      }],
      nPwd: [{
        required: true,
        message: '必须填写',
        trigger: 'blur'
      }, {
        pattern: '^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z_]{6,20}$',
        message: '6-20位 字、数字或下划线组成,必须同时包含字母和数字',
        trigger: 'blur'
      }],
      rPwd: [{
        required: true,
        message: '必须填写',
        trigger: 'blur'
      }, {
        // 验证密码两次输入是不是一致
        validator: function(rule, value, callback) {
          // 验证旧密码是否正确
          var nPwd = vm.pwd.nPwd;
          if (value != nPwd) {
            callback(new Error('两次密码不一致'));
          } else {
            callback();
          }
        },
        trigger: 'blur'
      }]
    },
    rule: {
      // 个人资料信息验证
      user: {
        userName: [{
          required: true,
          message: '不能为空',
          trigger: 'blur'
        }, {
          max: 15,
          message: '长度不能大于15',
          trigger: 'blur'
        }],
        mobilePhone: [{
          pattern: '^(((\\d{3,4}-{0,1}){0,1}\\d{7,8}(-{0,1}\\d{3,4}){0,1})|(1[3|4|5|7|8]\\d{9}))$',
          message: '电话格式错误',
          trigger: 'blur'
        }],
        email: [{
          type: 'email',
          message: '邮箱格式错误'
        }]
      }
    }
  },
  computed: {
    navLeft: function() {
      return this.navVisiable ? '282px' : '32px';
    }
  },
  methods: {
    // 新增--返回按钮
    handleReset: function() {
      // 清空验证消息
      var that = this;
      this.$refs.pwdRules.resetFields();
      this.showModifyPwd = false;
    },
    // 查询动作
    search: function() {
      var t = this.searcher.text, items = this.menu.items, sr = [];
      if (t.length > 1) {
        for ( var i in items) {
          var item = items[i];
          if (i.indexOf(t) != -1 || item.resPy.indexOf(t) != -1
              || item.resName.indexOf(t) != -1) {
            sr.push(item);
          }
        }
        this.searcher.result = sr;
      }
    },
    // 查询选项选择
    searchSelect: function(name) {
      this.searcher.text = '';
      this.searcher.result = [];
      this.openTab(name);
    },
    // 打开菜单
    openTab: function(name) {
      var tab = this.tab, t;

      if (this.active == name) {
        return;
      }
      for ( var i = 0, l = tab.length; i < l; i++) {
        t = tab[i];
        if (t.resId == name) {
          this.active = name;
          this.open = [t.parent];
          this.$nextTick(function() {
            this.$refs.nav.updateOpened();
            this.$refs.nav.updateActiveName();
          });
          return;
        }
      }
      t = this.menu.items[name];
      tab.push(t);
      this.active = name;
      this.open = [t.parent];
      this.$nextTick(function() {
        this.$refs.nav.updateOpened();
        this.$refs.nav.updateActiveName();
      });
    },
    // 关闭tab
    closeTab: function(name) {
      var tab = this.tab, t;
      this.$nextTick(function() {
        this.$refs.nav.updateOpened();
        this.$refs.nav.updateActiveName();
      });
      for ( var i = 0, l = tab.length; i < l; i++) {
        t = tab[i];
        if (t.resId == name) {
          tab = tab.splice(i, 1);
          return;
        }
      }
    },
    // 顶部菜单选择
    topMenuSelect: function(name) {
      if (name == 'exit') {
        window.location.href = basePath + '/logout';
      } else if (name == 'info') {
        this.showUserInfo = true;
      } else if (name == 'pwd') {
        this.showModifyPwd = true;
      }else if(name == 'userOrg'){
        this.showOrgInfo = true;
        this.showOrg();
      }
    },
    modifyUser: function() {
      // 修改用户
      var that = this;
      form = that.$refs.userRules;
      form.validate(function(valid) {
        if (valid) {
          // 验证通过
          $.post(basePath + '/common/user-modifyInfo', {
            userName: that.user.userName,
            sex: that.user.sex,
            mobilePhone: that.user.mobilePhone,
            email: that.user.email
          }, function(res) {
            if (res.success) {
              // 重复
              that.$Modal.success({
                title: '结果信息',
                content: res.data
              });
              that.showUserInfo = false;
            } else {
              that.$Modal.error({
                title: '错误',
                content: res.data
              });
              that.loading = false;
              setTimeout(function() {
                vm.loading = true;
              }, 0);
            }
          }, 'json');
        } else {
          vm.loading = false;
          setTimeout(function() {
            vm.loading = true;
          }, 0);
        }
      });
    },
    modifyPwd: function() {
      // 修改密码提交
      var that = this;
      var t=that.pwd;
      form = that.$refs.pwdRules;
      form.validate(function(valid) {
        if (valid) {
          var encrypt = new JSEncrypt();
          encrypt.setPublicKey(publicKey);
          that.pwd.oPwd= encrypt.encrypt(that.pwd.oPwd);
          // 验证通过
          $.post(basePath + '/common/user-modifyPwd', {
            oPwd: that.pwd.oPwd,
            nPwd: that.pwd.nPwd
          }, function(res) {
            if (res.success) {
              // 重复
              vm.$Modal.success({
                title: '结果信息',
                content: res.data
              });
              that.showModifyPwd = false;
            } else {
              that.$Modal.error({
                title: '错误',
                content: res.data
              });
              that.loading = false;
              setTimeout(function() {
                that.loading = true;
              }, 0);
            }
          }, 'json');
        } else {
          that.loading = false;
          setTimeout(function() {
            that.loading = true;
          }, 0);
        }
      });
    },
    showOrg:function(){
      $.post(basePath + '/common/user-getOrgInfo',function(res) {
        if (res.success) {
          vm.userOrg = 
             res.data;
        }
      }, 'json');
    },
    closeUserOrg:function(){
      //关闭组织机构弹框
      this.showOrgInfo = false;
    }
  }
});

$(window).resize(function() {
  vm.navVisiable = $('#main').width()>960;
}).resize();