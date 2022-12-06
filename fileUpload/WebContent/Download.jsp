<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<%@ page import = "utils.JSFunction" %>

<%

	String saveDirectory = application.getRealPath("/Uploads");
	String saveFilename = request.getParameter("sName");
	String originalFilename = request.getParameter("oName");
	
	try{
		File file = new File(saveDirectory, saveFilename);
		InputStream inStream = new FileInputStream(file); //부모의 인터페이스타입으로 객체정보 받아옴
		
		//다운로드 받는 파일이름 한글 처리 
		String client = request.getHeader("User-Agent"); //요청헤더 정보에서 user-agent 부분 가져옴
		if(client.indexOf("WOW64") == -1){ //클라이언트 정보에 WOW64 값이 있으면 인터넷 익스플로러 브라우저
			originalFilename = new String(originalFilename.getBytes("UTF-8"),"ISO-8859-1");
		}else{
			originalFilename = new String(originalFilename.getBytes("KSC5601"),"ISO-8859-1");
		}
		
		response.reset();
		response.setContentType("application/otent-stream"); //8비트 단위의 바이너리 데이터 형태로 response객체에 담아서 전송하겟다
		
		//--------------여기 두 줄 파일명부분, 파일 크기 설정 부분만 신경쓰면 된다----------------------
		response.setHeader("Content-Disposition","attachment; filename=\"" + originalFilename + "\"");//파일 다운로드 창 띄움 (몇 퍼센트 진행중)
		response.setHeader("Content-Length", "" + file.length());
		//---------------------------------------------------------------------------------
		out.clear();
		
		OutputStream outStream = response.getOutputStream(); //서버에서 클라인언트 쪽으로 파일 기록
		
		byte b[] = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer  = inStream.read(b)) > 0){ //inputstream을 통해 b 배열의 크기만큼 없을때까지 데이터 읽어옴 
			outStream.write(b,0,readBuffer);
		}
		
		inStream.close();
		outStream.close();
		
	}catch(FileNotFoundException e){
		JSFunction.alertBack("파일을 찾을 수 없습니다.",out);
	}
	catch(Exception e){
		JSFunction.alertBack("예외가 발생했습니다.",out);
	}





%>