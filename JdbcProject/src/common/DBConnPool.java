package common;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	
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
			if(con != null) {
				con.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
}
