package gx.sys.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gx.sys.dao.UserDao;
import gx.sys.dao.UserOrgDao;
import gx.sys.service.UserOrgService;
import gx.sys.entity.UserOrg;

@Service
public class UserOrgServiceImpl implements UserOrgService {
  @Resource
  private UserOrgDao userOrgDao;
  @Resource
  private UserDao userDao;

  @Override
  public List<UserOrg> getAllUserOrg() {
    return userOrgDao.selectUserOrg();
  }

  @Override
  public List<UserOrg> getUserOrg(String key) {
    //查询所有的userOrg
    return userOrgDao.selectUserOrgByKey(key);
  }

  @Override
  @Transactional
  public void removeUserOrg(String code, int lft, int rgt) {
    
    //删除这条数据
    if (lft== rgt + 1) {
      userDao.updateUserOrgEmptyByCode(code);
      userOrgDao.deleteUserByCode(code);
      userOrgDao.updateSpace(lft, -2);
    }else{
      userDao.updateUserOrgEmptyByRange(lft, rgt);
      userOrgDao.deleteUserOrgByRange(lft, rgt);
      userOrgDao.updateSpace(lft, lft - rgt - 1);
    }
  }

  @Override
  public void modifyUserOrg(UserOrg userOrg) {
   //修改
    userOrgDao.updateUserOrg(userOrg);
    
  }

  @Override
  @Transactional
  public void createUserOrg(UserOrg userOrg) {
    //更新
    userOrgDao.updateSpace(userOrg.getLft(), 2);
    userOrgDao.insertUserOrg(userOrg);
  }

  @Override
  public boolean checkUserOrg(String code) {
    return userOrgDao.selectUserOrgById(code)==null;
  }
}
