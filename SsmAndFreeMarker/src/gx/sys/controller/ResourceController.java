package gx.sys.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import gx.base.BaseController;
import gx.common.SimpleJSONResult;
import gx.sys.service.ResourceService;
import gx.sys.entity.SysResource;

import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 资源管理
 * 
 * @author gx
 * 
 */
@Controller
@RequestMapping("/sys")
public class ResourceController extends BaseController {
  @Resource
  private ResourceService resourceService;

  // 资源管理界面
  @RequestMapping("/res")
  public ModelAndView res() {
    ModelAndView mv = new ModelAndView("sys/resView");
    return mv;
  }

  // 资源管理界面
  @RequestMapping("/res-get")
  @ResponseBody
  public SimpleJSONResult getResource(String sysId) throws JsonProcessingException {
    return successJsonResult(resourceService.getResource(sysId));
  }

  // 创建资源
  @ResponseBody
  @RequestMapping("/res-create")
  public SimpleJSONResult createResource(@Valid SysResource resource, BindingResult br) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    if (resourceService.checkResource(resource.getSysId(), resource.getResId())) {
      resourceService.createResource(resource);
      return successJsonResult("创建资源成功");
    } else {
      return failureJsonResult("资源已存在");
    }

  }

  // 修改资源
  @ResponseBody
  @RequestMapping("/res-modify")
  public SimpleJSONResult modifyResource(@Valid SysResource resource, BindingResult br) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    resourceService.modifyResource(resource);
    return successJsonResult("修改资源成功");
  }

  // 删除资源
  @ResponseBody
  @RequestMapping("/res-remove")
  public SimpleJSONResult removeResource(String sysId, int resId, int lft, int rgt) {
    if (sysId == null) {
      return failureJsonResult("缺少必要参数");
    }
    resourceService.removeResource(sysId, resId, lft, rgt);
    return successJsonResult("删除资源成功");
  }

  // 判断resid是不是重复
  @ResponseBody
  @RequestMapping("/res-check")
  public SimpleJSONResult check(String sysId, int resId) {
    if (sysId == null) {
      return failureJsonResult("缺少必要参数");
    }

    if (resourceService.checkResource(sysId, resId)) {
      return successJsonResult("正常");
    } else {
      return failureJsonResult("资源id已存在");
    }
  }
}
