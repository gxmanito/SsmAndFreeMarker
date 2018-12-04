package gx.base;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.stereotype.Component;

import gx.common.SimpleCode;
import gx.sys.service.CommonService;

/**
 * 权限加载器
 * 
 * @author gx
 * 
 */
@Component
public class FilterChainFactoryBean implements FactoryBean<Map<String, String>> {
  private static final Logger logger = LoggerFactory
      .getLogger(FilterChainFactoryBean.class);

  @Resource
  private CommonService commonService;

  /**
   * 权限map
   */
  @Override
  public Map<String, String> getObject() throws Exception {
    Map<String, String> map = new LinkedHashMap<String, String>();
    map.put("/", "anon");
    map.put("/test/**", "anon");
    map.put("/login", "anon");
    map.put("/sysdate", "anon");
    map.put("/doLogin", "anon");
    map.put("/logout", "logout");
    map.put("/static/**", "anon");
    map.put("/stats/**", "anon");
    Iterator<SimpleCode> it = commonService.getAllResRole().iterator();
    while (it.hasNext()) {
      SimpleCode simpleCode = it.next();
      if (StringUtils.isBlank(simpleCode.getName())) {
        map.put(simpleCode.getId(), "anyRole[" + simpleCode.getRemarks() + "]");
        logger.info("{} === anyRole[{}]", simpleCode.getId(),
            simpleCode.getRemarks());
      } else {
        map.put(simpleCode.getId(), "perms[" + simpleCode.getName() + "]");
        logger.info("{} === perms[{}]", simpleCode.getId(),
            simpleCode.getName());
      }
    }
    map.put("/**", "authc");
    return map;
  }

  @Override
  public Class<?> getObjectType() {
    return Map.class;
  }

  @Override
  public boolean isSingleton() {
    return true;
  }

}