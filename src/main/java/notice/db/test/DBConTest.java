package notice.db.test;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBConTest {

	//db접속 단위테스트
		@Test
		public void testDbcon() throws Exception {
				
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String pw = "123456";

			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, pw);
			
			
		}
}
