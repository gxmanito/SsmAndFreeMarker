package gx.sys.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import gx.base.BaseController;
import gx.common.Page;
import gx.common.SimpleJSONResult;
import gx.sys.service.RoleService;
import gx.sys.entity.SysRole;
import gx.util.CommonUtil;

/**
 * 角色管理
 * 
 * @author gx
 * 
 */
@Controller
@RequestMapping("/sys")
public class RoleController extends BaseController {
  @Resource
  private RoleService roleService;

  // 角色管理
  @RequestMapping("/role")
  public String role() {
    return "sys/roleView";
  }

  // 获取角色分页
  @RequestMapping("/role-getPage")
  @ResponseBody
  public SimpleJSONResult getRole(Integer pageSize, Integer pageNo,
      String sysId, String roleName, String roleId) {
    if (sysId == null) {
      return failureJsonResult("缺少必要参数");
    }
    Map<String, Object> params = CommonUtil.newHashMapWithExpectedSize(3);
    params.put("sysId", sysId);
    if (StringUtils.isNotBlank(roleName)) {
      params.put("roleName", roleName);
    }
    if (StringUtils.isNotBlank(roleId)) {
      params.put("roleId", roleId);
    }
    Page<SysRole> page = new Page<SysRole>(SysRole.class);
    if (pageSize != null) {
      page.setPageSize(pageSize);
    }
    if (pageNo != null) {
      page.setPageNo(pageNo);
    }
    page.setParams(params);
    roleService.getRole(page);
    return successJsonResult(page);
  }

  // 删除角色

  @RequestMapping("/role-remove")
  @ResponseBody
  public SimpleJSONResult removeRole(String sysId, String roleId) {
    if (sysId == null) {
      return failureJsonResult("缺少必要参数");
    }
    // 删除角色 and 角色--权限
    roleService.removerRole(sysId, roleId);
    return successJsonResult("删除成功");
  }

  // 编辑修改角色
  @RequestMapping("/role-modify")
  @ResponseBody
  public SimpleJSONResult modify(@Valid SysRole sysRole, BindingResult br) {
    roleService.modifyRole(sysRole.getSysId(), sysRole.getRoleId(),
        sysRole.getRoleName(), sysRole.getRemarks());
    return successJsonResult("修改成功");
  }

  // 创建角色
  @RequestMapping("/role-create")
  @ResponseBody
  public SimpleJSONResult create(@Valid SysRole sysRole, BindingResult br) {
    roleService.createRole(sysRole.getSysId(), sysRole.getRoleId(),
        sysRole.getRoleName(), sysRole.getRemarks());
    return successJsonResult("创建成功");
  }

  // 判断角色id是不是重复
  @RequestMapping("/role-check")
  @ResponseBody
  public SimpleJSONResult checkRole(String sysId, String roleId) {
    if (sysId == null || roleId == null) {
      return failureJsonResult("缺少必要参数");
    }

    if (roleService.checkRole(sysId, roleId)) {
      return successJsonResult("正常");
    }
    return failureJsonResult("角色id已经存在");
  }

  // 资源转换为json字符串
  @RequestMapping("/role-getResource")
  @ResponseBody
  public SimpleJSONResult getResource(String sysId, String roleId)
      throws JsonProcessingException {
    if (sysId == null || roleId == null) {
      return failureJsonResult("缺少必要参数");
    }
    return successJsonResult(roleService.getRoleResource(sysId, roleId));
  }

  // 角色和资源的关联
  @RequestMapping("/role-resource")
  @ResponseBody
  public SimpleJSONResult modifyResource(String sysId, String roleId,
      String resIds) {
    if (sysId == null || roleId == null) {
      return failureJsonResult("缺少必要参数");
    }
    roleService.modifyRoleResource(sysId, roleId, resIds);
    return successJsonResult("设置资源成功");
  }

  // 获取角色对应的权限
  @RequestMapping("/role-getPermission")
  @ResponseBody
  public SimpleJSONResult getPermission(String sysId, String roleId) {
    if (sysId == null || roleId == null) {
      return failureJsonResult("缺少必要参数");
    }
    return successJsonResult(roleService.getRolePermission(sysId, roleId));
  }

  // 保存角色对应权限
  @RequestMapping("/role-permission")
  @ResponseBody
  public SimpleJSONResult modifyPermission(String sysId, String roleId,
      String permission) {
    if (sysId == null || roleId == null) {
      return failureJsonResult("缺少必要参数");
    }
    roleService.modifyRolePermission(sysId, roleId, permission);
    return successJsonResult("成功");
  }
}
