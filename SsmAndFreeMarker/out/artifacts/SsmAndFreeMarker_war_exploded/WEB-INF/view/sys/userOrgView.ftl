<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<title>用户机构管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "/css.ftl"/>
<#include "/js.ftl"/>
</head>
<body>
  <div id="main" class="main">
	  <div id="search" v-show="modal.showButton">
	    <i-button type="info" @click="createRes">新增</i-button>
	  </div>
    <i-Table :columns="columns" :data="data" :height="tableHeight" :show-header="false" :highlight-row="true" class="tree-grid"></i-Table>
    
    <Modal v-model="modal.showEdit" :title="modal.title" :loading="modal.loading" :closable="false" closable='true' :mask-closable="false" width="500" @on-ok="save" v-cloak>
      <i-form ref="formInline" :model="userOrgForm" :rules="ruleInline" :label-width="90" inline>
        <Form-item prop="code" label="编号">
          <i-Input type="text" v-model="userOrgForm.code" :disabled="modal.editIdx!=-1" placeholder="请输入" style="width: 300px">
          </i-Input>
        </Form-item>
        <Form-item prop="name" label="名称">
          <i-Input type="text" v-model="userOrgForm.name" placeholder="请输入" style="width: 300px" :maxlength='500'>
          </i-Input>
        </Form-item>
        <Form-item prop="phone" label="电话号码">
          <i-Input type="text" v-model="userOrgForm.phone" placeholder="请输入" style="width: 300px" >
          </i-Input>
        </Form-item>
        <Form-item prop="certType" label="证件类型">
          <i-select v-model="userOrgForm.certType" style="width:300px">
	          <i-option  value="6" >组织机构代码</i-option>
	          <i-option  value="7" >营业执照</i-option>
	          <i-option  value="99" >其他</i-option>
          </i-select>
        </Form-item> 
        <Form-item prop="busiLicense" label="证件号码">
          <i-Input v-model="userOrgForm.busiLicense"  placeholder="请输入" style="width:300px" :maxlength='220'>
          </i-Input>
        </Form-item>
        <Form-item prop="delegate" label="企业法人">
          <i-Input v-model="userOrgForm.delegate"  placeholder="请输入" style="width:300px" :maxlength='120'>
          </i-Input>
        </Form-item>
        <Form-item  label="填充位置" v-show="modal.editIdx==-1">
          <i-select v-model="userOrgForm.befor" style="width:300px">
            <i-option v-for="(s,i) in dict.beforList" :key="i" :value="i" >{{ s }}</i-option>
          </i-select>
        </Form-item> 
        <Form-item prop="address" label="联系地址">
          <i-Input v-model="userOrgForm.address"  placeholder="请输入" style="width:300px" :maxlength='500'>
          </i-Input>
        </Form-item>
        <Form-item prop="delegatePhone" label="法人电话">
          <i-Input v-model="userOrgForm.delegatePhone"  placeholder="请输入" style="width:300px" >
          </i-Input>
        </Form-item>
        <Form-item prop="remarks" label="备注">
          <i-Input v-model="userOrgForm.remarks" type="textarea" :autosize="true" placeholder="请输入备注信息" style="width:300px" :maxlength='120'>
          </i-Input>
        </Form-item>
      </i-form>
    </Modal>
  </div>
  <script type="text/javascript" src="${basePath}/static/js/sys/userOrgView.js"></script>
 </body>
</html>