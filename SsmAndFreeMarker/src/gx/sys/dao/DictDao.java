package gx.sys.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gx.common.Page;
import gx.sys.entity.SysDict;

@Repository
public interface DictDao {

  /**
   * 代码字典分页
   * 
   * @param page
   */
  void selectSysCode(Page<SysDict> page);

  /**
   * 
   * @param codeType
   * @param code
   * @return
   */
  SysDict selectSysCodeById(@Param("codeType") short codeType, @Param("code") String code);

  /**
   * 更新代码字典
   * 
   * @param sysCode
   * @return
   */
  void updateSysCode(SysDict sysCode);

  /**
   * 插入代码字典
   * 
   * @param sysCode
   * @return
   */
  void insertSysCode(SysDict sysCode);

  /**
   * 删除代码字典
   * 
   * @param codeType
   * @param code
   * @return
   */
  void deleteSysCode(@Param("codeType") short codeType, @Param("code") String code);

}
