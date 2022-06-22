<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, user, pw);
//접속성공

String sql="select * from nmember where id=?";
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();

//검사진행 일치판단
//데이터베이스의 nmember의 id값을 확인 하는 과정
// blue를 입력했다면 select * from nmember where id='blue'; 이 값을 데이터베이스에서 검색함

String ypass=""; 
int x=-1;
String msg="";

if(rs.next()){// database에 아이디 존재
   ypass=rs.getString("pwd"); //database에서 가져온 pwd를 의미
   if(ypass.equals(password)) //loginform의 패스워드 창에서 넣은 값을 의미 위 두개가 일치하는지 확인
      x=1; //일치해서 true 가 나오면 x를 1로 (id=일치, pw =일치한다는 의미의 상수값)
   else
      x=0; // id는 맞지만 password가 일치하지않는다는 의미

}else{//아이디가 존재하지 않는다 (id,pw 두개의 값이 다 일치하지 않는다)
   x=-1;
}
System.out.println("x value : "+x);  //진행 상황을 메시지의 상태값으로 보기위함 
if(x==1){
   //로그인 성공 했을때 세션에 저장 go MainForm.jsp !!
   session.setAttribute("sessionID", id);
   msg="../MainForm.jsp"; 
   
}else if(x==0){
   msg="loginform.jsp?msg=0"; //위 상태값을 메시지로 보여준다.
}else{
   msg="loginform.jsp?msg=-1";
}

response.sendRedirect(msg);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginproc.jsp</title>
</head>
<body>
<h3>loginproc.jsp</h3>

</body>
</html>