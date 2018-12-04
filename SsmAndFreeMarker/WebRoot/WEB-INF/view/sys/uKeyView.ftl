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
         <Form-item label="ukey" prop="ukeyId">
          <i-Input name="ukeyId" v-model="form.search.ukeyId" size="large" @on-enter="search"></i-Input>
        </Form-item>
        <i-Button type="primary" size="large" @click="search">查  询</i-Button>
        <i-Button type="primary" size="large" @click="create">新  增</i-Button>
        <i-Button type="primary" size="large" @click="resetForm">重置</i-Button>
      </i-Form>
      <Page show-total size="small" :total="page.totalCount" :current="page.pageNo" @on-change="changePage" class="fr"></Page>
      <span class="clear"></span>
    </Card>
    <i-Table ref="table" :columns="columns" :data="page.results" :height="tableHeight" border highlight-row></i-Table>
   
    <Modal v-model="modal.showEdit" title="创建ukey"  :loading="modal.loading" :closable="true" :mask-closable="false" width="500" @on-ok="save" v-cloak>
     <i-Form :label-width="80" ref="ukeyForm" :model="form.edit" :rules="rule" inline>
       <Form-item prop="ukeyId" label="ukey">
       <i-Input size="large" v-model="form.edit.ukeyId" style="width: 200px"></i-Input>
        </Form-item>
        <i-Button type="primary" @click="findUkey()">查找ukey</i-Button>
          <Form-item prop="userId" label="userId">
         <i-Input size="large" v-model="form.edit.userId" style="width: 200px"></i-Input>
        </Form-item>
         <Form-item size="large" label="类别" >
         <i-select v-model="form.edit.type" style="width:200px">
         <i-Option v-for="(s,i) in dict.name" :value="i">{{s}}</i-Option>        
         </i-select>
          </Form-item>
         </i-Form>
    </Modal>

    <Modal v-model="modal.showMask" :mask-closable="false" width="70" class="mask">
      <Icon type="load-a" size="50" class="spin"></Icon>
      <span slot="footer"></span>
    </Modal>
  </div>
   <script type="text/javascript" src="${basePath}/static/js/sys/Syunew3.js"></script>
  <script type="text/javascript" src="${basePath}/static/js/sys/uKeyView.js"></script>
</body>
</html>