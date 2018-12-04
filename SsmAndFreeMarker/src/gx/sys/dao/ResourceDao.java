package gx.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gx.sys.entity.SysResource;

/**
 * 资源dao
 * 
 * @author gx
 * 
 */
public interface ResourceDao {

  /**
   * 获取全部资源列表
   * 
   * @param sysId
   *          系统id
   * @return
   */
  List<SysResource> selectAllResource(@Param("sysId") String sysId);

  /**
   * 更改资源空间
   * 
   * @param sysId
   *          系统id
   * @param start
   * @param space
   */
  void updateSpace(@Param("sysId") String sysId, @Param("start") int start, @Param("space") int space);

  /**
   * 添加资源
   * 
   * @param resource
   *          资源(不能为空)
   */
  void insertResource(SysResource resource);

  /**
   * 添加资源
   * 
   * @param resource
   *          资源(不能为空)
   */
  void updateResource(SysResource resource);

  /**
   * 删除资源
   * 
   * @param sysId
   *          系统id
   * @param resId
   *          资源id(不能为空)
   */
  void deleteResource(@Param("sysId") String sysId, @Param("resId") int resId);

  /**
   * 删除资源
   * 
   * @param sysId
   *          系统id
   * @param lft
   *          资源左值(不能为空)
   * @param rgt
   *          资源右值(不能为空)
   */
  void deleteResourceByRange(@Param("sysId") String sysId, @Param("lft") int lft, @Param("rgt") int rgt);

  /**
   * 通过资源Id查询资源
   * 
   * @param sysId
   *          系统id
   * @param resId
   *          资源id
   * @return
   */
  SysResource selectResourceById(@Param("sysId") String sysId, @Param("resId") int resId);

  /**
   * 根据资源左值查询数据
   * 
   * @param sysId
   *          系统id
   * @param rgt
   * @param lft
   * @return
   */
  List<SysResource> selectResourceByRange(@Param("sysId") String sysId, @Param("rgt") int rgt, @Param("lft") int lft);

}
