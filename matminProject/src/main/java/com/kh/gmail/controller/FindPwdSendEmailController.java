package com.kh.gmail.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.gmail.Gmail;

/**
 * Servlet implementation class FindPwdSendEmailController
 */
@WebServlet("/findPwdSendEmail")
public class FindPwdSendEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdSendEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 구글 이메일을 이용한 메일 보내기 (SMTP)
		// 1. 구글 계정 생성(기존 이메일 사용해도됨)
		// 2. 계정 -> 보안 설정 진행
		// 1) 2단계 인증 추가
		// 2) 앱 비밀번호 생성(메일, 서버컴퓨터 OS) -> 저장해두기

		String host = "http://localhost:8085" + request.getContextPath();
		String from = "works.jhnam@gmail.com";
		String to = (String)request.getParameter("email");
		
		// 인증번호 8자리 생성
		String cNumber = "";
		Random rnd = new Random();
		for (int i = 0; i < 8; i++) {
			int sel1 = (int) (Math.random() * 3); // 0:숫자 / 1,2:영어
			
			if (sel1 == 0) {
				int num = (int) (Math.random() * 10); // 0~9
				cNumber += num;
			} else {
				char ch = (char) (Math.random() * 26 + 65); // A~Z
				int sel2 = (int) (Math.random() * 2); // 0:소문자 / 1:대문자
				if (sel2 == 0) {
					ch = (char) (ch + ('a' - 'A')); // 대문자로 변경
				}
				cNumber += ch;
			}
		}
		
		//사용자에게 보낼 메시지
		String subject = "비밀번호 찾기 인증 메일입니다.";
		String content = "아래 인증번호를 확인하고, 맛집의 민족 홈페이지에서 인증을 진행해주세요. "
		        + "인증번호 : " + cNumber;
		
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
		
		response.getWriter().print(cNumber);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
