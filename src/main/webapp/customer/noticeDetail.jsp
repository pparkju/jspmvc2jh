
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8"); 
    //** String seq = request.getParameter("c"); //title의 seq번호 (글번호)
    
    %>
    
    <%  
    //NoticeDao dao = new NoticeDao(); // 객체생성
  	//** NoticeDao.java 메소드에서 리턴받아줌 
  	
    //** Notice n= dao.getNotice(seq); //dao객체에 getNotice를 호출(객체를 생성해줘야 오류사라짐), 글번호를 pram 값으로보내줌 
	//vo pakage에 있는 Notice.java 
	// ** --> 이부분 src/main/java 의 NoticeDetailController에서 처리
	/* 	
	--> 이부분 src/main/java 의 NoticeDao에서 처리
	*/	
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetail.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>noticeDetail.jsp</h3>

<table class="twidth">
	<colgroup>
		<col width=15% />
		<col width=35% />
		<col width=15% />
		<col width=35% />
	</colgroup>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td>${n.seq }</td>
			<th class="left">조회수</th>
			<td>${n.hit } </td>
		</tr>
		
		<tr>
			<th class="left">작성자</th>
			<td>${n.writer }</td>
			<th class="left">작성시간</th>
			<td>${n.regdate }</td>
		</tr>
		
		<tr>
			<th class="left">제목</th>
			<td colspan="3" id="title">
			${n.title }
			</td>		
		</tr>
		
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="content">
			${n.content }
			</td>		
		</tr>
		
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addfile">
				첨부
			</td>		
		</tr>
		
	</tbody>


</table>
<div>
	<a href="noticeEdit.do?c=${n.seq }">수정</a>
	<a href="noticeDelProc.do?c=${n.seq }">삭제</a>
	<a href="notice.do">목록</a>
</div>



</body>
</html>

<%

%>