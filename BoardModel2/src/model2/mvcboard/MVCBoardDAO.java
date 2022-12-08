package model2.mvcboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;
import lombok.NoArgsConstructor;

@NoArgsConstructor
public class MVCBoardDAO extends DBConnPool{
	
	
//----------------------------------selectCount (게시물카운트)-------------------------------------	
	
	public int selectCount(Map<String,Object> map) {
	
		int totalCount = 0;
		String query = "select count(*) from mvcboard";
		
		//동적 쿼리문
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord")+ "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
			
		}catch(Exception e) {
			System.out.print("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	

//----------------------------------selectListPage(페이지 당 최대 10개 게시물출력)-------------------------------------

	public List<MVCBoardDTO> selectListPage(Map<String,Object> map){
		
		List<MVCBoardDTO> board = new ArrayList<>();
		
		String query = " "
                + "SELECT * FROM ( "
                + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                + "        SELECT * FROM mvcboard ";

		   if (map.get("searchWord") != null)
		   {
		       query += " WHERE " + map.get("searchField")
		              + " LIKE '%" + map.get("searchWord") + "%' ";
		   }
		
		   query += "        ORDER BY idx DESC "
		          + "    ) Tb "
		          + " ) "
		          + " WHERE rNum BETWEEN ? AND ?";
				
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));

				board.add(dto);
			}
		}catch(Exception e) {
			System.out.print("게시물 조회 중 예외발생");
			e.printStackTrace();
		}
		return board;
	}

//----------------------------------insertWrite(게시물 작성)-------------------------------------
	
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		
		
		String query = " insert into mvcboard (idx,name,title,content,ofile,sfile,pass) "
						+" values (seq_board_num.nextval,?,?,?,?,?,?)";
		
		try {
		psmt = con.prepareStatement(query);
		psmt.setString(1, dto.getName());
		psmt.setString(2, dto.getTitle());
		psmt.setString(3, dto.getContent());
		psmt.setString(4, dto.getOfile());
		psmt.setString(5, dto.getSfile());
		psmt.setString(6, dto.getPass());
		
		result = psmt.executeUpdate();
		
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
			
		}return result;
	}


//----------------------------------updateVisitCount(조회수 증가)-------------------------------------

	public void updateVisitCount(String idx) {
		String query = "update mvcboard"
					+ " set visitcount = visitcount + 1"
					+ " where idx=?"; 
					
		try {
			
		psmt = con.prepareStatement(query);
		psmt.setString(1, idx);
		psmt.executeQuery();
		
		
		}catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
			
		}		
	}

//----------------------------------selectView(idx에 해당하는 정보 조회)-------------------------------------	
	
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		String query = "select * from mvcboard where idx=?";
		
		try {
			
		psmt = con.prepareStatement(query);
		psmt.setString(1, idx);
		rs = psmt.executeQuery();
		
		if(rs.next()) {
			dto.setIdx(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setContent(rs.getString(4));
			dto.setPostdate(rs.getDate(5));
			dto.setOfile(rs.getString(6));
			dto.setSfile(rs.getString(7));
			dto.setDowncount(rs.getInt(8));
			dto.setPass(rs.getString(9));
			dto.setVisitcount(rs.getInt(10));
		}
		
		
		}catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
			
		}		
		
		return dto;
	}
	

	//----------------------------------downCountPlus(다운로듯 수 증가)-------------------------------------	
	
	
	public void downCountPlus(int idx) {
		String query = "update mvcboard"
					+ " set downcount = downcount +1"
					+ " where idx=?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setLong(1, idx);
			psmt.executeQuery();
			}catch(Exception e) {
				System.out.println("다운로드 증가 중 예외 발생");
				e.printStackTrace();
				
			}		
		
		
		
		
	}
}
