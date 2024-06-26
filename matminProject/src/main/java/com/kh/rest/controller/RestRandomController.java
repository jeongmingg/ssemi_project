package com.kh.rest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.rest.model.service.RestService;
import com.kh.rest.model.vo.Rest;

/**
 * Servlet implementation class RestRandomController
 */
@WebServlet("/random.rs")
public class RestRandomController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestRandomController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String ctgName = request.getParameter("ctgName");
		
		ArrayList<Rest> list = new RestService().rsRecommend(ctgName);
		
		request.setAttribute("ctgName", ctgName);
		request.setAttribute("list", list);
		
		response.setContentType("applicaion/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
