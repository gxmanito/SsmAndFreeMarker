package gx.util.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JdbcUtil {
  private static final Logger logger = LoggerFactory.getLogger(JdbcUtil.class);

  /**
   * 关闭connection
   * 
   * @param connection
   */
  public static void closeConnection(Connection connection) {
    if (connection != null) {
      try {
        connection.close();
      } catch (Exception e) {
        logger.error("close Connection error", e);
      }
    }
  }

  /**
   * 关闭statement
   * 
   * @param statement
   */
  public static void closeStatement(Statement statement) {
    if (statement != null) {
      try {
        statement.close();
      } catch (Exception e) {
        logger.error("close Connection error", e);
      }
    }
  }

  /**
   * 关闭resultSet
   * 
   * @param resultSet
   */
  public static void closeResultSet(ResultSet resultSet) {
    if (resultSet != null) {
      try {
        resultSet.close();
      } catch (Exception e) {
        logger.error("close ResultSet error", e);
      }
    }
  }
}
