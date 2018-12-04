package gx.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 分页信息(注意要先设置每页记录数)
 * 
 * @author gx
 * 
 */
public class Page<T> {
  @JsonIgnore
  private transient boolean pagingFlag = true;// 分页标志
  @JsonIgnore
  private transient boolean onlyResults;// 只查询分页结果标志
  private int start;// 开始行下标
  private int pageSize = 10;// 每页记录数
  private int pageNo = 1;// 当前页码
  private int totalCount;// 总记录数
  private int totalPage;// 总页数
  private Object params;// 参数对象
  private List<T> results = new ArrayList<T>();// 结果集
  @JsonIgnore
  private transient Class<?> entityClass;// 记录类型

  public Page() {
    this.entityClass = Map.class;
  }

  public Page(Class<?> entityClass) {
    this.entityClass = entityClass;
  }

  public boolean isPagingFlag() {
    return pagingFlag;
  }

  public void setPagingFlag(boolean pagingFlag) {
    this.pagingFlag = pagingFlag;
  }

  public boolean isOnlyResults() {
    return onlyResults;
  }

  public void setOnlyResults(boolean onlyResults) {
    this.onlyResults = onlyResults;
  }

  public int getStart() {
    return start;
  }

  public void setStart(int start) {
    this.start = start;
    if (pagingFlag) {
      this.pageNo = start / pageSize + 1;
    }
  }

  public int getPageSize() {
    return pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public int getPageNo() {
    return pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
    if (pagingFlag) {
      this.start = (pageNo - 1) * pageSize;
    }
  }

  public int getTotalCount() {
    return totalCount;
  }

  public void setTotalCount(int totalCount) {
    this.totalCount = totalCount;
    if (pagingFlag) {
      setTotalPage(totalCount == 0 ? 0 : totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1));
    }
  }

  public int getTotalPage() {
    return totalPage;
  }

  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }

  public Object getParams() {
    return params;
  }

  public void setParams(Object params) {
    this.params = params;
  }

  public List<T> getResults() {
    return results;
  }

  public Class<?> getEntityClass() {
    return entityClass;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("Page [pagingFlag=").append(pagingFlag).append(", onlyResults=").append(onlyResults)
        .append(", start=").append(start).append(", pageSize=").append(pageSize).append(", pageNo=").append(pageNo)
        .append(", totalCount=").append(totalCount).append(", totalPage=").append(totalPage).append(", params=")
        .append(params).append(", results=").append(results).append(", recordType=").append(entityClass).append("]");
    return builder.toString();
  }
}
