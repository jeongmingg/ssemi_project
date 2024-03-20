package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberFindPwdUpdateController
 */
@WebServlet("/findPwdChange.me")
public class MemberFindPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwdUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memNo = request.getParameter("memNo");
		String newPwd = request.getParameter("newPwd");
		
		int result = new MemberService().updateMemberFindPwd(memNo, newPwd);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "비밀번호 변경이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
			
		} else {
			request.getSession().setAttribute("alertMsg", "비밀번호 변경을 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/findAccountForm.me");
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
