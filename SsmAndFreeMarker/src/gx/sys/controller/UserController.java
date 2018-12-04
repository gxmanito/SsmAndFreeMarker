package gx.sys.controller;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gx.base.BaseController;
import gx.common.Page;
import gx.common.SimpleJSONResult;
import gx.sys.service.UserService;
import gx.sys.entity.SysUser;
import gx.util.CommonUtil;

/**
 * 用户管理
 * 
 * @author wings
 * 
 */
@Controller
@RequestMapping("/sys")
public class UserController extends BaseController {
  @Resource
  private UserService userService;

  // 用户管理首页
  @RequestMapping("/user")
  public String user() {
    return "sys/userView";
  }

  // 获取用户分页
  @RequestMapping("/user-getPage")
  @ResponseBody
  public SimpleJSONResult getUser(Integer pageSize, Integer pageNo, String userId, String userName) {
    Map<String, Object> params = CommonUtil.newHashMapWithExpectedSize(2);
    if (StringUtils.isNotBlank(userId)) {
      params.put("userId", userId);
    }
    if (StringUtils.isNotBlank(userName)) {
      params.put("userName", userName);
    }
    Page<SysUser> page = getPage(pageSize, pageNo, params, SysUser.class);
    userService.getUser(page);
    return successJsonResult(page);
  }

  // 创建用户信息
  @RequestMapping("/user-create")
  @ResponseBody
  public SimpleJSONResult addUser(@Valid SysUser user, BindingResult br) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    String userId = user.getUserId();
    if (userService.checkUser(userId)) {
      user.setUserPwd(userId);
      userService.createUser(user);
      return successJsonResult("创建用戶成功");
    }
    return failureJsonResult("用户已经存在");
  }

  // 修改用户
  @RequestMapping("/user-modify")
  @ResponseBody
  public SimpleJSONResult modifyUser(@Valid SysUser user, BindingResult br) {
    if (br.hasErrors()) {
      return failureJsonResult(br);
    }
    userService.modifyUser(user);
    return successJsonResult("修改用戶成功");
  }

  // 重置用户密码
  @RequestMapping("/user-resetPassword")
  @ResponseBody
  public SimpleJSONResult resetPassword(String sysId, String userId) {
    if (null == userId) {
      return failureJsonResult("数据有误");
    }
    // 修改密码为用户名字
    userService.modifyUserPwd(userId, userId, new Date());
    return successJsonResult("重置密码成功");
  }

  // 删除用户
  @RequestMapping("/user-remove")
  @ResponseBody
  public SimpleJSONResult removeUser(String userId) {
    userService.removeUser(userId);
    return successJsonResult("删除用戶成功");
  }

  // 判断用户user_id是不是重复

  @RequestMapping("/user-check")
  @ResponseBody
  public SimpleJSONResult checkUser(String userId) {
    if (userService.checkUser(userId)) {
      return successJsonResult("正常");
    }
    return failureJsonResult("用户已存在");
  }

  // 获取用户对应的角色
  @RequestMapping("/user-getRole")
  @ResponseBody
  public SimpleJSONResult roleResId(String userId) {
    if (userId == null) {
      return failureJsonResult("缺少必要参数");
    }
    return successJsonResult(userService.getUserRole(userId));
  }

  // 保存角色与用户的关系
  @RequestMapping("/user-role")
  @ResponseBody
  public SimpleJSONResult modifyUserRole(String userId, String roles) {
    if (userId == null) {
      return failureJsonResult("缺少必要参数");
    }
    userService.modifyUserRole(userId, roles);
    return successJsonResult("成功");
  }

}
