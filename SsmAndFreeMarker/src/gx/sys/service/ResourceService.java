package gx.sys.service;

import java.util.List;

import gx.sys.entity.SysResource;

/**
 * 资源服务
 * 
 * @author gx
 * 
 */
public interface ResourceService {
  /**
   * 获取所有资源列表(nested tree list)
   */
  List<SysResource> getResource(String sysId);

  /**
   * 创建资源
   * 
   * @param resource
   */
  void createResource(SysResource resource);

  /**
   * 修改资源
   * 
   * @param resource
   */
  void modifyResource(SysResource resource);

  /**
   * 移除资源
   * 
   * @param resId
   * @param lft
   * @param rgt
   */
  void removeResource(String sysId, int resId, int lft, int rgt);

  /**
   * 通过资源Id查询资源
   * 
   * @param resId
   * @return
   */
  boolean checkResource(String sysId, int resId);
}
