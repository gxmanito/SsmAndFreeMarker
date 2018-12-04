<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<title>嗨嗨嗨</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "/css.ftl"/>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/mainView.css">
<#include "/js.ftl"/>
<!-- Js参数RSA加密传输-->
<script type="text/javascript" src="${basePath}/static/libs/jsencrypt.min.js"></script>
<script type="text/javascript" src="${basePath}/static/libs/moment/moment.min.js"></script>
</head>
<body>
  <div id="main" class="layout">
    <!-- 头部 -->
    <Card class="layout-header">
      <div class="logo"><!-- <h2 style="font-size: 30px;">SSM+Shiro+freemarker</h2> --><img src="static/image/zxxq_03.jpg"><span style="position:absolute;font-size:30px;line-height:72px;left:450px;color:#2b85e4"></span></div>
      <i-Menu class="header-right" mode="horizontal" @on-select="topMenuSelect" v-cloak>
        <Menu-item name="clock" class="clock">
          <span>{{time[0]}}</span><br><span>{{time[1]}}</span>
        </Menu-item>
        <Submenu name="user">
          <template slot="title"><Icon type="person"></Icon><span>{{user.userName}}</span></template>
          <Menu-item name="info">个人资料</Menu-item>
          <Menu-item name="pwd">修改密码</Menu-item>
          <Menu-item name="userOrg">所属机构</Menu-item>
        </Submenu>
        <Menu-item name="exit" style="font-size:25px" title="退出系统">
          <Icon type="android-exit"></Icon>
        </Menu-item>
      </i-Menu>
    </Card>

    <!-- 左侧导航 -->
    <Card class="layout-sider" v-if="navVisiable">
      <!--<Dropdown @on-click="searchSelect" class="search" v-cloak>
        <i-Input v-model="searcher.text" size="large" icon="search" @on-change="search" placeholder="请输入菜单码或名称">
        </i-input>
        <Dropdown-menu slot="list">
          <Dropdown-item v-for="i in searcher.result" :name="i.resId">{{i.resName+'('+i.resId+')'}}</Dropdown-item>
        </Dropdown-menu>
      </Dropdown>-->
      <div class="">
        <i-Menu ref="nav" width="auto" :active-name="active" :open-names="open" @on-select="openTab" class="nav" accordion v-cloak>
          <Submenu v-for="m in menu.subMenu" :name="m.resId">
            <span slot="title"><Icon :type="m.icon||'document'"></Icon>{{m.resName}}</span>
            <Menu-item v-for="i in m.items" :name="i.resId" :title="'(菜单码：'+i.resId+')'+(i.remark||'')">{{i.resName}}</Menu-item>
          </Submenu>
        </i-Menu>
      </div>
    </Card>
    <span class="nav-btn" :class="[navVisiable?'nav-btn-hide':'nav-btn-show']"  @click="navVisiable=!navVisiable">{{navVisiable?'隐藏菜单':'显示菜单'}}</span>
    <!-- 主体 -->
    <div class="layout-body" :style="{'margin-left':navLeft}">
      <Tabs v-model="active" type="card" closable :animated="false" @on-tab-remove="closeTab" class="body">
        <#-- <Tab-pane name="0" label="首页" :closable="false">
        </Tab-pane> -->
        
        <Tab-pane v-for="p in tab" :key="p.resId" :name="p.resId" :label="p.resName">
          <iframe frameborder="0" width="100%" height="100%" :src="'${basePath}'+p.resUrl">
          </iframe>
        </Tab-pane>
      </Tabs>
    </div>
    <div class="layout-footer">&copy;追逐工作室</div>
    
    <Modal v-model="showUserInfo" :title="'修改个人信息 - '+user.userId" :loading="loading" :width="400" @on-ok="modifyUser" :closable="false" @on-cancel="handleReset">
	    <i-Form ref="userRules" :label-width="90" :model="user" :rules="rule.user">
	      <Form-item label="姓名">
	        <i-Input size="large" v-model="user.userName" style="width:220px" disabled></i-Input>
	      </Form-item>
	      <Form-item prop="sex" size="large" label="性别">
          <i-Select v-model="user.sex" style="width:220px">
            <i-Option :value="0">未知</i-Option>
            <i-Option :value="1">男</i-Option>
            <i-Option :value="2">女</i-Option>
          </i-Select>
        </Form-item>
        <Form-item prop="mobilePhone" label="电话">
          <i-Input size="large" v-model="user.mobilePhone" style="width:220px"></i-Input>
        </Form-item>
        <Form-item prop="email" label="邮箱">
          <i-Input size="large" v-model="user.email" style="width:220px"></i-Input>
        </Form-item>
	    </i-Form>
	  </Modal>
	  
	  <Modal v-model="showModifyPwd" :title="'修改密码 - '+user.userId" :loading="loading" :width="400" @on-ok="modifyPwd" @on-cancel="handleReset">
      <i-Form  ref="pwdRules" :label-width="90" :model="pwd" :rules="formRules">
        <Form-item  label="旧密码" prop="oPwd">
          <i-Input size="large" v-model="pwd.oPwd" style="width:220px" type="password"></i-Input>
        </Form-item>
        <Form-item prop="nPwd" label="新密码" style="margin-top:35px">
          <i-Input size="large" v-model="pwd.nPwd" style="width:220px" type="password"></i-Input>
        </Form-item>
        <Form-item prop="rPwd" label="确认密码" style="margin-top:35px">
          <i-Input size="large" v-model="pwd.rPwd" style="width:220px" type="password"></i-Input>
        </Form-item>
      </i-Form>
    </Modal>
    
    <Modal v-model="showOrgInfo" :title="'所属机构- '+user.userId" :loading="loading" :width="500" @on-ok="closeUserOrg">
      <Row>
        <i-Col span="12">机构名称：{{userOrg.name}}</i-Col>
        <i-Col span="12">联系电话：{{userOrg.phone}}</i-Col>
      </Row>
      <Row>
        <i-Col span="12">证件种类：{{certType[userOrg.certType]}}</i-Col>
        <i-Col span="12">证件号码：{{userOrg.busiLicense}}</i-Col>
      </Row>
      <Row >
        <i-Col span="12">法人代表：{{userOrg.delegate}}</i-Col>
        <i-Col span="12">法人电话：{{userOrg.delegatePhone}}</i-Col>
      </Row>
      <Row>
        <i-Col span="12">地址：{{userOrg.address}}</i-Col>
      </Row>
    </Modal>
    
  </div>
   <script type="text/javascript">
    var publicKey = '${publicKey?js_string}';
  </script>
  <script type="text/javascript" src="${basePath}/static/js/mainView.js"></script>
  <script>
    var time=moment('${.now}','YYYY-MM-DD HH:mm:ss').add(1,'s'),
      refreshClock=function(){
        vm.time = time.add(1,'s').format('YYYY年MM月DD日-dddd HH:mm:ss').split('-');
        setTimeout(refreshClock, 1000);
      };
      vm.user=${user};
      vm.menu=(function(ms){
        if(ms.length && ms[0].resType===0){
          var menu={subMenu:[],items:{}},subMenu=menu.subMenu,items=menu.items,last,curr;
          for(var i=0,l=ms.length;i<l;i++){
            curr = ms[i];
            curr.resId=curr.resId+'';
            if(curr.resType===0){
              if(last){
                subMenu.push(last);
              }
              last = curr;
              last.items=[];
            } else{
              items[curr.resId]=curr;
              last.items.push(curr);
            }
          }
          if(last){
            subMenu.push(last);
          }
          return menu;
        } else{
          return {};
        }
      })(${userMenu!'[]'});
      vm.open = [vm.menu.subMenu[0].resId]
      vm.$nextTick(function() {
        this.$refs.nav.updateOpened();
      });
      refreshClock();
  </script>
</body>
</html>
