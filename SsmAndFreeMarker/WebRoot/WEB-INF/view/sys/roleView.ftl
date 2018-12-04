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
      <i-Form ref="searchForm" :model="form.search" label-width="80" inline>
        <Form-item label="系统">
          <i-select v-model="form.search.sysId" style="width:150px" @on-change="search">
            <i-option v-for="i in dict.sysId" :value="i.id" >{{i.name}}</i-option>
          </i-select>
        </Form-item>
        <Form-item label="角色编号" prop="roleId">
          <i-Input name="roleId" v-model="form.search.roleId" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <Form-item label="角色名称"  prop="roleName">
          <i-Input name="roleName" v-model="form.search.roleName" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <i-Button type="primary" size="large" @click="search">查  询</i-Button>
        <i-Button type="primary" size="large" @click="add">新 增</i-Button>
        <i-Button type="primary" size="large" @click="reset">重置</i-Button>
      </i-Form>
      <Page show-total size="small" :total="page.totalCount" :current="page.pageNo" @on-change="changePage" class="fr"></Page>
      <span class="clear"></span>
    </Card>
    <i-Table ref="table" :columns="columns" :data="page.results" :height="tableHeight" border highlight-row></i-Table>

    <Modal :title="modal.title" v-model="modal.showEdit"  :loading="modal.loading" :closable="true" :mask-closable="false" width="500px" @on-ok="save" v-cloak>
      <i-Form ref="roleForm" :model="form.edit" :rules="form.rules" :label-width="90" inline>
        <Form-item prop="roleId" label="角色编号">
          <i-Input type="text" v-model="form.edit.roleId" :disabled="modal.editIdx!=-1"  placeholder="请输入角色编号" style="width: 300px" maxlength='5'>
          </i-Input>
        </Form-item>
        <Form-item prop="roleName" label="角色名称" >
          <i-Input type="text" v-model="form.edit.roleName"  placeholder="请输入角色名称" style="width: 300px" maxlength='15'>
          </i-Input>
        </Form-item>
        <Form-item prop="remarks" label="备注">
          <i-Input v-model="form.edit.remarks" type="textarea" :autosize="true"  placeholder="请输入备注信息" style="width:300px" maxlength='125'>
          </i-Input>
        </Form-item>
      </i-Form>
    </Modal>
    
    <Modal  title="设置角色资源" v-model="modal.showResource" :loading="modal.loading" :closable="true" :mask-closable="false" width="500px" @on-ok="resSave" v-cloak>
      <Tree ref="resTree" :data="resource" show-checkbox></Tree>
    </Modal>
    
    <Modal  title="设置角色权限" v-model="modal.showPermission" :loading="modal.loading" :closable="true" :mask-closable="false" width="500px" @on-ok="permissionSave" v-cloak>
      <Checkbox-group v-model="form.permission">
        <div v-for="p in permission" >
          <Checkbox :label="p.name">{{p.name}}&nbsp;&nbsp;&nbsp;&nbsp;({{p.remarks}})</Checkbox>
        </div>
      </Checkbox-group>
    </Modal>
  </div>
  <script type="text/javascript" src="${basePath}/static/js/sys/roleView.js"></script>
</body>
</html>