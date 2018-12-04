/**
 * 登陆
 */
var vm = new Vue({
  el: '#login',
  data: {
    form: {
      userId: '',
      userPwd: ''
    },
    rules: {
      userId: [{
        required: true,
        message: '请填写用户名',
        trigger: 'blur'
      }],
      userPwd: [{
        required: true,
        message: '请填写密码',
        trigger: 'blur'
      }, {
        type: 'string',
        min: 5,
        message: '密码长度不能小于5位',
        trigger: 'blur'
      }]
    }
  },
  methods: {
    submit: function() {
      var that = this;
      that.$refs.form.validate(function(valid) {
        if (valid) {
          var encrypt = new JSEncrypt();
          encrypt.setPublicKey(publicKey);
          that.form.userPwd = encrypt.encrypt(that.form.userPwd);
          that.$nextTick(function(){
            document.getElementById('form').submit();
          });
        }
      });
    }
  }
});