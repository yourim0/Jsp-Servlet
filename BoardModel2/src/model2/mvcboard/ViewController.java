package model2.mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewController() {
        super();
    }

    //service : get, post 를 구분하지 않고 모든 요청이 들어올 때마다 호출되는 메소드 (doget사용해도 무관)
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO();
		String idx = request.getParameter("idx"); //이 번호로 상세보기를 조회한다
		//idx번호를 가진 글에 상세 보기 누르면 카운트 증가시킴
		dao.updateVisitCount(idx);
		//특정글 하나 조회하는메소드
		MVCBoardDTO dto = dao.selectView(idx); //넘어오는 하나의 idx에 대한 값 
		dao.close();
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
	
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("./View.jsp").forward(request, response);
	}
}
	