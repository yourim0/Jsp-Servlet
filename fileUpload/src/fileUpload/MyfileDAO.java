package fileUpload;

import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class MyfileDAO extends DBConnPool {
//물리적인 파일은 서버, 
	
	public int insertFile(MyfileDTO dto) {
		int applyResult=0;
		try {
			String query =" INSERT INTO myfile("
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
	
	
	
	public List<MyfileDTO> myFileList(){
		List<MyfileDTO> fileList = new ArrayList<MyfileDTO>();
		String query = "select * from myfile order by idx desc";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				
				fileList.add(dto);
			}
			
		}catch(Exception e) {
			System.out.print("select 중 예외발생");
			e.printStackTrace();
		}
		return fileList;
	}
}
