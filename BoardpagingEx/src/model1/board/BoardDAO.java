package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}

	
//---------------------------------READ----------------------------------	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "select count(*) from board";
		if(map.get("searchWord")!= null) {
			query += " where " + map.get("searchField")+" "
					+ "like '%" + map.get("searchWord") + "%'";
		}
		 try {
			 stmt = con.createStatement(); // executeQuery(String sql)
			 rs=stmt.executeQuery(query);
			 rs.next();
			 totalCount=rs.getInt(1);
			 	 
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 return totalCount;
	}
	
	//게시물 목록 
	 public List<BoardDTO> selectList(Map<String, Object> map){
		 List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		 
		 String query = "select * from board";
		 
		 if(map.get("searchWord") != null) {
			 query += " where " + map.get("searchField")+" "
					+"like'%" + map.get("searchWord") + "%'";
		 }
		 query += " order by num desc";
	 
		 try {
			 stmt = con.createStatement();
			 rs = stmt.executeQuery(query);
			 
			 while(rs.next()){
				 BoardDTO dto = new BoardDTO();
				 
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			 
			 }
			 
			 }catch(Exception e) {
				 e.printStackTrace();
			}
		 	return bbs;
	 }
	 
//---------------------------------CREATE----------------------------------	
	 
	 
	 
	 
}