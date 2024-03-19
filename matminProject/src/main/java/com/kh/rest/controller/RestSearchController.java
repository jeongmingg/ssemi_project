package com.kh.rest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.rest.model.service.RestService;
import com.kh.rest.model.vo.Rest;
import com.kh.search.model.vo.Search;

/**
 * Servlet implementation class RestSearchController
 */
@WebServlet("/search.rs")
public class RestSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String keyword = request.getParameter("keyword");
		
		ArrayList<Search> list = new RestService().searchKeywordList(keyword);
		
		//ArrayList<Rest> rlist = new RestService().searchByKeyword(keyword); 
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("list", list);
		//request.setAttribute("rlist", rlist);
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		if (loginUser.getMemNo().equals("M1")) {
			request.getRequestDispatcher("views/admin/adminRestMainPage.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("views/rest/restSearchPage.jsp").forward(request, response);
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
