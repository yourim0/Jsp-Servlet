<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fileUpload.MyfileDTO" %>
<%@ page import="fileUpload.MyfileDAO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> <!-- 이거 쓸려고 cos.jar다운받은 것  -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 이건 뭐지 -->
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %> <!--  -->
<%
	String saveDirectory = application.getRealPath("/Uploads");  //실제 물리적 경로 
	//C:\work\jspworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileUpload\Uploads	
	int maxPostSize = 1024 * 1000; //업로드 가능한 최대 용량 설정
	String encoding = "UTF-8";
	
	try{
	//1. 객체생성 (생성과 동시에 파일 업로드)
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding); //매개변수는 정해져 있다

	String fileName = mr.getFilesystemName("attachedFile");//넘어오는 파일 이름 받음 //request객체로 받는게 아니라 multipartrequest가 제공하는 메소드 사용해야돼
	String ext = fileName.substring(fileName.lastIndexOf(".")); //확장자 추출(. 기준으로 파일명, 확장자 분리)
	String now = new SimpleDateFormat("yyyMMdd_HmsS").format(new Date());
	String newFileName = now + ext; //겹칠일 없이 now로 생성

	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);


	//2. 나머지 폼 데이터 받기
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	//카테고리를 하나의 문자열로 만들기 위해ㅐ?
	StringBuffer cateBuf = new StringBuffer();
	
	if(cateArray == null){
		cateBuf.append("선택없음");
	}else{
		for(String s:cateArray){
			cateBuf.append(s+",");
		}
	}
	
	//3. DTO 생성 및 값 저장
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString()); //buffer쓸때 꼭 tostring
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	
	//4. DAO 생성 및 DB 저장
	MyfileDAO dao = new MyfileDAO();
	dao.insertFile(dto);
	dao.close();
	
	//처리한 정보 필요없으니까 redirect 
	
	response.sendRedirect("FileList.jsp");

	}catch(Exception e){
		e.printStackTrace();
	}



%>
