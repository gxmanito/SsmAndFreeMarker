package gx.sys.service;

import java.util.Date;
import java.util.List;

import gx.common.IviewTreeNode;
import gx.common.Page;
import gx.sys.entity.SysUser;

/**
 * 用户服务
 * 
 * @author gx
 * 
 */
public interface UserService {
  /**
   * 获取用户列表 分页
   * 
   * @param page 分页配置
   */
  void getUser(Page<SysUser> page);

  /**
   * 检查用户存在
   * 
   * @param userId 用户id(不能为空)
   */
  boolean checkUser(String userId);

  /**
   * 创建用户
   * 
   * @param user 用户信息
   */
  void createUser(SysUser user);

  /**
   * 更改用户
   * 
   * @param user 用户信息
   */
  void modifyUser(SysUser user);

  /**
   * 移除用户
   * 
   * @param userId 用户id(不能为空)
   */
  void removeUser(String userId);

  /***
   * 查询一个用户对应的所有角色
   */
  List<IviewTreeNode> getUserRole(String userId);

  /**
   * 保存用户与角色的关系
   */
  void modifyUserRole(String userId, String roles);

  /**
   * 根据userId 还有userPwd查询用户判断用户密码
   * 
   * @param userId
   * @param userPwd
   * @return
   */
  SysUser getSysUserByPwd(String userId, String userPwd);

  /**
   * 修改密码
   */
  void modifyUserPwd(String userId, String userPwd, Date gmtUpdate);
}
