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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("userId");
		String memPwd = request.getParameter("userPwd");
		String memName = request.getParameter("userName");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email") + "@" + request.getParameter("domain");
		int emailAuth = 0;
		String address = request.getParameter("address");
		
		if("".equals(address)) {
			address = null;
		} else {
			address = "서울특별시 " + address;
		}
		
		Member m = new Member(memId, memPwd, memName, nickname, email, emailAuth, address);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/gmailSendAction?email=" + email);
			
		} else {
			request.getSession().setAttribute("alertMsg", "회원가입을 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/chooseForm.me");
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
