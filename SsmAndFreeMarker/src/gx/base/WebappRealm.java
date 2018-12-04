package gx.base;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import gx.sys.service.CommonService;
import gx.sys.entity.SysUser;

/**
 * 权限验证器
 * 
 * @author gx
 * 
 */
@Component
public class WebappRealm extends AuthorizingRealm {
  private static final Logger logger = LoggerFactory
      .getLogger(WebappRealm.class);
  @Resource
  private CommonService commonService;

  public WebappRealm() {
    super();
    setAuthorizationCachingEnabled(false);
  }

  @Override
  protected AuthorizationInfo doGetAuthorizationInfo(
      PrincipalCollection principals) {
    logger.debug(">>doGetAuthorizationInfo");
    SysUser user = (SysUser) getAvailablePrincipal(principals);
    String userId = user.getUserId();
    SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
    info.addRoles(commonService.getUserRole(userId));
    info.addStringPermissions(commonService.getUserPermision(userId));
    logger.debug("<<doGetAuthorizationInfo");
    return info;
  }

  @Override
  protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
      throws AuthenticationException {
    logger.debug(">>doGetAuthenticationInfo");
    SysUser user = commonService.getUser((String) token.getPrincipal());

    // 用户不存在
    if (user == null) {
      throw new UnknownAccountException();
    }

    // 状态不正常
    if (user.getState() != 0) {
      switch (user.getState()) {
      case 2:
        throw new LockedAccountException();
      case 3:
        throw new DisabledAccountException();
      default:
        throw new DisabledAccountException();
      }
    }
    logger.debug("<<doGetAuthenticationInfo");
    //String.valueOf(user.getGmtUpdate().getTime())   
    return new SimpleAuthenticationInfo(user, user.getUserPwd(),
        ByteSource.Util.bytes(String.valueOf(user.getGmtUpdate().getTime())),
        user.getUserId());
  }

  @Resource
  @Override
  public void setCredentialsMatcher(CredentialsMatcher credentialsMatcher) {
    super.setCredentialsMatcher(credentialsMatcher);
  }
}
