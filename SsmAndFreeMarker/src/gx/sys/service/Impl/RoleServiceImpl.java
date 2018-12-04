package gx.sys.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gx.common.IviewTreeNode;
import gx.common.Page;
import gx.common.SimpleCode;
import gx.sys.dao.RoleDao;
import gx.sys.service.RoleService;
import gx.sys.entity.SysResource;
import gx.sys.entity.SysRole;

@Service
public class RoleServiceImpl implements RoleService {
  @Resource
  private RoleDao roleDao;

  @Override
  public void getRole(Page<SysRole> page) {
    roleDao.selectRole(page);
  }

  @Override
  public boolean checkRole(String sysId, String roleId) {
    return roleDao.selectRoleById(sysId, roleId) == null;
  }

  @Override
  public void createRole(String sysId, String roleId, String roleName,
      String remarks) {
    roleDao.insertRole(sysId, roleId, roleName, remarks);

  }

  @Override
  public void modifyRole(String sysId, String roleId, String roleName,
      String remarks) {

    roleDao.updateRole(sysId, roleId, roleName, remarks);
  }

  @Override
  @Transactional
  public void removerRole(String sysId, String roleId) {
    // 删除角色对应的资源
    roleDao.deleteRoleResource(sysId, roleId, null);
    roleDao.deleteUserRole(sysId, roleId);
    roleDao.deleteRolePermission(sysId, roleId, null);
    roleDao.deleteRole(sysId, roleId);
  }

  @Override
  public List<IviewTreeNode> getRoleResource(String sysId, String roleId) {
    List<IviewTreeNode> nav = new ArrayList<IviewTreeNode>();// 要返回的数据
    List<SysResource> resList = roleDao.selectRoleResource(sysId, roleId);// 得到所有资源
    List<IviewTreeNode> children = null;
    for (int i = 0; i < resList.size(); i++) {
      SysResource sysResource = resList.get(i);
      IviewTreeNode res = new IviewTreeNode();
      res.setId(String.valueOf(sysResource.getResId()));
      res.setTitle(sysResource.getResName() + "  #" + sysResource.getResId());
      if (sysResource.getResType() == 0) {
        res.setExpand(true);
        children = new ArrayList<IviewTreeNode>();
        res.setChildren(children);
        nav.add(res);
      } else {
        if (sysResource.getPermission() != null) {
          res.setChecked(true);
        }
        res.setParent(String.valueOf(sysResource.getParent()));
        children.add(res);
      }
    }
    return nav;
  }

  @Override
  @Transactional
  public void modifyRoleResource(String sysId, String roleId, String resIds) {
    roleDao.deleteRoleResource(sysId, roleId, null);
    if (null != resIds) {
      String[] resId = resIds.split(",");
      for (String string : resId) {
        roleDao.insertRoleResource(sysId, roleId, Integer.valueOf(string));
      }
    }
  }

  @Override
  public List<SimpleCode> getRolePermission(String sysId, String roleId) {
    return roleDao.selectRolePermission(sysId, roleId);
  }

  @Override
  @Transactional
  public void modifyRolePermission(String sysId, String roleId,
      String permissions) {
    roleDao.deleteRolePermission(sysId, roleId, null);
    if (null != permissions) {
      String[] per = permissions.split(",");
      for (String string : per) {
        roleDao.insertRolePermission(sysId, roleId, string);
      }
    }
  }
}
