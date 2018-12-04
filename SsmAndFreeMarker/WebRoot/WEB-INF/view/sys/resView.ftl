<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "/css.ftl"/>
<style type="text/css">
.icon{font-size:32px;margin:0 3px;cursor:pointer;}
</style>
<#include "/js.ftl"/>
</head>
<body>
  <div id="main" class="main">
	  <Card id="search" class="header" dis-hover>
	    <i-Form :label-width="80" inline>
	      <Form-item label="系统">
	        <i-select v-model="sysId" style="width:150px" @on-change="getPage">
            <i-option v-for="i in dict.sysId" :value="i.id" >{{i.name}}</i-option>
          </i-select>
	      </Form-item>
	      <i-button type="info" @click="createRes">新增</i-button>
	    </i-Form>
	  </Card>
	  
    <i-Table :columns="columns" :data="resources" :height="tableHeight" :show-header="false" :highlight-row="true" class="tree-grid"></i-Table>
 
    <Modal v-model="modal.showEdit" :title="modal.title" :loading="modal.loading" :closable="true" :mask-closable="false" width="500" @on-ok="save" v-cloak>
      <i-form ref="formInline" :model="resourceForm" :rules="ruleInline" :label-width="90" inline>
        <Form-item prop="resId" label="资源ID值:">
          <i-Input v-model="resourceForm.resId" :disabled="modal.editIdx!=-1" placeholder="请输入资源主键值" style="width: 300px">
          </i-Input>
        </Form-item>
        <Form-item prop="resName" label="资源名称:">
          <i-Input v-model="resourceForm.resName" placeholder="请输入资源名称" style="width: 300px" :maxlength="20">
          </i-Input>
        </Form-item>
        <Form-item prop="resUrl" label="资源地址:">
          <i-Input v-model="resourceForm.resUrl" placeholder="请输入资源地址" style="width: 300px" :maxlength="100">
          </i-Input>
        </Form-item>
        <Form-item prop="icon" label="显示图标:">
          <i-Input v-model="resourceForm.icon" style="width:300px" placeholder="请选择要显示的图标">
            <i-Button slot="append" @click="modal.showIcons=true" icon="ios-search"></i-Button>
          </i-Input>
        </Form-item>
        <Form-item prop="permission" label="权限:" v-show="resourceForm.lvl==2">
          <i-Input type="text" v-model="resourceForm.permission" placeholder="请输入权限" style="width: 300px" :maxlength="5">
          </i-Input>
        </Form-item>
        <Form-item prop="state" label="状态：">
          <i-select v-model="resourceForm.state" style="width:100px">
            <i-option v-for="(s,i) in dict.statusList" :value="i" >{{ s }}</i-option>
          </i-select>
        </Form-item>   
        <Form-item label="填充位置:" v-show="modal.editIdx==-1 && resources.length!=0">
          <i-select v-model="resourceForm.befor" style="width:100px">
            <i-option v-for="(s,i) in dict.beforList" :key="i" :value="i" >{{ s }}</i-option>
          </i-select>
        </Form-item> 
        <Form-item prop="remarks" label="备注:">
          <i-Input v-model="resourceForm.remarks" type="textarea" :autosize="true" placeholder="请输入备注信息" style="width:300px" :maxlength="120">
          </i-Input>
        </Form-item>
      </i-form>
    </Modal>

    <Modal v-model="modal.showIcons" title="选择图标" width="700" class="modal-hideFooter" v-cloak>
      <icon v-for="i in dict.iconList" :type="i" :title="i" class="icon" @click.native.prevent="iconSelect(i)"></icon>
    </Modal>
  </div>
  <script type="text/javascript" src="${basePath}/static/js/sys/resView.js"></script>
 </body>
</html>