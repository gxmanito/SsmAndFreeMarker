<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<title>数据字典管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "/css.ftl"/>
<#include "/js.ftl"/>
</head>
<body>
  <div id="main" class="main">
    <Card id="search" class="header" dis-hover>
      <i-Form ref="searchForm" :model="form.search" :rules="form.searchRules" :label-width="80" inline :rules="search.rules">
        <Form-item label="代码类型" prop="codeType">
          <i-Input v-model="form.search.codeType" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <Form-item label="类型名称" prop="typeName">
          <i-Input v-model="form.search.typeName" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <Form-item label="代码" prop="code">
          <i-Input v-model="form.search.code" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <Form-item label="代码名称" prop="name">
          <i-Input v-model="form.search.name" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <i-Button type="primary" size="large" @click="search">查  询</i-Button>
        <i-Button type="primary" size="large" @click="create">新 增</i-Button>
        <i-Button type="primary" size="large" @click="reset">重 置</i-Button>
        <Page show-total size="small" :total="page.totalCount" :current="page.pageNo" @on-change="changePage" class="fr"></Page>
      </i-Form>
      <span class="clear"></span>
    </Card>
    <i-Table ref="table" :columns="columns" :data="page.results" :height="tableHeight" border highlight-row></i-Table>
  
    <Modal v-model="modal.showForm" :title="modal.editIdx!=-1?'编辑':'新增'" :closable="true" @on-ok="handleSubmit" @on-cancel="handleReset" :loading="modal.loading" width="500" :mask-closable="false">
      <i-Form ref="editForm" :model="form.edit" :label-width="100" :rules="form.rules">
        <Form-item label="代码类型" prop="codeType">
            <Input-number v-model="form.edit.codeType" :disabled="modal.editIdx!=-1" size="large" style="width: 300px" :min="0" max="255" placeholder="请输入代码类型"></Input-number>
        </Form-item>
        <Form-item label="类型名称" prop="typeName">
            <i-Input v-model="form.edit.typeName" size="large" style="width: 300px" placeholder="请输入类型名称"></i-Input>
        </Form-item>
         <Form-item label="代码" prop="code">
            <i-Input v-model="form.edit.code" :disabled="modal.editIdx!=-1" size="large" style="width: 300px" placeholder="请输入代码"></i-Input>
        </Form-item>
        <Form-item label="名称" prop="name">
            <i-Input v-model="form.edit.name" size="large" style="width: 300px" placeholder="请输入名称"></i-Input>
        </Form-item>
         <Form-item label="备注" prop="remarks">
          <i-Input v-model="form.edit.remarks" :autosize="true"  style="width: 300px"  type="textarea" size="large" placeholder="请输入备注">
           </i-Input>
        </Form-item>
      </i-Form>
    </Modal>
  </div>
  <script type="text/javascript" src="${basePath}/static/js/sys/dictView.js"></script>
</body>
</html>