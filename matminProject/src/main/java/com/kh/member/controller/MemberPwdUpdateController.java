package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberPwdUpdateController
 */
@WebServlet("/updatePwd.me")
public class MemberPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memNo = request.getParameter("memNo");
		String currentPwd = request.getParameter("currentPwd");
		String newPwd = request.getParameter("newPwd");
		
		int result = new MemberService().updateMemberPwd(memNo, currentPwd, newPwd);
		
		if(result > 0) {
			// 비밀번호 변경 성공
			request.getSession().setAttribute("alertMsg", "비밀번호가 변경되었습니다.");
		} else {
			// 비밀번호 변경 실패(현재 비밀번호를 잘못 입력)
			request.getSession().setAttribute("alertMsg", "비밀번호 변경에 실패했습니다. 현재 사용 중인 비밀번호를 알맞게 입력해주세요.");
		}

		response.sendRedirect(request.getContextPath() + "/myPage.me");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
