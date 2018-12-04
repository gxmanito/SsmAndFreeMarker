package gx.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gx.sys.entity.UserOrg;

/**
 * UserOrg对应接口
 * 
 * @author gx
 */

@Repository
public interface UserOrgDao {

  /**
   * 删除机构区间
   * 
   * @param lft
   * @param rgt
   */
  void deleteUserOrgByRange(@Param("lft") int lft, @Param("rgt") int rgt);

  /**
   * 更改资源空间
   * 
   * @param start
   * @param space
   */
  void updateSpace(@Param("start") int start, @Param("space") int space);

  /**
   * 查询全部
   * 
   * @return
   */
  List<UserOrg> selectUserOrg();

  /**
   * 通过机构代码查询机构
   * 
   * @param code
   * @return
   */
  UserOrg selectUserOrgById(@Param("code") String code);

  /**
   * 根据关键字查询机构
   * @param key
   * @return
   */
  List<UserOrg> selectUserOrgByKey(@Param("key") String key);

  // 更新
  void updateUserOrg(UserOrg userOrg);

  // 插入
  void insertUserOrg(UserOrg userOrg);

  // 删除通过code
  void deleteUserByCode(@Param("code") String code);

}
