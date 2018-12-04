package gx.base;

import java.io.IOException;

import com.jagregory.shiro.freemarker.ShiroTags;

import freemarker.template.TemplateException;

public class FreeMarkerConfigurer extends
    org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer {
  @Override
  public void afterPropertiesSet() throws IOException, TemplateException {
    super.afterPropertiesSet();
    this.getConfiguration().setSharedVariable("shiro", new ShiroTags());
  }

}
