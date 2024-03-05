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
		String email = "";
		String address = "";
		String kakaoUser = request.getParameter("kakaoUser");

		if(kakaoUser == null) {
			email = request.getParameter("email") + "@" + request.getParameter("domain");
			address = request.getParameter("address");
			
		} else {
			email = request.getParameter("email");
		}
		
		if("".equals(address)) {
			address = null;
		} else {
			address = "서울특별시 " + address;
		}
		
		Member m = new Member(memId, memPwd, memName, nickname, email, address);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			System.out.println("============= DB INSERT 완료 =============");
			
//			request.setAttribute("memId", memId);	session으로 쏘던지, url에 키-밸류로 쏘던지 해야 될 듯
//			System.out.println("============= memId: " + memId + "=============");
			response.sendRedirect(request.getContextPath() + "/gmailSendAction?email=" + email);
			
//			request.setAttribute("email", email);
//			request.getRequestDispatcher("views/gmail/gmailSendAction.jsp").forward(request, response);
			
		} else {
			request.getSession().setAttribute("alertMsg", "회원가입을 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/chooseForm.me");
		}
		
//		if(result > 0) {
//			request.getSession().setAttribute("alertMsg", "성공적으로 회원가입되었습니다.");
//			request.getRequestDispatcher("views/member/memberCommonLogin.jsp").forward(request, response);
//			
//		} else {
//			request.getSession().setAttribute("alertMsg", "회원가입을 실패했습니다.");
//			response.sendRedirect(request.getContextPath() + "/chooseForm.me");
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
