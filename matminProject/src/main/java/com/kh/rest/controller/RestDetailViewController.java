package com.kh.rest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.ImgFile;
import com.kh.rest.model.service.RestService;
import com.kh.rest.model.vo.Rest;
import com.kh.review.model.Service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class RestDetailViewController
 */
@WebServlet("/detail.rs")
public class RestDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rpage = request.getParameter("rpage");
		
		Rest r = new RestService().selectRestDetail(rpage); 
		ArrayList<Review> rvList = new ReviewService().selectReviewList(rpage);
		ArrayList<ImgFile> imgList = new ReviewService().selectImgFile(rpage);
		
		System.out.println(rvList);
		System.out.println(imgList);
		
		request.setAttribute("rpage", rpage);
		request.setAttribute("r", r);
		request.getRequestDispatcher("views/rest/restDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
