package gx.base;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import gx.common.CommonConstants;
import gx.common.Page;
import gx.common.SimpleJSONResult;

/**
 * 所有controller的基类
 * 
 * @author gx
 * 
 */
public abstract class BaseController implements CommonConstants {
  protected Logger logger = LoggerFactory.getLogger(this.getClass());

  /**
   * 获取分页对象
   * @param pageSize
   * @param pageNo
   * @param params
   * @param clazz
   * @return
   */
  protected <T> Page<T> getPage(Integer pageSize, Integer pageNo,
      Object params, Class<T> clazz) {
    Page<T> page = new Page<T>(clazz);
    if (pageSize != null) {
      page.setPageSize(pageSize);
    }
    if (pageNo != null) {
      page.setPageNo(pageNo);
    }
    page.setParams(params);
    return page;
  }

  /**
   * 获取请求参数<br>
   * 空或空字符串都返回null
   * 
   * @param name 参数名称
   * @return
   */
  protected String getParameter(HttpServletRequest request, String name) {
    String param = request.getParameter(name);
    return StringUtils.isBlank(param) ? null : param;
  }

  /**
   * 获取所有请求参数<br>
   * 空或空字符串都返回null
   * 
   * @return
   */
  protected Map<String, String> getParameters(HttpServletRequest request) {
    Map<String, String> params = new HashMap<String, String>();
    @SuppressWarnings("unchecked")
    Enumeration<String> names = request.getParameterNames();
    
    while (names.hasMoreElements()) {
      String name = names.nextElement();
      params.put(name, getParameter(request, name));
    }
    return params;
  }

  /**
   * json成功结果
   * 
   * @param data 信息数据
   * @return
   */
  protected SimpleJSONResult successJsonResult(Object data) {
    return new SimpleJSONResult(true, data);
  }

  /**
   * json失败结果
   * 
   * @param data 信息数据
   * @return
   */
  protected SimpleJSONResult failureJsonResult(Object data) {
    return new SimpleJSONResult(false, data);
  }

  /**
   * json失败结果
   * 
   * @param data 信息数据
   * @return
   */
  protected SimpleJSONResult failureJsonResult(BindingResult br) {
    StringBuilder builder = new StringBuilder();
    for (Iterator<ObjectError> it = br.getAllErrors().iterator(); it.hasNext();) {
      builder.append(it.next().getDefaultMessage()).append("<br/>");
    }
    return new SimpleJSONResult(false, builder.toString());
  }

  /**
   * 下载文件
   * 
   * @param request
   * @param response
   * @param downloadFile 下载的实际文件
   * @param aliasName 下载显示的文件名称
   * @return
   * @throws Exception
   */
  protected ResponseEntity<FileSystemResource> downlod(
      HttpServletRequest request, HttpServletResponse response,
      File downloadFile, String aliasName) throws Exception {
    HttpHeaders headers = new HttpHeaders();
    FileSystemResource body = null;
    HttpStatus statusCode = HttpStatus.NOT_FOUND;
    if (downloadFile.exists() && downloadFile.isFile()) {
      body = new FileSystemResource(downloadFile);
      headers.add("Content-Type", "application/octet-stream");
      headers.add("Content-Length", "" + downloadFile.getUsableSpace());
      headers.add(
          "Content-Disposition",
          "attatchment;filename="
              + getFileName(request.getHeader("User-Agent"), aliasName));
      statusCode = HttpStatus.OK;
      Subject subject = SecurityUtils.getSubject();
      String user = subject == null ? "" : subject.getPrincipal().toString();
      logger.info("用户{} 下载文件 {}", user,
          aliasName + "(" + downloadFile.getName() + ")");
    }
    return new ResponseEntity<FileSystemResource>(body, headers, statusCode);
  }

  /**
   * 获取文件下载名称
   * 
   * @param agent
   * @param fileName
   */
  protected String getFileName(String agent, String fileName)
      throws UnsupportedEncodingException {
    if (agent != null) {
      agent = agent.toLowerCase();
      if (agent.indexOf("firefox") != -1) {
        fileName = new String(fileName.getBytes(), "iso-8859-1");
      } else {
        fileName = URLEncoder.encode(fileName, "utf-8");
      }
    }
    return fileName;
  }
}
