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







}
