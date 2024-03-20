package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.ImgFile;
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
			
			String restNo = (multiRequest.getParameter("num"));
			
			String restName = multiRequest.getParameter("restName");
			String restTime = multiRequest.getParameter("bizHour");
			String restAddress = multiRequest.getParameter("address");
			String restLocation = multiRequest.getParameter("location");
			String restTel = multiRequest.getParameter("phone");
			String ctgId = multiRequest.getParameter("category");
			String parking = multiRequest.getParameter("parking");
			String drivethrou = multiRequest.getParameter("dt");
			String comAnimal = multiRequest.getParameter("comAnimal");
			String prvRoom = multiRequest.getParameter("prvRoom");
			String bigRoom = multiRequest.getParameter("bigRoom");
			
			String[] menuArr = multiRequest.getParameterValues("menu");
			String[] priceArr = multiRequest.getParameterValues("price");
			
			ArrayList <HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
			
			for(int i=0; i<menuArr.length; i++) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("menu", menuArr[i]);
				map.put("price", priceArr[i]);
				
				list.add(map);
			}
			
			Rest r = new Rest(restNo, restLocation, restName, ctgId, restAddress, restTel, parking, restTime, drivethrou,comAnimal, prvRoom, bigRoom);
			
			System.out.println(r);
			ImgFile img  = null;
			 
			if(multiRequest.getOriginalFileName("upfile") != null) { // 넘어온 첨부파일 있을 경우
			
				System.out.println(multiRequest.getOriginalFileName("upfile"));
				
				img = new ImgFile();
				img.setImgOriginName(multiRequest.getOriginalFileName("upfile"));
				img.setImgChangeName(multiRequest.getFilesystemName("upfile"));
				img.setImgFilePath("resources/board_upfiles/");
				img.setRefNo(restNo);
				
				if(multiRequest.getParameter("originFileNo") != null) {
				
					img.setImgFileNo(multiRequest.getParameter("originFileNo"));
					
				} else {
					// insert
					img.setRefNo(restNo);
				}
			
			}
			
			int result = new RestService().updateRest(r, img, list,restNo);
			
			if(result > 0) {
				System.out.println("here");
				request.setAttribute("img", img);
				System.out.println(request.getAttribute("img"));
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "수정에 성공하셨습니다.");
				response.sendRedirect(request.getContextPath() + "/rest.ad?num=" + r.getRestNo());
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "수정에 실패하셨습니다.");
				response.sendRedirect(request.getContextPath() + "/rest.list?cpage=1");
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
