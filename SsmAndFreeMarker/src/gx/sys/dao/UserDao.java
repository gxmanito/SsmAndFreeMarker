package gx.sys.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import gx.common.IviewTreeNode;
import gx.common.Page;
import gx.sys.entity.SysUser;

/**
 * 用戶dao
 * 
 * @author gx
 * 
 */
public interface UserDao {
  /**
   * 获取用户列表 分页
   * 
   * @param page 分页配置
   */
  void selectUser(Page<SysUser> page);

  /**
   * 根据用户id获取用户
   * 
   * @param userId 用户id
   */
  SysUser selectUserById(@Param("userId") String userId);

  /**
   * 更新用户密码
   * 
   * @param userId 用户id(不能为空)
   * @param userPwd 用户密码(不能为空)
   * @param gmtUpdate 更新时间(不能为空)
   */
  void updateUserPwd(@Param("userId") String userId,
      @Param("userPwd") String userPwd, @Param("gmtUpdate") Date gmtUpdate);

  /**
   * 添加用户
   * 
   * @param user 用户(不能为空)
   */
  void insertUser(SysUser user);

  /**
   * 更新用户
   * 
   * @param user 用户(不能为空)
   */
  void updateUser(SysUser user);

  /**
   * 删除用户
   * 
   * @param userId 用户id(不能为空)
   */
  void deleteUser(@Param("userId") String userId);
  
  /**
   * 
   * @param userId
   * @return
   */
  List<IviewTreeNode> selectUserRole(@Param("userId") String userId);

  /**
   * 添加用户角色关系
   * 
   * @param sysId
   * @param userId 用户id(不能为空)
   * @param roleId 角色id(不能为空)
   */
  void insertUserRole(@Param("sysId") String sysId,
      @Param("userId") String userId, @Param("roleId") String roleId);

  /**
   * 删除用户角色关系
   * 
   * @param userId 用户id(不能为空)
   * @param roleId 角色id
   */
  void deleteUserRole(@Param("sysId") String sysId,
      @Param("userId") String userId, @Param("roleId") String roleId);

  /**
   * 
   * @param userId
   * @param userPwd
   * @return
   */
  SysUser selectSysUserByPwd(@Param("userId") String userId,
      @Param("userPwd") String userPwd);

  /**
   * 更新用户的userOrg
   * 
   * @param userId 用户id
   * @param userOrg userorg表对应的code
   */
  void updateUserOrg(@Param("userId") String userId,
      @Param("userOrg") String userOrg);

  /**
   * 通过机构代码更新userOrg为空null
   * 
   * @param code
   */
  void updateUserOrgEmptyByCode(@Param("code") String code);

  /**
   * 通过区间更新userOrg为空null
   * 
   * @param lft
   * @param rgt
   */
  void updateUserOrgEmptyByRange(@Param("lft") int lft, @Param("rgt") int rgt);
  
}
