package com.kh.admin.controller;

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
 * Servlet implementation class AdminRestListController
 */
@WebServlet("/rest.list")
public class AdminRestListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRestListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//용청시 전달 값 뽑기
		//요청처리 응답페이지에 필요한 데이터를 조회
    	ArrayList <Rest> list = new RestService().selectRestList(); // 이 list에다가 필요한 데이터 담기
		
		
    	request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/adminRestList.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
