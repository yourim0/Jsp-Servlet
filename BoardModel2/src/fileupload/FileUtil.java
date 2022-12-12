package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int maxPostSize) {
		try {
			return new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8");
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void download(HttpServletRequest req, HttpServletResponse resp, String directory, String sfileName, String ofileName) {
		
		String sDirectory = req.getServletContext().getRealPath(directory); //jsp에서의 내장객체 이용한 String saveDirectory = application.getRealPath("/Uploads"); 와 같음
		try {
			File file = new File(sDirectory, sfileName); //서버에 잇는 파일정보를 가져오고
			InputStream inStream = new FileInputStream(file); //inputstram으로 저장하면 buffer공간에 저장
		
			//한글처리
			String client = req.getHeader("User-Agent");
			if(client.indexOf("WOW64") == -1){ //클라이언트 정보에 WOW64 값이 있으면 인터넷 익스플로러 브라우저
				ofileName = new String(ofileName.getBytes("UTF-8"),"ISO-8859-1");
			}else{
				ofileName = new String(ofileName.getBytes("KSC5601"),"ISO-8859-1");
			}
			
			//다운로드 창 보여주는 역할
			resp.reset();
			resp.setContentType("application/otent-stream");
			resp.setHeader("Content-Disposition","attachment; filename=\"" + ofileName + "\"");
			resp.setHeader("Content-Length", "" + file.length());
		
			//out.clear();
			OutputStream outStream = resp.getOutputStream();
			
		
		}catch(FileNotFoundException e){
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		}
		catch(Exception e){
			System.out.println("예외가 발생했습니다.");
			e.printStackTrace();
		}
		
	}
	
	
//------------------------------파일 삭제----------------------------
	
	public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		String sDirectory = req.getServletContext().getRealPath(directory);//파일이 저장된 물리적 경로
		File file = new File(sDirectory + File.separator + filename); //파일 객체 생성
		if(file.exists()) {
			file.delete();
		}
	}
	
}
