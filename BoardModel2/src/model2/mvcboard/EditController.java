package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/edit.do")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public EditController() {
        super();
    }
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("./Edit.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 물리적 경로
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		int maxPostSize = 1024*1000;
		
		//파일업로드
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		if(mr == null) {
			JSFunction.alertBack(response, "첨부파일 용량 초과");
			return;
		}
		
		//수정 내용 매개변수에서 얻어옴
		String idx = mr.getParameter("idx");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		//비밀번호는 세션에서 가져옴
		HttpSession session = request.getSession();
		String pass = (String)session.getAttribute("pass");
		
		//dto에 저장
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		
		//원본 파일명과 저장된 파일 이름 설정
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) {
			//첨부파일 있으면 파일명 변경
			//새로운 파일명 생성
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			//파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			//dto에 저장
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			//기존 파일 삭제 
			FileUtil.deleteFile(request, "/Uploads", prevSfile);
			
		}else {
			//첨부파일 없으면 기존 이름 유지
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		//db에 수정 내용 반영
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.updatePost(dto);
		System.out.println("result : "+result); //0
		dao.close();
		
		if(result == 1) {
			session.removeAttribute("pass");
			response.sendRedirect("view.do?idx=" + idx); 
		}else {
			JSFunction.alertLocation(response, "비밀번호 검증 다시 진행하세요", "view.do?id=" + idx);
		}
	}

}
