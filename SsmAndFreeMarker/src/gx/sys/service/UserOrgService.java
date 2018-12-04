package gx.sys.service;

import java.util.List;

import gx.sys.entity.UserOrg;

/**
 * 用户服务
 * 
 * @author gx
 * 
 */
public interface UserOrgService {

  // 查询所有
  List<UserOrg> getAllUserOrg();

  // 查询展示在用户页面的树
  List<UserOrg> getUserOrg(String key);

  // 删除userorg
  void removeUserOrg(String code, int lft, int rgt);

  // 更新
  void modifyUserOrg(UserOrg userOrg);

  // 插入
  void createUserOrg(UserOrg userOrg);
  
  boolean checkUserOrg(String code);
}
