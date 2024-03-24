<%@page import="java.io.PrintWriter"%>
<%@page import="com.kh.gmail.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session을 이용하여 userId를 찾아서 DB에 저장된 email을 가져온다. ex) codingspecialist@naver.com
	String email = (String)request.getAttribute("email");

	//해당 이메일로 SHA256한 값과 code 값을 비교한다.
	String code = (String)request.getAttribute("code");
	boolean rightCode = 
			SHA256.getEncrypt(email, "cos").equals(code) ? true : false;
	PrintWriter script = response.getWriter();
	if(rightCode == true){
		script.println("<script>");
		script.println("location.href='" + request.getContextPath() + "/updateAuth.me?email=" + email + "'");
		script.println("alert('이메일 인증에 성공하였습니다.')");
		script.println("</script>");
	} else{
		script.println("<script>");
		script.println("alert('이메일 인증을 실패하였습니다.')");
		script.println("location.href='" + request.getContextPath() + "'");
		script.println("</script>");
	}
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>맛집의 민족</title>
</head>
<body>

</body>
</html>