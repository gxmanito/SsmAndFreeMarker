package gx.sys.controller;

import gx.base.BaseController;
import gx.common.SimpleJSONResult;
import gx.sys.entity.SysDict;
import gx.sys.entity.SysUser;
import gx.sys.service.CommonService;
import gx.util.CommonUtil;
import gx.util.RSACoder;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CommonController extends BaseController {
  @Resource
  private CommonService commonService;

  // 获取个人组织机构信息
  @RequestMapping("/sysdate")
  @ResponseBody
  public SimpleJSONResult getSysDate() {
    return successJsonResult(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
  }

  // 登陆界面
  @RequestMapping("/login")
  public ModelAndView login() {
    ModelAndView mv = new ModelAndView("loginView");
    mv.addObject("publicKey", RSACoder.PUBLIC_KEY);
    return mv;
  }

  /**
   * 
   * 登陆
   * 
   * @return
   */
  @RequestMapping("/doLogin")
  public String doLogin(String userId, String userPwd, RedirectAttributes attr) {
    if (StringUtils.isBlank(userId) || StringUtils.isBlank(userPwd)) {
      attr.addFlashAttribute("msg", "账号或密码不能为空");
      return "redirect:/login";
    }
    try {
      userPwd = new String(RSACoder.decryptByPrivateKey(RSACoder
          .decryptBASE64(userPwd)));
    } catch (Exception e) {
      logger.error("解析密码错误", e);
      userPwd = null;
    }
    if (userPwd == null) {
      attr.addFlashAttribute("msg", "未能正确解析密码");
      return "redirect:/login";
    }

    if (userId.length() > 20 || userPwd.length() > 24) {
      attr.addFlashAttribute("msg", "账号或密码错误");
      return "redirect:/login";
    }

    Subject currentUser = SecurityUtils.getSubject();
    try {
      currentUser.login(new UsernamePasswordToken(userId, userPwd));
    } catch (UnknownAccountException e) {
      attr.addFlashAttribute("msg", "账号或密码错误");
      return "redirect:/login";
    } catch (IncorrectCredentialsException e) {
      attr.addFlashAttribute("msg", "账号或密码错误");
      return "redirect:/login";
    } catch (ExcessiveAttemptsException e) {
      attr.addFlashAttribute("msg", "失败次数过多");
      return "redirect:/login";
    } catch (LockedAccountException e) {
      attr.addFlashAttribute("msg", "账号已被锁定");
      return "redirect:/login";
    } catch (DisabledAccountException e) {
      attr.addFlashAttribute("msg", "账号已被禁用");
      return "redirect:/login";
    } catch (ExpiredCredentialsException e) {
      attr.addFlashAttribute("msg", "账号已过期");
      return "redirect:/login";
    }
    SysUser user = (SysUser) currentUser.getPrincipal();
    user.setUserPwd(null);
    commonService.login(userId);
    logger.info("用户 {} 登录", userId);
    return "redirect:/main";
  }

  /**
   * 
   * 跳转主页
   * 
   * @return
   */
  @RequestMapping("/main")
  public ModelAndView main() {
    SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
    ModelAndView mv = new ModelAndView();
    if (user == null) {
      mv.setViewName("redirect:login");
      return mv;
    }

    ObjectMapper mapper = new ObjectMapper();
    try {
      mv.addObject("user", mapper.writeValueAsString(user));
      mapper.setSerializationInclusion(Include.NON_NULL);
      mv.addObject("userMenu", mapper.writeValueAsString(commonService
          .getUserMenu(user.getUserId())));
    } catch (JsonProcessingException e) {
      logger.error("转换数据失败", e);
    }
    // 密码加密
    mv.addObject("publicKey", RSACoder.PUBLIC_KEY);
    mv.setViewName("mainView");
    return mv;
  }

  /**
   * 
   * 无权限处理
   * 
   * @return
   */
  @RequestMapping("/noAuthority")
  public ModelAndView noAuthority(HttpServletRequest request,
      HttpServletResponse response, Model model) {
    String msg = new StringBuilder("没有资源")
        .append(request.getAttribute("javax.servlet.forward.request_uri"))
        .append("的访问权限").toString();
    if (isAjax(request)) {
      response.setContentType("application/json;charset=UTF-8");
      try {
        new ObjectMapper().writeValue(response.getWriter(),
            failureJsonResult(msg));
      } catch (IOException e) {
        e.printStackTrace();
      }
      return null;
    }
    ModelAndView view = new ModelAndView("errorView");
    view.addObject("msg", msg);
    return view;
  }

  /**
   * 
   * 报错处理
   * 
   * @return
   */
  @RequestMapping("/error")
  public ModelAndView error(HttpServletRequest request,
      HttpServletResponse response, Model model) {
    Integer statusCode = (Integer) request
        .getAttribute("javax.servlet.error.status_code");
    Exception exception = (Exception) request
        .getAttribute("javax.servlet.error.exception");
    if (statusCode == null)
      return null;
    StringBuilder builder = new StringBuilder();
    String msg;
    switch (statusCode) {
    case 404:
      msg = builder
          .append(request.getAttribute("javax.servlet.forward.request_uri"))
          .append(",资源不存在").toString();
      logger.warn(msg);
      break;
    default:
      msg = builder.append("非预期的异常:").append(exception.getMessage()).toString();
      logger.error(msg, exception);
      break;
    }
    if (isAjax(request)) {
      response.setContentType("application/json;charset=UTF-8");
      try {
        new ObjectMapper().writeValue(response.getWriter(),
            failureJsonResult(msg));
      } catch (IOException e) {
        e.printStackTrace();
      }
      return null;
    }
    ModelAndView view = new ModelAndView("errorView");
    view.addObject("msg", msg);
    return view;
  }

  // 代码字典通过code查询type
  @RequestMapping("/common/getCode")
  @ResponseBody
  public SimpleJSONResult getCode(short codeType) {
    List<SysDict> list = commonService.getSysCodeByCodeType(codeType);
    Map<String, String> map = CommonUtil
        .newHashMapWithExpectedSize(list.size());
    for (Iterator<SysDict> iterator = list.iterator(); iterator.hasNext();) {
      SysDict sysCode = (SysDict) iterator.next();
      map.put(sysCode.getCode(), sysCode.getName());
    }
    return successJsonResult(map);
  }

  // 得到codelist
  @RequestMapping("/common/getCodeList")
  @ResponseBody
  public SimpleJSONResult getCodeList(short codeType) {
    List<SysDict> list = commonService.getSysCodeByCodeType(codeType);
    return successJsonResult(list);
  }

  // 得到codeName

  @RequestMapping("/common/getCodeNameList")
  @ResponseBody
  public SimpleJSONResult getCodeNameList(short codeType) {
    List<SysDict> list = commonService.getSysCodeByCodeType(codeType);
    List<String> nav = new ArrayList<String>();
    for (Iterator<SysDict> iterator = list.iterator(); iterator.hasNext();) {
      SysDict sysCode = (SysDict) iterator.next();
      nav.add(sysCode.getName());
    }
    return successJsonResult(nav);
  }

  // 修改用户个人信息
  @RequestMapping("/common/user-modifyInfo")
  @ResponseBody
  public SimpleJSONResult modifyInfo(@Valid SysUser modifyUser,
      BindingResult br, String userOrg) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
    modifyUser.setUserId(user.getUserId());
    commonService.modifySelfInfo(modifyUser);
    return successJsonResult("修改用戶成功");
  }

  // 修改用户个人信息
  @RequestMapping("/common/user-checkPwd")
  @ResponseBody
  public SimpleJSONResult checkPassword(String userPwd) {
    SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
    if (user == null) {
      return failureJsonResult("请先登陆");
    }
    // js参数加密传输
    try {
      userPwd = new String(RSACoder.decryptByPrivateKey(RSACoder
          .decryptBASE64(userPwd)));
    } catch (IOException e1) {
      userPwd = null;
    }
    if (userPwd == null) {
      return failureJsonResult("未能正确解析密码");
    }
    if (commonService.checkPassword(userPwd, user.getUserId())) {
      return successJsonResult("密码正确");
    }
    return failureJsonResult("密码不正确");
  }

  // 修改用户密码 参数为新密码旧密码
  @RequestMapping("/common/user-modifyPwd")
  @ResponseBody
  public SimpleJSONResult modifyPwd(String oPwd, String nPwd) {
    SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
    if (user == null) {
      return failureJsonResult("请先登陆");
    }
    try {
      oPwd = new String(RSACoder.decryptByPrivateKey(RSACoder
          .decryptBASE64(oPwd)));
    } catch (IOException e1) {
      oPwd = null;
    }
    if (oPwd == null) {
      return failureJsonResult("未能正确解析密码");
    }
    if (commonService.checkPassword(user.getUserId(), oPwd)) {
      commonService.modifySelfPassword(user.getUserId(), nPwd);
    } else {
      return failureJsonResult("旧密码不正确");
    }
    return successJsonResult("修改密码成功");
  }

  // 获取个人组织机构信息
  @RequestMapping("/common/user-getOrgInfo")
  @ResponseBody
  public SimpleJSONResult userOrgInformation() {
    SysUser user = (SysUser) SecurityUtils.getSubject().getPrincipal();
    if (user == null) {
      return failureJsonResult("请先登陆");
    }
    return successJsonResult(commonService.getUserOrg(user.getUserOrg()));
  }

  // 获取个人组织机构信息
  @RequestMapping("/common/getSysId")
  @ResponseBody
  public SimpleJSONResult getSysId() {
    return successJsonResult(commonService.getSysId());
  }

  private boolean isAjax(HttpServletRequest request) {
    return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
  }
}
