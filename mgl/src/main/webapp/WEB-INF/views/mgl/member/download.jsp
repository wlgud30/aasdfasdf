<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>

<%
request.setCharacterEncoding("UTF-8");

String root = request.getSession().getServletContext().getRealPath("/");
System.out.println(request.getSession());
System.out.println(request.getSession().getServletContext());
System.out.println("루트"+root);
String savePath = "C:\\MGLPROJECT\\mgl\\mgl\\src\\main\\webapp\\resources\\apkDownload";
System.out.println(savePath);
String filename = "app-debug.apk";

String orgfilename = "mgl.apk";


InputStream in =null;
OutputStream os =null;
File file = null;
boolean skip = false;
String client = "";
try{
	
	try{
		file = new File(savePath,filename);
		in = new FileInputStream(file);
	}catch(FileNotFoundException fe){
		skip = true;
	}
	
	client = request.getHeader("User-Agent");
	
	response.reset();
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Description", "JSP Generated Data");
	
	if(!skip){
		 if(client.indexOf("MSIE") != -1){
                response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
 
            }else{
                // 한글 파일명 처리
                orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
 
                response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
                response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
            } 
             
            response.setHeader ("Content-Length", ""+file.length() );
 
            os = response.getOutputStream();
            byte b[] = new byte[(int)file.length()];
            int leng = 0;
             
           while( (leng = in.read(b)) > 0 ){
                os.write(b,0,leng);
            }
 
        }else{
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
 
        }
	in.close();
	os.close();
	}catch(Exception e){
		e.printStackTrace();
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>