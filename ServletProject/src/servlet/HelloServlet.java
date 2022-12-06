package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloServlet") //uri값
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    public HelloServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//옛날사용방식
		//PrintWriter out = response.getWriter();
		//out.println("<html>");
		//out.println("<body>");
		//out.println("<h1>Hello Servlet</h1>");
		//out.println("</body>");
		//out.println("</html>");
		
		//지금 사용 - 데이터 처리 용도로만 사용
		request.setAttribute("message","HelloServlet");  //리다이렉트하면 msg 접근권한 없으니까 forward
		request.getRequestDispatcher("HelloServlet.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
