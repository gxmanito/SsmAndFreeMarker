package gx.sys.service;

import java.util.List;

import gx.common.IviewTreeNode;
import gx.common.Page;
import gx.common.SimpleCode;
import gx.sys.entity.SysRole;

/**
 * 角色服务
 * 
 * @author gx
 * 
 */
public interface RoleService {
  /**
   * 获取全部角色列表
   */
  void getRole(Page<SysRole> page);
  
  /**
   * 获取角色
   */
  boolean checkRole(String sysId, String roleId);

  /**
   * 添加角色
   * 
   * @param roleId 角色id
   * @param roleName 角色名称
   * @param remarks 备注
   */
  void createRole(String sysId, String roleId, String roleName, String remarks);

  /**
   * 更新角色
   * 
   * @param roleId 角色id
   * @param roleName 角色名称
   * @param remarks 备注
   */
  void modifyRole(String sysId, String roleId, String roleName, String remarks);

  /**
   * 删除角色
   * 
   * @param roleId 角色id(不能为空)
   */
  void removerRole(String sysId, String roleId);

  /**
   * 获取角色资源
   * 
   * @param sysId
   * @param roleId
   * @return
   */
  List<IviewTreeNode> getRoleResource(String sysId, String roleId);

  /**
   * resourceRoleDao 角色---资源的操作
   */
  void modifyRoleResource(String sysId, String roleId, String resIds);

  /**
   * 通过角色id通过角色对应的权限
   */
  List<SimpleCode> getRolePermission(String sysId, String roleId);

  /**
   * 修改角色资源关系
   * 
   * @param roleId 角色id(不能为空)
   * @param permission 权限(不能为空)
   */
  void modifyRolePermission(String sysId, String roleId, String permission);

}
