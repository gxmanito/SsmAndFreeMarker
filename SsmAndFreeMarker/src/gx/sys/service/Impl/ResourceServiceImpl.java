package gx.sys.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gx.sys.dao.ResourceDao;
import gx.sys.dao.RoleDao;
import gx.sys.service.ResourceService;
import gx.sys.entity.SysResource;
import gx.util.PinyinUtil;

@Service
public class ResourceServiceImpl implements ResourceService {
  @Resource
  private ResourceDao resourceDao;

  @Resource
  private RoleDao roleDao;

  @Override
  public List<SysResource> getResource(String sysId) {
    return resourceDao.selectAllResource(sysId);
  }

  @Override
  @Transactional
  public void createResource(SysResource resource) {
    resource.setResPy(PinyinUtil.getFirstSpell(resource.getResName()));
    String sysId = resource.getSysId();
    resourceDao.updateSpace(sysId, resource.getLft(), 2);
    resourceDao.insertResource(resource);
    roleDao.insertRoleResource(sysId, "admin", resource.getResId());
  }

  @Override
  public void modifyResource(SysResource resource) {
    resource.setResPy(PinyinUtil.getFirstSpell(resource.getResName()));
    resourceDao.updateResource(resource);
  }

  @Override
  @Transactional
  public void removeResource(String sysId, int resId, int lft, int rgt) {
    // 删除资源对应角色
    List<SysResource> resource = resourceDao.selectResourceByRange(sysId, rgt,
        lft);
    for (SysResource sysResource : resource) {
      roleDao.deleteRoleResource(sysId, null, sysResource.getResId());
      roleDao.deleteRolePermission(sysId, null, sysResource.getPermission());
    }
    if (lft == rgt + 1) {
      resourceDao.deleteResource(sysId, resId);
      resourceDao.updateSpace(sysId, lft, -2);
    } else {
      resourceDao.deleteResourceByRange(sysId, lft, rgt);
      resourceDao.updateSpace(sysId, lft, lft - rgt - 1);
    }
  }

  @Override
  public  boolean checkResource(String sysId, int resId) {
    return resourceDao.selectResourceById(sysId, resId) == null;
  }
}
