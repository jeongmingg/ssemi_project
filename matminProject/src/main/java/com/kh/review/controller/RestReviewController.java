package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.vo.ImgFile;
import com.kh.review.model.Service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class RestReviewController
 */
@WebServlet("/review.rs")
public class RestReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rpage = request.getParameter("rpage");
		
		ArrayList<Review> rvList = new ReviewService().selectReviewList(rpage);
		ArrayList<ImgFile> imgList = new ReviewService().selectImgFile(rpage);
		
		System.out.println(rvList);
		System.out.println(imgList);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(rvList, response.getWriter());
		new Gson().toJson(imgList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
