package com.kh.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.review.model.Service.ReviewService;

/**
 * Servlet implementation class InsertReviewController
 */
@WebServlet("/insert.rv")
public class InsertReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String rno = request.getParameter("restNo");
		String memNo = request.getParameter("userNo");
		int rvwStar = Integer.parseInt(request.getParameter("rvwstar"));
		
		System.out.println(rvwStar);
		String rvwCont = request.getParameter("reviewWrite");
		
		int result = new ReviewService().insertReview(rno, memNo, rvwStar, rvwCont);
		
		HttpSession session = request.getSession();
		
		if(result>0) {
			session.setAttribute("alertMsg", "리뷰남겨주셔서 감사합니다!");
			request.getRequestDispatcher("views/restDetailView.jsp").forward(request, response);
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
