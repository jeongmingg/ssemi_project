package com.kh.gmail.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GmailCheckActionController
 */
@WebServlet("/gmailCheckAction")
public class GmailCheckActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GmailCheckActionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String code = request.getParameter("code");
//		String memId = request.getParameter("memId");
		
		System.out.println("============= gmailCheckActionController에 받아온 email :" + email + "=============");
		System.out.println("============= gmailCheckActionController에 받아온 code :" + code + "=============");
//		System.out.println("============= gmailCheckActionController에 받아온 memId: " + memId + "=============");
		
//		Member m = new MemberService().selectMemberEmail(memId);
//		String email = m.getEmail();
		
		request.setAttribute("email", email);
		request.setAttribute("code", code);
		request.getRequestDispatcher("views/gmail/gmailCheckAction.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
