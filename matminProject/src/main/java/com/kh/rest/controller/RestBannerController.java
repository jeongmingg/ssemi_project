package com.kh.rest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.rest.model.service.RestService;
import com.kh.rest.model.vo.Rest;

/**
 * Servlet implementation class RestBannerController
 */
@WebServlet("/banner.rs")
public class RestBannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestBannerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selectedGrade = request.getParameter("selectedGrade");
				
		ArrayList<Rest> list = new RestService().selectRestList(selectedGrade);
		System.out.println("컨트롤러의 " + selectedGrade);
		request.setAttribute("selectedGrade", selectedGrade);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/rest/restBannerSearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
