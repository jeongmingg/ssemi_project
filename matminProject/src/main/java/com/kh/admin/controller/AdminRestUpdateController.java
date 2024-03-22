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
import com.kh.common.model.vo.Menu;
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
			
			String menuName1 = multiRequest.getParameter("menuName1");
			String menuName2 = multiRequest.getParameter("menuName2");
			String menuName3 = multiRequest.getParameter("menuName3");
			String menuPrice1 = multiRequest.getParameter("menuPrice1");
			String menuPrice2 = multiRequest.getParameter("menuPrice2");
			String menuPrice3 = multiRequest.getParameter("menuPrice3");
			
			ArrayList<Menu> menuList = new ArrayList<Menu>();// 앞에서 받아온 대표 + 서브 메뉴 리스트
			
			if(!menuName1.equals("") && !menuPrice1.equals("")) {
				menuList.add(new Menu(menuName1, menuPrice1));
			}
			
			if(!menuName2.equals("") && !menuPrice2.equals("")) {				
				menuList.add(new Menu(menuName2, menuPrice2));
			}
			
			if(!menuName3.equals("") && !menuPrice3.equals("")) {		
				menuList.add(new Menu(menuName3, menuPrice3));
			}
		
			Rest r = new Rest(restNo, restLocation, restName, ctgId, restAddress, restTel, parking, restTime, drivethrou,comAnimal, prvRoom, bigRoom);	
		
			if(multiRequest.getOriginalFileName("upfile") != null) { // 넘어온 첨부파일 있을 경우
				r.setRestImgUrl("resources/rest/" + multiRequest.getFilesystemName("upfile") );			
			}else { // 넘어온 첨부파일 없을 경우 (즉, 사진 수정 안했을 경우)
				
				// 원래있던 사진이름을 가져와서 세팅해줌.
				String imgUrl = new RestService().selectRestImg(restNo);
				r.setRestImgUrl(imgUrl);
			}
			
			// r: rest관련, menuList: 메뉴정보(메뉴이름 + 가격)
			int result = new RestService().updateRest(r, menuList);
			
			if(result > 0) {
			
			 
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "수정에 성공하셨습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.rs?rpage=" + restNo);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "수정에 실패하셨습니다.");	
				response.sendRedirect(request.getContextPath() + "/detail.rs?rpage=" + restNo);
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
