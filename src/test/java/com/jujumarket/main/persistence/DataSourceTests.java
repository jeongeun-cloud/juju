<<<<<<< HEAD:src/test/java/com/jujumarket/shop/persistence/DataSourceTests.java
package com.jujumarket.shop.persistence;
=======
package com.jujumarket.main.persistence;
>>>>>>> 9fa1673cf618378364855308e460106062c76554:src/test/java/com/jujumarket/main/persistence/DataSourceTests.java

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {

   @Setter(onMethod_ = { @Autowired})
   private DataSource dataSource;

   
   @Test
   public void testConnection() {
      
      try(
            Connection con = dataSource.getConnection();){
      
         log.info(con);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         fail(e.getMessage());
      }
   }
   
   
}