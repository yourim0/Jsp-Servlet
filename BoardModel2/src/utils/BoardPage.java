package utils;

public class BoardPage {
	
	//totalcount, pagesize : list.jsp에서 받아옴 
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pagingStr="";
		System.out.print("pagenum:" + pageNum);
		//전체 페이지수 출력
		int totalPages = (int)(Math.ceil(((double)totalCount/pageSize)));
		//페이지블록의 첫번째 시작값(ex. 1, 6, 11..)
		int pageTemp = (((pageNum -1)/blockPage)*blockPage) + 1; 
		System.out.print("pageTemp!!!!!!!!!!!!!!!" + pageTemp);
	
		//pageTemp가 1이 아닐때만(첫번재 블록에서는 안보임) 화면출력 (이전블록) 
		if(pageTemp != 1) {
			//reqUrl : list.jsp 브라우저 실행시 생성되는 주소값
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫페이지]</a>"; //uri=BoardModel1paging/List.jsp
			pagingStr += "&nbsp;";
			pagingStr +="<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
						+ "'>[이전 블록]</a>";
		}
		
		//각 페이지 번호 출력
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				pagingStr += "&nbsp;" + pageTemp +"&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp 
						+ "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		if(pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqUrl +"?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		}
		
		return pagingStr;
		
	}

}
