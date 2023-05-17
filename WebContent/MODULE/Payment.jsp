<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.AlbumBean" %>

<% request.getParameter("UTF-8"); %>

<jsp:useBean class="member.AlbumMgr" id="albMgr" scope="session" />
<jsp:useBean class="member.RegisterMgr" id="regMgr" scope="session" />

<%
	int no = Integer.parseInt((String)request.getParameter("ALB_No"));
	AlbumBean alb = albMgr.searchAlbum(no);

	String fileName = alb.getAlbumMusic();
	String fileDir = this.getClass().getResource("").getPath();
	fileDir = fileDir.substring(1, fileDir.indexOf(".metadata")) + "JSP-TeamProject/WebContent/DATA-FILE";
	
	File file = new File(fileDir + "/" + fileName);
	
	String mimeType = getServletContext().getMimeType(file.toString());
	if(mimeType == null) {
		response.setContentType("application/octet-stream");
	}
	
	String downName = null;
	downName = new String(fileName.getBytes("UTF-8"), "8859_1");
	
	response.setHeader("Content-Disposition", "attachment; filename=\"" + downName + "\";");
	
	FileInputStream fileInputStream = new FileInputStream(file);
	ServletOutputStream servletOutputStream = response.getOutputStream();
	
	byte b [] = new byte[1024];
	int data = 0;
	
	while((data=(fileInputStream.read(b, 0, b.length))) != -1)
	{
		servletOutputStream.write(b, 0, data);
	}
	
	servletOutputStream.flush();
	servletOutputStream.close();
	fileInputStream.close();
%>

<!-- <script>
	window.onload = function() {
		window.open('', '_self', '');
		window.close();
		self.close();
		return false;
	}
</script> -->