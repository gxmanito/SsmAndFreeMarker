package gx.base;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.transaction.TransactionException;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import gx.common.SimpleJSONResult;
import gx.exception.ArgumentRuntimeException;
import gx.exception.BusinessRuntimeException;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 全局异常处理器
 * 
 * @author gx
 * 
 */
public class ExceptionResolver implements HandlerExceptionResolver {
  private static final Logger logger = LoggerFactory
      .getLogger(ExceptionResolver.class);

  @Override
  public ModelAndView resolveException(HttpServletRequest request,
      HttpServletResponse response, Object handler, Exception exception) {
    Class<?> clazz = exception.getClass();
    StringBuilder builder = new StringBuilder();
    if (exception instanceof ArgumentRuntimeException) {
      builder.append("处理时参数错误:");
    } else if (exception instanceof BusinessRuntimeException) {
      builder.append("业务处理错误:");
    } else if (SQLException.class.isAssignableFrom(clazz)
        || DataAccessException.class.isAssignableFrom(clazz)
        || TransactionException.class.isAssignableFrom(clazz)) {
      // 违反主键或唯一约束
      if (exception.getMessage().contains("唯一")) {
        builder.append("数据已存在:");
      } else {
        builder.append("数据库访问异常:");
      }
    } else {
      builder.append("非预期的异常:");
    }
    Throwable cause = exception.getCause();
    if(cause == null){
      builder.append(exception.getMessage());
    } else {
      builder.append(cause);
    }
    
    String msg = builder.toString();
    logger.error(msg, exception);

    HandlerMethod method = (HandlerMethod) handler;
    ResponseBody responseBody = method.getMethodAnnotation(ResponseBody.class);
    if (responseBody == null) {
      ModelAndView view = new ModelAndView("errorView");
      view.addObject("msg", msg);
      return view;
    }

    response.setContentType("application/json;charset=UTF-8");
    try {
      new ObjectMapper().writeValue(response.getWriter(), new SimpleJSONResult(
          false, msg));
    } catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }
}
