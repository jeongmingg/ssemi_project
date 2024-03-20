package com.kh.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.review.model.Service.ReviewService;

/**
 * Servlet implementation class InsertReviewLikeController
 */
@WebServlet("/inLike.rv")
public class InsertReviewLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvNo = request.getParameter("rvNo");
		String rvName = request.getParameter("rvName");
		String logName = request.getParameter("logName");
		
		boolean liked = new ReviewService().checkLiked(rvNo, logName);
		
		JSONObject responseJson = new JSONObject();
		
		if(!liked) {
			int result = new ReviewService().insertLike(rvNo, logName);	
			System.out.println("result1 : "  + result);
			responseJson.put("result1", result);
		}else {
			int result2 = new ReviewService().deleteLike(rvNo, logName);
			responseJson.put("result2", result2);
			System.out.println(result2);
		}
		
		response.getWriter().write(responseJson.toString());
		
	
	
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
