package model2.mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/pass.do")
public class PassController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public PassController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		request.setAttribute("mode", mode);
		request.getRequestDispatcher("./Pass.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	//매개변수 저장
	String idx = request.getParameter("idx");
	String mode = request.getParameter("mode");
	String pass = request.getParameter("pass");
	
	
	//비밀번호 확인
	MVCBoardDAO dao = new MVCBoardDAO();
	boolean confirmed = dao.confirmPassword(pass, idx);
	System.out.println(confirmed);
	dao.close();
	
	if(confirmed) {
		if(mode.equals("edit")) { //수정
			HttpSession session = request.getSession();
			session.setAttribute("pass", pass); //세션영역에 비밀번호 저장
			response.sendRedirect("edit.do?idx=" + idx);
		
		}else if(mode.equals("delete")) { //삭제
			dao = new MVCBoardDAO();
			MVCBoardDTO dto = dao.selectView(idx);//해당 idx 게시글 존재여부 확인
			int result = dao.deletePost(idx);
			dao.close();
			if(result == 1) { //게시물 삭제 성공 시 첨부파일도 삭제
				String saveFileName = dto.getSfile();
				FileUtil.deleteFile(request, "/Uploads", saveFileName);
				System.out.println("삭제됨");
			}
			JSFunction.alertLocation(response, "삭제되었습니다.", "list.do");
		}

	}else {
		JSFunction.alertBack(response, "비밀번호 불일치");
	}
	
	
	}

}
