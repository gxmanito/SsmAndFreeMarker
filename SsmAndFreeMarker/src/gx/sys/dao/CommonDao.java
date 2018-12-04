package gx.sys.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import gx.common.SimpleCode;
import gx.sys.entity.SysDict;
import gx.sys.entity.SysResource;
import gx.sys.entity.SysUser;
import gx.sys.entity.UserOrg;

/**
 * 公用dao
 * 
 * @author gx
 * 
 */
public interface CommonDao {
  /**
   * 根据用户id获取用户
   * 
   * @param userId 用户id
   */
  List<SimpleCode> selectSysId();
  
  /**
   * 
   * @param codeType
   * @return
   */
  List<SysDict> selectSysCodeByType(@Param("codeType") short codeType);

  /**
   * 根据用户id获取用户
   * 
   * @param userId 用户id
   */
  SysUser selectUserById(@Param("userId") String userId);

  /**
   * 获取系统资源角色
   * 
   * @param sysId 系统id
   */
  List<SimpleCode> selectAllResRole(@Param("sysId") String sysId);

  /**
   * 获取用户角色
   * 
   * @param sysId 系统id
   * @param userId 用户id(不能为空)
   * @return
   */
  List<String> selectUserRoleIds(@Param("sysId") String sysId,
      @Param("userId") String userId);

  /**
   * 根据用户id获取系统用户菜单
   * 
   * @param sysId 系统id
   * @param userId 用户id(不能为空)
   */
  List<SysResource> selectUserMenu(@Param("sysId") String sysId,
      @Param("userId") String userId);

  /**
   * 获取用户权限
   * 
   * @param sysId 系统id
   * @param userId 用户id(不能为空)
   * @return
   */
  List<String> selectUserPermission(@Param("sysId") String sysId,
      @Param("userId") String userId);

  /**
   * 通过机构代码查询机构
   * 
   * @param code
   * @return
   */
  UserOrg selectUserOrg(@Param("code") String code);

  /**
   * 更新用户最后登录时间
   * 
   * @param userId 用户id(不能为空)
   */
  void updateUserLoginTime(@Param("userId") String userId);

  /**
   * 更新用户部分信息
   * 
   * @param user 用户(不能为空)
   */
  void updateUserSelf(SysUser user);

  /**
   * 更新用户密码
   * 
   * @param userId 用户id(不能为空)
   * @param userPwd 用户密码(不能为空)
   * @param gmtUpdate 更新时间(不能为空)
   */
  void updateUserPwd(@Param("userId") String userId,
      @Param("userPwd") String userPwd, @Param("gmtUpdate") Date gmtUpdate);
}
