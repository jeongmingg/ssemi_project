package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = (String)request.getParameter("userId");
		String userPwd = (String)request.getParameter("userPwd");
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		if(loginUser == null) {
			request.setAttribute("loginSuccess", "실패");
			request.getRequestDispatcher("views/member/memberCommonLogin.jsp").forward(request, response);
			
		} else {
			if (loginUser.getMemId().equals("admin")) {
				request.getSession().setAttribute("loginUser", loginUser);
				request.getRequestDispatcher("views/admin/adminMainStatsPage.jsp").forward(request, response);
			} else {
				if (loginUser.getEmailAuth() == 1) {
					request.getSession().setAttribute("loginUser", loginUser);
					response.sendRedirect(request.getContextPath());
	
				} else {
					response.sendRedirect(request.getContextPath() + "/gmailSendAction?email=" + loginUser.getEmail());
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
