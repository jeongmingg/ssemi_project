package com.kh.gmail.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GmailSendActionController
 */
@WebServlet("/gmailSendAction")
public class GmailSendActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GmailSendActionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String memId = request.getParameter("memId");
		String email = request.getParameter("email");
		
//		System.out.println("============= GmailSendActionController에서 받아 온 memId : " + memId + "=============");
		System.out.println("============= GmailSendActionController에서 받아 온 email: " + email + "=============");
		
		request.setAttribute("email", email);
//		request.setAttribute("memId", memId);
		
		request.getRequestDispatcher("views/gmail/gmailSendAction.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}