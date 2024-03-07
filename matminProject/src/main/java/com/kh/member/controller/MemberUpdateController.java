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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("userId");
		String memName = request.getParameter("userName");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		Member m = new Member();
		m.setMemId(memId);
		m.setMemName(memName);
		m.setNickname(nickname);
		m.setEmail(email);
		m.setAddress(address);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem != null) {
			request.getSession().setAttribute("loginUser", updateMem);
			request.getSession().setAttribute("alertMsg", "회원 정보 수정이 완료되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/myPage.me");
			
		} else {
			request.getSession().setAttribute("alertMsg", "회원 정보 수정을 실패했습니다.");
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
