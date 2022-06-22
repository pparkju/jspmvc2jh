<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>boardNoticeReg.jsp</h3>

<form action="boardNoticeRegProc.jsp" method="post">
	<dl>
		<dt>제목</dt>
		<dt>
			<input type="text" name="bsubj" />
		</dt>
	</dl>
	<dl>
		<dt>첨부파일</dt>
		<dt>
			<input type="file" name="txtFile" />
		</dt>
	</dl>
	<div>
		<textarea name="bmemo" id="txtmemo" class="txtmemo">박주현 board</textarea>
	</div>
	<input type="submit" value="save" />
	<input type="button" value="cancel" class="cancel" />

</form>
</body>
</html>