package gx.sys.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import gx.common.Page;
import gx.sys.dao.DictDao;
import gx.sys.service.DictService;
import gx.sys.entity.SysDict;

/**
 * 代码字典service 接口实现
 * 
 * @author gx
 * 
 */
@Service
public class DictServiceServiceImpl implements DictService {
  @Resource
  private DictDao sysCodeDao;

  @Override
  public void getSysCode(Page<SysDict> page) {
    sysCodeDao.selectSysCode(page);

  }

  @Override
  public boolean checkSysCode(short codeType, String code) {
    return sysCodeDao.selectSysCodeById(codeType, code) == null;
  }

  @Override
  public void modifySysCode(SysDict sysCode) {
    sysCodeDao.updateSysCode(sysCode);
  }

  @Override
  public void createSysCode(SysDict sysCode) {
    sysCodeDao.insertSysCode(sysCode);
  }

  @Override
  public void removerSysCode(short codeType, String code) {
    sysCodeDao.deleteSysCode(codeType, code);
  }
}
