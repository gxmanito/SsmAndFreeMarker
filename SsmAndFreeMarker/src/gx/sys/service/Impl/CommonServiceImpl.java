package gx.sys.service.Impl;

import gx.common.SimpleCode;
import gx.sys.dao.CommonDao;
import gx.sys.entity.SysDict;
import gx.sys.entity.SysResource;
import gx.sys.entity.SysUser;
import gx.sys.entity.UserOrg;
import gx.sys.service.CommonService;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements CommonService {
  @Resource
  private CommonDao commonDao;

  @Value("${sysId}")
  private String sysId;

  @Override
  public SysUser getUser(String userId) {
    return commonDao.selectUserById(userId);
  }

  @Override
  public List<SimpleCode> getAllResRole() {
    return commonDao.selectAllResRole(sysId);
  }

  @Override
  public List<String> getUserRole(String userId) {
    return commonDao.selectUserRoleIds(sysId, userId);
  }

  @Override
  public List<SysResource> getUserMenu(String userId) {
    return commonDao.selectUserMenu(sysId, userId);
  }

  @Override
  public List<String> getUserPermision(String userId) {
    return commonDao.selectUserPermission(sysId, userId);
  }

  @Override
  public UserOrg getUserOrg(String code) {
    return commonDao.selectUserOrg(code);
  }

  @Override
  public void login(String userId) {
    commonDao.updateUserLoginTime(userId);
  }

  // 判斷密碼不是正確
  @Override
  public boolean checkPassword(String userId, String userPwd) {
    SysUser sysUser = commonDao.selectUserById(userId);
    String salt = String
        .valueOf(sysUser.getGmtUpdate().getTime() / 1000 * 1000);
    userPwd = new Md5Hash(userPwd, ByteSource.Util.bytes(salt), 2).toBase64();
    if (userPwd.equals(sysUser.getUserPwd())) {
      return true;
    }
    return false;
  }

  @Override
  public void modifySelfInfo(SysUser user) {
    // 修改用户信息
    commonDao.updateUserSelf(user);
  }

  @Override
  public void modifySelfPassword(String userId, String userPwd) {
    Date gmtUpdate = new Date();
    // 修改密码
    String salt = String.valueOf(gmtUpdate.getTime() / 1000 * 1000);
    userPwd = new Md5Hash(userPwd, ByteSource.Util.bytes(salt), 2).toBase64();
    commonDao.updateUserPwd(userId, userPwd, gmtUpdate);

  }

  @Override
  public List<SimpleCode> getSysId() {
    return commonDao.selectSysId();
  }
  
  @Override
  public List<SysDict> getSysCodeByCodeType(short codeType) {
    return commonDao.selectSysCodeByType(codeType);
  }
}
