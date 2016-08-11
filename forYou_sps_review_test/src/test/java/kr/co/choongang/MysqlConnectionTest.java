package kr.co.choongang;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MysqlConnectionTest {

		private static final String DRIVER = "com.mysql.jdbc.Driver";
		
		private static final String URL = "jdbc:mysql://localhost:3306/book_ex";
		
		private static final String USER = "root";
		
		private static final String PW = "Yh71010321";
		
		@Test
		public void testConnection()  throws Exception{
			Class.forName(DRIVER);
			
			try {
				Connection con = DriverManager.getConnection(URL, USER, PW);
				
				System.out.println(con);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
}
