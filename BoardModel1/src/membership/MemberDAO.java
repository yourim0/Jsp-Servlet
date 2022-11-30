package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect{  //쿼리문을 수행 //close는 상속대상이 아니기 때문에 super해야함

	public MemberDAO(String driver, String url, String id, String pwd) { //db접속객체인 connection객체 생성
		super(driver, url, id, pwd);
		
	}
	
	//쿼리문 실행하는 메서드
	public MemberDTO getMemberDTO(String uid, String upwd) {
		
		//1. 조회한 데이터를 담을 객체 생성
		MemberDTO dto = new MemberDTO();
		
		//2. 쿼리문 구성
		String query = "select * from member where id =  ? and pass = ?";
		
		//3. 쿼리문 실행
		try {
			psmt = con.prepareStatement(query); //동적 쿼리문 준비
			psmt.setString(1,  uid); // 쿼리문 첫번째 인파라미터에 값설정
			psmt.setString(2,  upwd);// 쿼리문 두번째 인파라미터에 값설정
			rs = psmt.executeQuery(); //쿼리문 실행
			
			//결과처리
			if(rs.next()) { //쿼리 결과로 얻은 회원 정보를 dto 객체에 저장 
			dto.setId(rs.getString("id"));
			dto.setPass(rs.getString("pass"));
			dto.setName(rs.getString(3));
			dto.setRegidate(rs.getString(4));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	
	
}
