package common;

import java.sql.*;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	

	 //생성자 1
	public JDBConnect() {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //클래스라는 클래스, oracledriver라는 이름이 있는지 체크 (없으면 오라클 사용못함)
			con = DriverManager.getConnection(url, "scott", "tiger"); //연결 부분, driverManager도 클래스
			//편하지만 데이터가 다 보여서 좋지 않음
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/*
	 //생성자 오버로딩 1. 
	public JDBConnect(String driver, String url, String id, String pwd) {
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//생성자 오버로딩 2.
	public JDBConnect(ServletContext application) {
		//xml 정보를 여기서 가져와서 초기화 해준다
		try{
			
			String driver = application.getInitParameter("OracleDriver");
			
			Class.forName(driver);
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			con = DriverManager.getConnection(url, id, pwd);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	*/
	
	//변수화 
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
