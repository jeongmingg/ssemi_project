<%@page import="com.kh.gmail.Gmail"%>
<%@page import="com.kh.gmail.SHA256"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String host = "http://192.168.20.6:8085" + request.getContextPath();
	String from = "works.jhnam@gmail.com";
	String to = (String)request.getAttribute("email");
	String code = SHA256.getEncrypt(to, "cos");
	
	System.out.println("============= " + host + " =============");
	System.out.println("============= gmailSendAction에 받아온 email: " + to + "=============");
	
	//사용자에게 보낼 메시지
	String subject = "회원가입을 위한 이메일 인증 메일입니다.";
	String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요. " 
	        + "<a href='" + host + "/gmailCheckAction?email=" + to + "&code=" + code
			+ "'>이메일 인증하기</a>";
	
	System.out.println("============= 사용자한테 보내는 메시지 =============");
	System.out.println(content);

	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465"); //TLS 587, SSL 465
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465"); 
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.sockerFactory.fallback", "false");
	p.put("mail.smtp.ssl.protocols", "TLSv1.2");
	p.put("mail.smtp.ssl.enable", "true");
	
	try{
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html; charset=UTF8");
		Transport.send(msg);

	} catch (Exception e) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일 인증 오류')");
		script.println("history.back();");
		script.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/gmail/gmailSendAction.css">
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>
	
	<h1 id="h1">
		이메일 주소 인증 메일이 전송되었습니다. <br>
		회원가입 시 입력한 이메일(<%= to %>)에 들어가서 인증해주세요.
	</h1>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>