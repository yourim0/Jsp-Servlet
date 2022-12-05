package fileUpload;

import common.DBConnPool;

public class MyfileDAO extends DBConnPool {
//물리적인 파일은 서버, 
	
	public int insertFile(MyfileDTO dto) {
		int applyResult=0;
		try {
			String query ="INSERT INTO myfile("
						+ " idx, name, title, cate, ofile, sfile)"
						+ " VALUES ("
						+ " seq_board_num.nextval,?,?,?,?,?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1,  dto.getName());
			psmt.setString(2,  dto.getTitle());
			psmt.setString(3,  dto.getCate());
			psmt.setString(4,  dto.getOfile());
			psmt.setString(5,  dto.getSfile());
			
			applyResult = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.print("insert 중 예외발생");
			e.printStackTrace();
		}
		return applyResult;
	}
}
