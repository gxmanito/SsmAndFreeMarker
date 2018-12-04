package gx.sys.service;

import gx.common.Page;
import gx.sys.entity.SysDict;

/**
 * 代码字典的service层
 * 
 * @author gx
 * 
 */
public interface DictService {
  /**
   * 代码字典分页
   * 
   * @param page
   */
  void getSysCode(Page<SysDict> page);

  /**
   * 判断重复
   * 
   * @param codeType
   * @param code
   * @return
   */
  boolean checkSysCode(short codeType, String code);

  /**
   * 更新代码字典
   * 
   * @param sysCode
   * @return
   */
  void modifySysCode(SysDict sysCode);

  /**
   * 插入代码字典
   * 
   * @param sysCode
   * @return
   */
  void createSysCode(SysDict sysCode);

  /**
   * 删除代码字典
   * 
   * @param codeType
   * @param code
   * @return
   */
  void removerSysCode(short codeType, String code);
}
