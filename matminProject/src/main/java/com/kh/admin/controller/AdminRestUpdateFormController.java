package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.vo.ImgFile;
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
		
		String restNo= request.getParameter("num");
		
		RestService rService = new RestService();
		
		Rest r = rService.selectRest(restNo);
		System.out.println("여기서");
		System.out.println(r.getLocalName());
		ImgFile img= rService.selectAttachment(restNo);

		ArrayList<Category> list = rService.selectCategoryList();
		ArrayList<Location> lList = rService.selectLocationList();
		
		ArrayList<Rest> menuList = rService.selectMenuByAdmin(restNo);
		
		System.out.println(lList);
		
		request.setAttribute("list", list);
		request.setAttribute("lList", lList);
		request.setAttribute("r", r);
		request.setAttribute("img", img);
		request.setAttribute("menuList", menuList);
		request.getRequestDispatcher("views/admin/adminRestUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
