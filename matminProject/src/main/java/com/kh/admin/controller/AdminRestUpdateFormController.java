package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.Category;
import com.kh.common.model.vo.Location;
import com.kh.rest.model.service.RestService;
import com.kh.rest.model.vo.Rest;

/**
 * Servlet implementation class AdminRestUpdateFormController
 */
@WebServlet("/updateForm.rs")
public class AdminRestUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRestUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String restNo= request.getParameter("rno");
		
		RestService rService = new RestService();
		
		ArrayList<Category> list = rService.selectCategoryList();
		ArrayList<Location> lList = rService.selectLocationList();
		
		Rest r = rService.selectRest(restNo);
		
		Attachment at = rService.selectAttachment(restNo);
		
		request.setAttribute("list", list);
		request.setAttribute("lList", restNo);
		request.setAttribute("r", r);
		request.setAttribute("at", at);
		request.getRequestDispatcher("views/admin/adminRestUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
