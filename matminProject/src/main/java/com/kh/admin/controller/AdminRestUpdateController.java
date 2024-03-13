package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.rest.model.service.RestService;
import com.kh.rest.model.vo.Rest;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminRestUpdateController
 */
@WebServlet("/updateRest.ad")
public class AdminRestUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRestUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10* 1024* 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,maxSize,"UTF-8", new MyFileRenamePolicy());
			
			String restNo = (multiRequest.getParameter("rno"));
			
			String restName = multiRequest.getParameter("restName");
			String restAddress = multiRequest.getParameter("address");
			String restTel = multiRequest.getParameter("phone");
			String restTime = multiRequest.getParameter("busHour");
			
			Rest r = new Rest();
			r.setRestName(restName);
			r.setRestAddress(restAddress);
			r.setRestTel(restTel);
			r.setRestTime(restTime);
			
			Attachment at = null;
			
//			if(multiRequest.getOriginalFileName("upfile") != null) {
//				// update
//				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
//				
//				at = new Attachment();
//				at.setOriginName(multiRequest.getOriginalFileName("file"));
//				at.setChangeName("upfile");
//				at.setFilePath("resources/board_upfiles/");
//				at.setFileNo(restNo);
//				
//				if(multiRequest.getParameter("originFileNo") != null) {
//					at.setFileNo(restNo);
//			} else {
//				// insert
//				at.setRefNo(restNo);
//			}
//		
//		}
		
		int result = new RestService().updateRest(r, at);
		
		if(result > 0) {
			System.out.println("here");
			request.setAttribute("at", at);
			System.out.println(request.getAttribute("at"));
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "수정에 성공하셨습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + restNo);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "수정에 실패하셨습니다.");
			response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
		}
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
