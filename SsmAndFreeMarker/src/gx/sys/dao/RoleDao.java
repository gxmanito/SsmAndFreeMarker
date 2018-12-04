package gx.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gx.common.Page;
import gx.common.SimpleCode;
import gx.sys.entity.SysResource;
import gx.sys.entity.SysRole;

/**
 * 角色dao
 * 
 * @author gx
 * 
 */
@Repository
public interface RoleDao {
  /**
   * 获取全部角色列表
   */
  void selectRole(Page<SysRole> page);

  /**
   * 根据id查询角色
   * 
   * @param sysId
   * @param roleId
   * @return
   */
  SysRole selectRoleById(@Param("sysId") String sysId,
      @Param("roleId") String roleId);

  /**
   * 添加角色
   * 
   * @param sysId 系统id
   * @param roleId 角色id
   * @param roleName 角色名称
   * @param remarks 备注
   */
  void insertRole(@Param("sysId") String sysId, @Param("roleId") String roleId,
      @Param("roleName") String roleName, @Param("remarks") String remarks);

  /**
   * 更新角色
   * 
   * @param sysId 系统id
   * @param roleId 角色id
   * @param roleName 角色名称
   * @param remarks 备注
   */
  void updateRole(@Param("sysId") String sysId, @Param("roleId") String roleId,
      @Param("roleName") String roleName, @Param("remarks") String remarks);

  /**
   * 删除角色
   * 
   * @param sysId 系统id
   * @param roleId 角色id(不能为空)
   */
  void deleteRole(@Param("sysId") String sysId, @Param("roleId") String roleId);

  /**
   * 删除用户角色关系
   * 
   * @param sysId 系统id
   * @param roleId 角色id
   */
  void deleteUserRole(@Param("sysId") String sysId,
      @Param("roleId") String roleId);

  /**
   * 获取角色拥有资源列表
   * 
   * @param sysId 系统id
   * @param roleId 角色id
   * @return
   */
  List<SysResource> selectRoleResource(@Param("sysId") String sysId,
      @Param("roleId") String roleId);

  /**
   * 添加角色资源关系
   * 
   * @param sysId
   * @param roleId
   * @param resId
   */
  void insertRoleResource(@Param("sysId") String sysId,
      @Param("roleId") String roleId, @Param("resId") int resId);

  /**
   * 删除角色资源关系
   * 
   * @param sysId
   * @param roleId
   * @param resId
   */
  void deleteRoleResource(@Param("sysId") String sysId,
      @Param("roleId") String roleId, @Param("resId") Integer resId);

  /**
   * 通过角色id通过角色对应的权限
   * 
   * @param sysId 系统id
   * @param roleId 角色id(不能为空)
   */
  List<SimpleCode> selectRolePermission(@Param("sysId") String sysId,
      @Param("roleId") String roleId);

  /**
   * 添加角色资源关系
   * 
   * @param sysId 系统id
   * @param roleId 角色id(不能为空)
   * @param permission 权限(不能为空)
   */
  void insertRolePermission(@Param("sysId") String sysId,
      @Param("roleId") String roleId, @Param("permission") String permission);

  /**
   * 删除角色资源关系
   * 
   * @param sysId 系统id
   * @param roleId(不能为空)
   * @param permission 权限
   */
  void deleteRolePermission(@Param("sysId") String sysId,
      @Param("roleId") String roleId, @Param("permission") String permission);
}
