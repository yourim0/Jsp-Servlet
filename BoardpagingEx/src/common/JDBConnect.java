package common;

import java.sql.*;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs; //executeQuery(String sql) 쿼리 실행시 
	
	
	public JDBConnect() {
		super();
	}
	
	public JDBConnect(String driver, String url, String id, String pwd) { //web.xml값 가져와
		try {
			Class.forName(driver); //드라이버 로드
			con = DriverManager.getConnection(url, id, pwd); //연결 drivermanager 클래스의 getconnection 호출
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public JDBConnect(ServletContext application) {
		
		try {
		String driver = application.getInitParameter("OracleDriver");
		
		Class.forName(driver);
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd");
	}catch(Exception e) {
		e.printStackTrace();
	}
		
	}
	
	
	public void close() {
		try{
			if(rs != null) rs.close();//db가 열려있을 때만, 닫는 순서 rs-> psmt > stmt > con
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	}
		


