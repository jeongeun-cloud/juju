<<<<<<< HEAD:src/test/java/com/jujumarket/shop/persistence/JDBCTests.java
package com.jujumarket.shop.persistence;
=======
package com.jujumarket.main.persistence;
>>>>>>> 9fa1673cf618378364855308e460106062c76554:src/test/java/com/jujumarket/main/persistence/JDBCTests.java

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
   
   static {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         }catch (Exception e){
            e.printStackTrace();
         }
   }

   
   @Test
   public void testConnection() {
      
      try(Connection con =
      DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "book_ex", 
               "book_ex")){
         log.info(con);
      }catch (Exception e) {
         fail(e.getMessage());
   }
   }
   
}