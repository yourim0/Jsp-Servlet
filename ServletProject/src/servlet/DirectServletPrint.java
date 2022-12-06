package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DirectServletPrint.do")
public class DirectServletPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DirectServletPrint() {
        super();
    }
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); //포스트방식일 때 필수 인코딩(입력폼에서 넘어오는 한글)
		PrintWriter writer = response.getWriter();
		
		//form값 받기 id, pwd
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//post 테스트용 
		writer.println("<html>");
		writer.println("<body>");
		writer.println("<h1>Post방식의 요청</h1>");
		writer.print("<p>아이디: " + id + "</p>");
		writer.print("<p>패스워드: " + pwd + "</p>");
		writer.println("</body>");
		writer.println("</html>");
	}

}
