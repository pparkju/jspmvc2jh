<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jstl1_token</h3>

<%-- <c:forTokens items="이름1,이름1,이름1,이름1,이름1" delims=",">
	<br />반복
</c:forTokens> --%>

<c:forTokens items="이름1,이름1,이름1,이름1,이름1" delims=",">
	<br />반복
</c:forTokens>

</body>
</html>