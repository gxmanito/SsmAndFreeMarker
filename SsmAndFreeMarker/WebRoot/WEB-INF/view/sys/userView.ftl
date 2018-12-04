<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "/css.ftl"/>
<#include "/js.ftl"/>
</head>
<body>
  <div id="main" class="main">
    <Card id="search" class="header" shadow>
      <i-Form ref="searchForm" :model="form.search" :label-width="80" inline v-cloak>
        <Form-item label="账号" prop="userId">
          <i-Input name="userId" v-model="form.search.userId" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <Form-item label="名称" prop="userName">
          <i-Input name="userName" v-model="form.search.userName" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <i-Button type="primary" size="large" @click="search">查  询</i-Button>
        <i-Button type="primary" size="large" @click="create">新  增</i-Button>
        <i-Button type="primary" size="large" @click="resetForm">重置</i-Button>
      </i-Form>
      <Page show-total size="small" :total="page.totalCount" :current="page.pageNo" @on-change="changePage" class="fr"></Page>
      <span class="clear"></span>
    </Card>
    <i-Table ref="table" :columns="columns" :data="page.results" :height="tableHeight" border highlight-row></i-Table>
    
    <Modal v-model="modal.showInfo" title="用户信息" :closable='true' v-cloak>
	    <Row><i-Col span="12">帐号:{{form.edit.userId}}</i-Col><i-Col span="12">姓名:{{form.edit.userName}}</i-Col></Row>
	    <Row><i-Col span="24">所属机构:{{form.edit.orgName }}</i-Col></Row>
	    <Row><i-Col span="12">电话:{{form.edit.mobilePhone}}</i-Col><i-Col span="12">邮箱:{{form.edit.email}}</i-Col></Row>
	    <Row><i-Col span="12">性别:{{dict.sex[form.edit.sex]}}</i-Col><i-Col span="12">状态:{{dict.state[form.edit.state]}}</i-Col></Row>
	    <Row><i-Col span="24">备注:{{form.edit.remarks}}</i-Col></Row>
	  </Modal>

	  <Modal v-model="modal.showEdit" :title="modal.editIdx==-1?'创建用户':'修改用户'"  :loading="modal.loading" :closable="true" :mask-closable="false" width="500" @on-ok="save" v-cloak>
	    <i-Form :label-width="80" ref="editForm" :model="form.edit" :rules="rule" inline>
	      <Form-item  label="帐号"  prop="userId"> 
          <i-Input size="large" v-model="form.edit.userId" :disabled="modal.editIdx!=-1" style="width: 300px" placeholder="请输入帐号" :maxlength="20"></i-Input>
        </Form-item>
	      <Form-item prop="userName" label="姓名" >
	        <i-Input size="large" v-model="form.edit.userName" style="width: 300px" placeholder="请输入姓名" :maxlength="20"></i-Input>
	      </Form-item>
	      <Form-item prop="userOrg" label="所属机构" >
          <Dropdown @on-click="orgSelect" trigger="click">
		        <i-Input v-model="form.edit.userOrg" size="large" icon="search" @on-change="searchOrg" placeholder="请输入机构码或名称" style="width: 300px">
		        </i-input>
		        <Dropdown-menu slot="list">
		          <Dropdown-item v-for="(l,v) in dict.userOrg" :name="v">{{l+'('+v+')'}}</Dropdown-item>
		        </Dropdown-menu>
		      </Dropdown>
        </Form-item>
        <Form-item prop="orgName">
          <i-Input size="large" v-model="form.edit.orgName" disabled style="width: 300px"></i-Input>
        </Form-item>
	      <Form-item prop="mobilePhone" label="电话">
	        <i-Input size="large" v-model="form.edit.mobilePhone" style="width: 300px"></i-Input>
	      </Form-item>
	      <Form-item prop="email" label="邮箱">
	        <i-Input size="large" v-model="form.edit.email" style="width: 300px" :maxlength="175"></i-Input>
	      </Form-item><br>
	      <Form-item size="large" label="性别" >
          <i-Select v-model="form.edit.sex" style="width:100px">
            <i-Option v-for="(s,i) in dict.sex" :value="i">{{s}}</i-Option>
          </i-Select>
        </Form-item>
	      <Form-item label="状态" >
          <i-Select v-model="form.edit.state" style="width:100px">
            <i-Option v-for="(s,i) in dict.state" :value="i">{{s}}</i-Option>
          </i-Select>
        </Form-item><br>
	      <Form-item prop="remarks" label="备注">
          <i-Input type="textarea" size="large" :autosize="true" v-model="form.edit.remarks" style="width: 300px"></i-Input>
        </Form-item>
	    </i-Form>
	  </Modal>

	  <Modal  title="设置用户角色" v-model="modal.showRole"   :loading="modal.loading"  :closable="true" :mask-closable="false" width="600px" @on-ok="roleSave" v-cloak>
      <Tree ref="roleTree" :data="roles" show-checkbox></Tree>
    </Modal>
    
	  <Modal v-model="modal.showMask" :mask-closable="false" width="70" class="mask">
	    <Icon type="load-a" size="50" class="spin"></Icon>
      <span slot="footer"></span>
    </Modal>
    
    <!-- 绑定key -->
     <Modal  title="绑定用户key" v-model="modal.uKeyState"   :loading="modal.loading"  :closable="true" :mask-closable="false" width="600px" @on-ok="uKeySave" v-cloak>
        <i-Form :label-width="80" ref="ukeyForm" :model="form.ukey" :rules="ruleUkey" inline>
       <Form-item prop="ukeyId" label="ukey">
       <i-Input size="large" v-model="form.ukey.ukeyId" style="width: 300px"></i-Input>
        </Form-item>
        <i-Button type="primary" @click="findUkey()">查找ukey</i-Button>
         </i-Form>
    </Modal>
    <!-- 用户ukey对应关系 -->
     <Modal  title="查看用户宗地Ukey"  v-model="modal.treeStateShow"  :mask-closable="false" @on-ok="cancelUkeyHtml" width="600px"  v-cloak>
     <i-Table  :columns="columnsUkey" :data="form.ukey.ukeyIdList"  border highlight-row></i-Table>
     <i-Button type="primary" @click="findUkeyHtml()">绑定宗地ukey</i-Button>
    </Modal>
    
    <!-- ukey绑定宗地 -->
     <Modal   :title="form.ukey.ukeyId?'Ukey绑定宗地':'user绑定宗地'"  v-model="modal.zduKeyShow"  @on-ok="saveZdUKey" :mask-closable="false" width="600px"  v-cloak>
     <Tree ref="zduKeyTree":data="form.ukey.zduKeybaseData" show-checkbox></Tree>
    </Modal>
    <!-- 用户绑定key -->
     <Modal   title="用户绑定key"  v-model="modal.userKeyShow"  @on-ok="saveUserUKey" :mask-closable="false" width="600px"  v-cloak>
     <i-Table  :columns="columnsUserUkey" :data="form.ukey.ukeyIdUserList"  border highlight-row></i-Table>
     <i-Button type="primary" @click="findUkeyHtml()">用户绑定ukey</i-Button>
    </Modal>
  </div>
  <script type="text/javascript" src="${basePath}/static/js/sys/Syunew3.js"></script>
  <script type="text/javascript" src="${basePath}/static/js/sys/userView.js"></script>
</body>
</html>