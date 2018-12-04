package com.techni.mgl.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadUtil extends AbstractView {
	
	public DownloadUtil() {
		setContentType("application/download;charset=UTF-8");
	}
	@Override
	protected void renderMergedOutputModel(Map model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		File oriFile = (File) model.get("downloadFile");
		
		response.setContentType(getContentType());
		response.setContentLength((int)oriFile.length());
		
		/*Map map =new HashMap();
		map.put("fileNm", oriFile.getName() );*/

		response.setHeader("Content-Transfer-Encoding", "binary");
		String fileName = new String(oriFile.getName().getBytes("EUC-KR"), "ISO-8859-1");
		System.out.println(fileName);
		/*fileName = "C:\\MGLPROJECT\\mgl\\mgl\\src\\main\\webapp\\resources\\apkDownload\\app-debug.apk";
		*/response.setHeader("Content-Disposition", "attachment;filename=\"" +  java.net.URLEncoder.encode(fileName, "utf-8") + "\";");
		OutputStream out = response.getOutputStream();
		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(oriFile);
			
//			while(true) {
//				byte[]	buff = new byte[1024];
//				int	len = fis.read(buff);
//				if(len < 0) {
//					break;
//				}
//				out.write(buff, 0, len);
//			}
			FileCopyUtils.copy(fis, out);
			out.flush();
		}
		catch(Exception e) {
			System.out.println("파일 다운로드 에러 = " + e);
		}
		finally {
			out.close();
			fis.close();
		}
	}
}