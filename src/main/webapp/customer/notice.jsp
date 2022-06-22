<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
	//****db접속 NoticeController.java 에서 처리
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>notice</h3>

<script>
function clearVal() {
	var inputval = document.getElementById("q");
	inputval.value = ""; //검색값을 입력한 후 다시 검색창을 누르면 inputval의 값을 지워버리겠다.
}
</script>

<!-- 세션을 이용한 조건문 -->
<c:if test="${empty sessionScope.uid }"> <!-- uid가 비어있을때(없으면) true ->login상태 / login이 나와야함 -->
	<a href="../login/login.do">login</a> | 
	<a href="#">join</a> 
</c:if>

<c:if test="${not empty sessionScope.uid }"> <!-- uid가 있으면 true 비어있지 않다면 login상태일떄-->
	<a href="../login/logoutproc.do">logout</a>
</c:if>

<br />

${uid } 님 반가반가 <br />
${sessionScope.uid } 님 방가방가
<hr />

<form action="notice.do" method="get">
	<select name="f">
		<option ${param.f=="title"?"selected":"" } value="title">제목</option>
		<option ${param.f=="content"?"selected":"" } value="content">내용</option>
	</select>
	<input type="text" id="q" name="q" value="${query }" onclick="clearVal();" />
	<input type="submit" value="검색"  />
</form>

<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<c:forEach items="${list }" var="n">
	
		<tr>
			<td>${n.seq }</td>
			<td><a href="noticeDetail.do?c=${n.seq }&h=${n.hit }">${n.title }</a></td>
			<td>${n.writer }</td>
			<td>${n.regdate } </td>
			<td>${n.hit }</td>
		</tr>
		
	</c:forEach>
	
	
	

</table>
<c:if test="${not empty sessionScope.uid }"> <!-- uid가 있으면 -->
	<a href="noticeReg.jsp">write</a>
</c:if>



</body>
</html>