package gx.sys.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;

import gx.base.BaseController;
import gx.common.SimpleJSONResult;
import gx.sys.entity.UserOrg;
import gx.sys.service.UserOrgService;
import gx.util.CommonUtil;

@Controller
@RequestMapping("/sys")
public class UserOrgController extends BaseController {
  @Resource
  private UserOrgService userOrgService;

  // 展示userorg信息
  @RequestMapping("/userOrg")
  public ModelAndView userOrg() {
    ModelAndView mv = new ModelAndView("sys/userOrgView");
    return mv;
  }

  // 展示userorg信息
  @RequestMapping("/userOrg-get")
  @ResponseBody
  public SimpleJSONResult getuserOrg() throws JsonProcessingException {
    return successJsonResult(userOrgService.getAllUserOrg());
  }

  // 删除
  @RequestMapping("/userOrg-remove")
  @ResponseBody
  public SimpleJSONResult removeUserOrg(String code, Integer lft, Integer rgt) {
    userOrgService.removeUserOrg(code, lft, rgt);
    return successJsonResult("删除机构成功");
  }

  // 更新

  @RequestMapping("/userOrg-modify")
  @ResponseBody
  public SimpleJSONResult modifyUserOrg(@Valid UserOrg userOrg, BindingResult br) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    userOrgService.modifyUserOrg(userOrg);
    return successJsonResult("修改机构信息成功");
  }

  // 插入
  @RequestMapping("/userOrg-create")
  @ResponseBody
  public SimpleJSONResult createUserOrg(@Valid UserOrg userOrg, BindingResult br) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    if (userOrgService.checkUserOrg(userOrg.getCode())) {
      userOrgService.createUserOrg(userOrg);
    } else {
      return failureJsonResult("机构id已存在");
    }

    return successJsonResult("创建机构成功");
  }

  // 插入
  @RequestMapping("/userOrg-check")
  @ResponseBody
  public SimpleJSONResult checkUserOrg(String code) {
    if (code == null) {
      return failureJsonResult("缺少必要参数");
    }
    if (userOrgService.checkUserOrg(code)) {
      return successJsonResult("正常");
    } else {
      return failureJsonResult("机构id已存在");
    }
  }

  // 查询 用户
  @RequestMapping("/userOrg-search")
  @ResponseBody
  public SimpleJSONResult getUserOrg(String key) {
    if (key == null) {
      return failureJsonResult("缺少必要参数");
    }
    List<UserOrg> list = userOrgService.getUserOrg(key);
    Map<String, String> map = CommonUtil.newHashMapWithExpectedSize(list.size());
    for (Iterator<UserOrg> it = list.iterator(); it.hasNext();) {
      UserOrg userOrg = it.next();
      map.put(userOrg.getCode(), userOrg.getName());
    }
    return successJsonResult(map);
  }
}
