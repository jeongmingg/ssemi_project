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
 * Servlet implementation class KakaoInsertController
 */
@WebServlet("/kakaoInsert.me")
public class KakaoInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("userId");
		String memPwd = null;
		String memName = request.getParameter("userName");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		int emailAuth = 1;
		String address = null;
		
		Member m = new Member(memId, memPwd, memName, nickname, email, emailAuth, address);
		
		int result = new MemberService().insertKakaoMember(m);
		
		if(result > 0) {
			Member loginUser = new MemberService().kakaoLoginMember(memId);
			
			if(loginUser == null) {
				request.getSession().setAttribute("alertMsg", "카카오 로그인 실패");
				response.sendRedirect(request.getContextPath());
				
			} else {
				request.getSession().setAttribute("loginUser", loginUser);
				response.sendRedirect(request.getContextPath());
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
