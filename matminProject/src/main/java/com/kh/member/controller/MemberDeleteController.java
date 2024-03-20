package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memNo = request.getParameter("memNo");
		String memPwd = request.getParameter("userPwd");
		
		int result = new MemberService().deleteMember(memNo, memPwd);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원 탈퇴가 완료되었습니다.\\n그동안 맛집의 민족을 이용해주셔서 감사합니다.");
			request.getSession().removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		} else {
			request.getSession().setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.\\n다시 시도해주세요.");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
