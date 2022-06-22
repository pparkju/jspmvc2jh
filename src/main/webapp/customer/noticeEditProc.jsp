
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    //String title = request.getParameter("title");
    //String content = request.getParameter("content");
    //String seq = request.getParameter("c"); //noticeEdit에서 수정버튼을 누르면 값을 가져오는 것
    %>
    
    <%
  	//Notice n = new Notice();
    //n.setTitle(title);
    //n.setContent(content);
   	//n.setSeq(seq);
    
    //NoticeDao dao = new NoticeDao();
    //int cnt=dao.update(n);
    
    //if(cnt>0)
    //	response.sendRedirect("noticeDetail.jsp?c="+seq);
    //else
    //	out.write("수정오류");
    
    
	/* 
	NoticeDao.java에서 update 메소드에 
	*/	
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeEditProc.jsp</h3>
<%-- 데이터가 잘 전송되는지 확인
 <%=title %>
<%=content %> --%>


</body>
</html>