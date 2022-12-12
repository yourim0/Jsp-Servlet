package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

@WebServlet("/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO();
		 
		//검색하기 파라미터 처리 할 맵
		Map<String, Object> map = new HashMap<>();
		
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord != null) {
			map.put("searchField",searchField);
			map.put("searchWord", searchWord);
		}
		
		int totalCount = dao.selectCount(map);
	
		
		//------------------------------------페이징--------------------------------------
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum=1;
		String pageTemp = request.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		int start = (pageNum-1)*pageSize +1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
	
		List<MVCBoardDTO> boardLists = dao.selectListPage(map); //리스트 열 개
		dao.close();
		
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./list.do");
		map.put("pagingImg", pagingImg );
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		request.setAttribute("boardLists", boardLists);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/List.jsp").forward(request, response);
	}

}
