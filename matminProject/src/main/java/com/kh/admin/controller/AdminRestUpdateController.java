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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/rest/");
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
			String comAnimal = multiRequest.getParameter("conAnimal");
			String prvRoom = multiRequest.getParameter("prvRoom");
			String bigRoom = multiRequest.getParameter("bigRoom");
			
			System.out.println("updateController : " + drivethrou);
			
			String[] menuArr = multiRequest.getParameterValues("menu");
			String[] priceArr = multiRequest.getParameterValues("price");
			
			ArrayList <HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
			
			for(int i=0; i<menuArr.length; i++) {
				HashMap<String, String> map = new HashMap<String, String>();
				
				if(!menuArr[i].equals("")) {
					map.put("menu", menuArr[i]);
					map.put("price", priceArr[i]);
					
					list.add(map);
				}
			}
			
			int menuCnt = new RestService().selectMenuCount(restNo);
			
			if (!list.isEmpty() && menuCnt == 0) {
				int result = new RestService().insertAddMenu(restNo, list);
			}
			System.out.println("updateController : " + list);
			
			Rest r = new Rest(restNo, restLocation, restName, ctgId, restAddress, restTel, parking, restTime, drivethrou,comAnimal, prvRoom, bigRoom);
			
			ImgFile img  = null;
			 
			if(multiRequest.getOriginalFileName("upfile") != null) { // 넘어온 첨부파일 있을 경우
			
				img = new ImgFile();
				img.setImgOriginName(multiRequest.getOriginalFileName("upfile"));
				img.setImgChangeName(multiRequest.getFilesystemName("upfile"));
				img.setImgFilePath("resources/rest/");
				img.setRefNo(restNo);
				
				if(multiRequest.getParameter("originFileNo") != null) {
				
					img.setImgFileNo(multiRequest.getParameter("originFileNo"));
					
				} else {
					// insert
					img.setRefNo(restNo);
				}
			
			}
			
			int result = new RestService().updateRest(r, img, list,restNo);
			//System.out.println("updateControllerRest"+r);
			//System.out.println("updateControllerMenu"+list);
			
			if(result > 0) {
				request.setAttribute("img", img);
			 
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "수정에 성공하셨습니다.");
				response.sendRedirect(request.getContextPath() + "/rest.ad?num=" + restNo);
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
