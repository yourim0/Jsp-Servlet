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
		
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM board";
		//seachword가 있다는 것은 검색하기 버튼을 눌렀다는 것
		if(map.get("searchWord") != null){
			query += " WHERE " + map.get("searchField")+" "  //where절 항상 공백을 붙혀야 한다.
			//검색 조건이 내용/제목 동적으로 받아와야돼
				+ "LIKE '%" + map.get("searchWord") + "%'";
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
	
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		String query = "insert into board (num,title,content,id,visitcount)"
				+ " values(seq_board_num.nextval,?,?,?,0)";
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1,dto.getTitle());
			psmt.setString(2,dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate(); //추가 성공한 행의 개수 반환
			System.out.print(result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public void updateVisitCount(String num) {
		String query="update board set"
				+ " visitcount = visitcount + 1"
				+ " where num = ?";
		
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1,num);
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public BoardDTO selectView(String num) {
		System.out.print("num:" + num);
		String query = "select b.*, m.name" //이름 조회
				+ " from member m inner join board b"
				+ " on m.id = b.id"
				+ " where num = ?";
		
		BoardDTO dto = new BoardDTO();
		
		
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1,num);
			
			rs = psmt.executeQuery();

			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//update
	public int updateEdit(BoardDTO dto) {
		//System.out.print("dto: : "+dto.getContent());
		int result = 0;
		try {
			
			String query = "UPDATE board SET "
					+ " title=?, content=? "
					+ " WHERE num=?";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			//result=psmt.executeUpdate(); //쿼리 성공시 1, 실패시 0
			
			//System.out.print(query);
			//System.out.print(result);
		}
		catch(Exception e) {
			System.out.print("게시물 수정 중 예외발생");
			e.printStackTrace();
		}

		return result;
		
	}
	

	
	
	public int deletePost(BoardDTO dto) {
	
		int result = 0;
		String query = "delete from board where num = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
			//System.out.print(result);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return result;
	}
}
