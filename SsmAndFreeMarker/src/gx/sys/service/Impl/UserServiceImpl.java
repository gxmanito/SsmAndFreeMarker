package gx.sys.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gx.common.IviewTreeNode;
import gx.common.Page;
import gx.sys.dao.CommonDao;
import gx.sys.dao.UserDao;
import gx.sys.service.UserService;
import gx.sys.entity.SysUser;
import gx.util.PinyinUtil;

@Service
public class UserServiceImpl implements UserService {

  @Resource
  private UserDao userDao;
  @Resource
  private CommonDao commonDao;

  @Override
  public void getUser(Page<SysUser> page) {
    userDao.selectUser(page);
  }

  @Override
  public boolean checkUser(String userId) {
    return userDao.selectUserById(userId) == null;
  }

  @Override
  public void createUser(SysUser user) {
    Date now = new Date();
    String salt = String.valueOf(now.getTime() / 1000 * 1000);
    user.setUserPwd(new Md5Hash(user.getUserPwd(), ByteSource.Util.bytes(salt), 2).toBase64());
    user.setGmtCreate(now);
    user.setGmtUpdate(now);
    user.setUserPy(PinyinUtil.getFirstSpell(user.getUserName()));
    userDao.insertUser(user);
  }

  @Override
  public void modifyUser(SysUser user) {
    // 修改用户信息
    userDao.updateUser(user);
  }

  @Override
  @Transactional
  public void removeUser(String userId) {
    // 删除用户对应的角色
    userDao.deleteUserRole(null, userId, null);
    // 根据用户user_id删除用户
    userDao.deleteUser(userId);
  }

  @Override
  public List<IviewTreeNode> getUserRole(String userId) {
    List<IviewTreeNode> list = userDao.selectUserRole(userId);
    List<IviewTreeNode> resList = new ArrayList<IviewTreeNode>();
    IviewTreeNode sys = null;
    for (Iterator<IviewTreeNode> it = list.iterator(); it.hasNext();) {
      IviewTreeNode node = it.next();
      if (sys != null && node.getParent().equals(sys.getId())) {
        sys.getChildren().add(node);
      } else {
        sys = new IviewTreeNode();
        sys.setId(node.getParent());
        sys.setTitle(node.getRemarks());
        sys.setExpand(true);
        sys.setChildren(new ArrayList<IviewTreeNode>());
        sys.getChildren().add(node);
        resList.add(sys);
      }
    }
    return resList;
  }

  @Override
  public void modifyUserRole(String userId, String roles) {
    userDao.deleteUserRole(null, userId, null);
    if (roles != null) {
      String[] roleId = roles.split(",");
      for (String role : roleId) {
        String[] vs = role.split("#");
        userDao.insertUserRole(vs[0], userId, vs[1]);
      }
    }
  }

  @Override
  public SysUser getSysUserByPwd(String userId, String userPwd) {
    // 验证密码是不是正确
    SysUser sysUser = userDao.selectUserById(userId);
    String salt = String.valueOf(sysUser.getGmtUpdate().getTime() / 1000 * 1000);
    userPwd = new Md5Hash(userPwd, ByteSource.Util.bytes(salt), 2).toBase64();
    return userDao.selectSysUserByPwd(userId, userPwd);
  }

  @Override
  public void modifyUserPwd(String userId, String userPwd, Date gmtUpdate) {
    // 修改密码
    String salt = String.valueOf(gmtUpdate.getTime() / 1000 * 1000);
    userPwd = new Md5Hash(userPwd, ByteSource.Util.bytes(salt), 2).toBase64();
    userDao.updateUserPwd(userId, userPwd, gmtUpdate);
  }

  // @Override
  /*
   * public List<IviewTreeNode> getukeyZd(String ukeyId, String userId) {
   * //获取用户下对于的宗地楼幢 // 获取当前用户 SysUser user = userDao.selectUserById(userId); //
   * 获取用户的机构 UserOrg userOrg = commonDao.selectUserOrg(user.getUserOrg());
   * List<Zdxx> zDList=zdxxDao.selectBDCLand(userOrg.getName()); //获取key对应的楼幢宗地
   * List<Map<String, Object>> mapList=zdxxDao.selectDeveZd(ukeyId);
   * List<IviewTreeNode> nav = new ArrayList<IviewTreeNode>();// 要返回的数据 for (int i
   * = 0; i < zDList.size(); i++) { String Land_code=null; IviewTreeNode res = new
   * IviewTreeNode(); Land_code=zDList.get(i).getLandCode();//宗地代码
   * res.setTitle(zDList.get(i).getLandLocation()+"#宗地代码"+Land_code);//获取坐落
   * res.setId(Land_code);//获取宗地代码 for (int t = 0; t < mapList.size(); t++) { if(
   * mapList.get(t).get("landCode")!=null &&
   * mapList.get(t).get("buNumber")==null){ String landCode =
   * mapList.get(t).get("landCode").toString();
   * if(landCode.equals(zDList.get(i).getLandCode())){ res.setChecked(true); } } }
   * List<IviewTreeNode> children = new ArrayList<IviewTreeNode>();;
   * List<Map<String, Object>> map=zDList.get(i).getMapList(); for (int j = 0; j <
   * map.size(); j++) { IviewTreeNode res1 = new IviewTreeNode(); String bunumber
   * = map.get(j).get("bunumber").toString(); String housenumber =
   * map.get(j).get("housenumber").toString(); res1.setTitle(housenumber);//获取坐落
   * res1.setId(bunumber);//获取宗地代码 res1.setParent(Land_code); for (int t = 0; t <
   * mapList.size(); t++) { if( mapList.get(t).get("buNumber")!=null){ String
   * buNumber = mapList.get(t).get("buNumber").toString();
   * if(buNumber.equals(map.get(j).get("bunumber").toString())){
   * res1.setChecked(true); } } } children.add(res1); } res.setChildren(children);
   * nav.add(res); } return nav; }
   */

}
