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

	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env"); //기본값
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			
			con = source.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
			if(con != null) {
				con.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
}
