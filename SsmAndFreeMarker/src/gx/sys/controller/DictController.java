package gx.sys.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gx.base.BaseController;
import gx.common.Page;
import gx.common.SimpleJSONResult;
import gx.sys.service.DictService;
import gx.sys.entity.SysDict;

/**
 * 代码字典Contrller
 * 
 * @author gx
 * 
 */
@Controller
@RequestMapping("/sys")
public class DictController extends BaseController {
  @Resource
  private DictService dictService;

  // 进入代码字典分页
  @RequestMapping("/dict")
  public String show() {
    return "sys/dictView";
  }

  // 获取代码字典分页
  @RequestMapping("/dict-getPage")
  @ResponseBody
  public SimpleJSONResult getPage(Integer pageSize, Integer pageNo, SysDict sysCode) {
    Page<SysDict> page = new Page<SysDict>(SysDict.class);
    if (pageSize != null) {
      page.setPageSize(pageSize);
    }
    if (pageNo != null) {
      page.setPageNo(pageNo);
    }
    page.setParams(sysCode);
    dictService.getSysCode(page);
    return successJsonResult(page);
  }

  // 插入代码字典
  @RequestMapping("/dict-create")
  @ResponseBody
  public SimpleJSONResult create(@Valid SysDict sysCode, BindingResult br) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    if (dictService.checkSysCode(sysCode.getCodeType(), sysCode.getCode())) {
      dictService.createSysCode(sysCode);
    }
    return successJsonResult("创建成功");
  }

  // 更新代码字典
  @RequestMapping("/dict-modify")
  @ResponseBody
  public SimpleJSONResult modify(@Valid SysDict sysCode, BindingResult br) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    dictService.modifySysCode(sysCode);
    return successJsonResult("修改成功");
  }

  // 删除代码字典
  @RequestMapping("/dict-remove")
  @ResponseBody
  public SimpleJSONResult remove(short codeType, String code) {
    if (code == null) {
      return failureJsonResult("缺少必要参数");
    }
    dictService.removerSysCode(codeType, code);
    return successJsonResult("删除成功");
  }

  // 代码字典判断重复
  @RequestMapping("/dict-check")
  @ResponseBody
  public SimpleJSONResult check(Short codeType, String code) {
    if (null == codeType || null == code) {
      return failureJsonResult("代码类型或者代码为空");
    }
    if (dictService.checkSysCode(codeType, code)) {
      return successJsonResult("正常");
    } else {
      return failureJsonResult("代码已存在");
    }
  }
}
