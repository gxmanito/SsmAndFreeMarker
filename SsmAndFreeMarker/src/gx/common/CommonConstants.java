package gx.common;


public interface CommonConstants {
  /**
   * 数据文件类型
   * 
   * @author gx
   * 
   */
  enum DataFileType {
    TXT(".txt"), XML(".xml"), CSV(".csv"), PROPERTIES(".properties"), XLS(".xls"), XLSX(".xlsx");
    private String extension;

    private DataFileType(String extension) {
      this.extension = extension;
    }

    @Override
    public String toString() {
      return extension.toString();
    }
  }

  /**
   * 网络连接类型
   * 
   * @author wings
   * 
   */
  public enum ConnectType {
    UDP, TCP, HTTP, HTTPS, FTP, SFTP, SSH, SSH2;
  }

  /**
   * 数据库类型
   * 
   * @author wings
   * 
   */
  enum DatabaseType {
    ORACLE, DB2, MYSQL, SYBASE, SQL_SERVER;
  }

}
