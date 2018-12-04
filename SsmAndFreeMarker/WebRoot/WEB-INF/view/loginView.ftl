<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
  if(window.top!=window){
    window.top.location.href = '${basePath}/login';
  }
</script>
<#include "/css.ftl"/>
<style type="text/css">
body{text-align:center;height:100%;overflow:auto;min-width:960px;/* background:url(static/image/bg.jpg) no-repeat; */background-color: rgba(45,140,240,.2);;background-size:cover;}
/* .login-main{padding:200px 0 30px;position:relative;height:100%} 
.login{position:absolute;right:100px;width:400px;}*/
.login{margin: auto;width:400px;top:200px;}
.error{color:#ed3f14}
</style>
<#include "/js.ftl"/>
<script type="text/javascript" src="${basePath}/static/libs/jsencrypt.min.js"></script>
</head>
<body>
  <div class="login-main">
    <Card id="login" class="login">
      <div style="font-size:24px;color:#3091f2">系统管理登录</div>
      <i-Form id="form" action="${basePath}/doLogin" method="post" ref="form" :model="form" :rules="rules" style="padding:30px 0" inline>
        <Icon type="ios-person-outline" size="35"></Icon>
        <Form-item prop="userId">
          <i-Input name="userId" size="large" style="width:250px" placeholder="用户名" :maxlength="30" v-model="form.userId" @on-enter="submit">
          </i-input>
        </Form-item><br>
        <Icon type="ios-locked-outline" size="35"></Icon>
        <Form-item prop="userPwd">
          <i-Input id="pwd" name="userPwd" type="password" size="large" style="width:250px" :maxlength="30" placeholder="密    码" v-model="form.userPwd" @on-enter="submit">
          </i-input>
        </Form-item>
        <i-button type="primary" size="large" @click="submit('form')" style="width:80%;margin:0 auto">登        陆</i-button>
        <div class="error">${msg!}</div>
      </i-Form>
    </Card>
  </div>
  <script type="text/javascript">
    var publicKey = '${publicKey?js_string}';
  </script>
  <script type="text/javascript" src="${basePath}/static/js/loginView.js"></script>
</body>
</html>