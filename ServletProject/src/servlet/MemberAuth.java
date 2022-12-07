package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

@WebServlet(urlPatterns={"/MemberAuth.mvc"}, 
initParams= {@WebInitParam(name="admin_id", value="nakja")}) //하나이상의 주소를 받을 땐 속성을 넣어줘야돼
public class MemberAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //변수 
	
	MemberDAO dao;
	
	
    public MemberAuth() {
        super();
    }

    
    //1. db관련 정보 담당(web.xml의 context-param 정보)
	public void init() throws ServletException {
			ServletContext application = this.getServletContext(); //application객체에 대한 정보를 받아올 수 있다. (this:application객체) 
			
			//JDBC 생성에 전달해서 con객체 생성하고 쿼리문 실행 위함.
			String driver = application.getInitParameter("OracleDriver");
			String connectUrl = application.getInitParameter("OracleURL");
			String oId = application.getInitParameter("OracleId");
			String oPass = application.getInitParameter("OraclePwd");
			
			dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}
	
	
	
	//2. this:servlet객체 //servlet 객체로 초기화된 파라미터 값을 받아올 수 있따(memberAuth자체가 servlet객체)
	//3. servlet에서도request객체를 통해 파라미터를 받을 수 있다 (MemberAuth.jsp 클릭시 넘어오는)
	//4. 받아온 값을 dao에 넘겨서 회원인지 여부 판단

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {//요청있을 때마다 자동호출
		String admin_id = this.getInitParameter("admin_id");

		String id = request.getParameter("id");
		System.out.print(id);
		String pass = request.getParameter("pass");
		
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		String memberName = memberDTO.getName();
		
		if(memberName != null) {
			request.setAttribute("authMessage", memberName + "회원님~!~! 하이~!!!!!!!");
		}else {
			if(admin_id.equals(id)) {
				request.setAttribute("authMessage", admin_id + "는 최고 관리자 입니당");
			}else{
				request.setAttribute("authMessage", "당신은 회원이 아니에요!!!!");
			}
		}
  		request.getRequestDispatcher("./MemberAuth.jsp").forward(request,response);
	} 

	
	
	public void destroy() {
		dao.close();
	}
}














