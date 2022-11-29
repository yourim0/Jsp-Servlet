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
	
	
	
	public int selectCount(Map<String, Object> map) { //전체 게시물 수 카운트
		
		System.out.print(map);
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM board";
		//seachword가 있다는 것은 검색하기 버튼을 눌렀다는 것
		if(map.get("searchWord") != null){
			query += " WHERE " + map.get("searchField")+" "  //where절 항상 공백을 붙혀야 한다.
			//검색 조건이 내용/제목 동적으로 받아와야돼
				+ "LIKE '%" + map.get("searchWord") + "%'";
			System.out.print(query);
		}
		
		try {
			stmt = con.createStatement();//객체 생성
			rs = stmt.executeQuery(query); //쿼리 실행
			rs.next(); //커서이동
			totalCount = rs.getInt(1);
		}catch(Exception e){
			e.printStackTrace();
		}
		return totalCount;		
	}
	
	
	
	public List<BoardDTO> selectList(Map<String, Object> map){
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "select * from board";
		
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField")+" "
					+ "like '%" + map.get("searchWord") + "%'";
				}
		
		query += " order by num desc"; //게시판 거꾸로 출력하기 위함
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) { //하나의 데이터가 생성될 때 하나의 dto객체를 생성 
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return bbs;
	
	}
}
