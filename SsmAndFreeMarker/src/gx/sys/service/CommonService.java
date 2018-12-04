package gx.sys.service;

import gx.common.SimpleCode;
import gx.sys.entity.SysDict;
import gx.sys.entity.SysResource;
import gx.sys.entity.SysUser;
import gx.sys.entity.UserOrg;

import java.util.List;

public interface CommonService {
  /**
   * 获取用户
   * 
   * @param userId 用户id(不能为空)
   */
  SysUser getUser(String userId);

  /**
   * 获取系统资源角色
   */
  List<SimpleCode> getAllResRole();

  /**
   * 获取用户角色
   * 
   * @param userId 用户id(不能为空)
   * @return
   */
  List<String> getUserRole(String userId);

  /**
   * 获取系统用户菜单
   * 
   * @param userId 用户id(不能为空)
   * @return
   */
  List<SysResource> getUserMenu(String userId);

  /**
   * 获取用户角色
   * 
   * @param userId 用户id(不能为空)
   * @return
   */
  List<String> getUserPermision(String userId);

  /**
   * 获取用户所属机构信息
   * 
   * @param code
   * @return
   */
  UserOrg getUserOrg(String code);

  /**
   * 用户登陆
   * 
   * @param userId
   */
  void login(String userId);

  /**
   * 检查用户密码
   * 
   * @param userId
   * @param userPwd
   * @return
   */
  boolean checkPassword(String userId, String userPwd);

  /**
   * 用户自己修改信息
   * 
   * @param user
   */
  void modifySelfInfo(SysUser user);

  /**
   * 用户自己修改密码
   * 
   * @param userId
   * @param userPwd
   */
  void modifySelfPassword(String userId, String userPwd);

  /**
   * 获取系统id
   * @return
   */
  List<SimpleCode> getSysId();
  
  /**
   * 根据类型获取字典
   * @param codeType
   * @return
   */
  List<SysDict> getSysCodeByCodeType(short codeType);
}
