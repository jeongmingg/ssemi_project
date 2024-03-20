package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberFindPwdController
 */
@WebServlet("/findPwd.me")
public class MemberFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memName = request.getParameter("userName");
		String memId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		String memNo = new MemberService().selectMemberFindPwd(memName, memId, email);
		
		if("".equals(memNo)) {
			// 해당하는 회원 없음
		} else {
			// 해당하는 회원 있음
			// 회원 이메일로 인증번호 발송
		}
		
		request.setAttribute("memName", memName);
		request.setAttribute("memId", memId);
		request.setAttribute("email", email);
		request.setAttribute("memNo", memNo);
		
		request.getRequestDispatcher("views/member/memberFindPwd.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
