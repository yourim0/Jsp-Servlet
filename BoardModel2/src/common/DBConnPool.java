package common;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	
	//생성자
	public DBConnPool() {
	
		try {
			Context initCtx= new InitialContext(); //context =JNDI에서 이름과 실제 객체를 연결해주는 개념
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle"); //네임속성 준 부분
			
			con=source.getConnection(); //db연결
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
