package com.kh.admin.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.vo.ImgFile;
import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Menu;
import com.kh.rest.model.service.RestService;
import com.kh.rest.model.vo.Rest;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminRestInsertController
 */
@WebServlet("/insert.rs")
public class AdminRestInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRestInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			
		String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
		
		MultipartRequest multiRequst = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		String restLocation = multiRequst.getParameter("location");
		String restName = multiRequst.getParameter("restName");
		String ctgId = multiRequst.getParameter("category");
		String restAddress = multiRequst.getParameter("address");
		String restTel = multiRequst.getParameter("phone");
		String parking = multiRequst.getParameter("parking");
		String restTime = multiRequst.getParameter("bizHour");
		String drivethrou = multiRequst.getParameter("drivethrou");
		String comAnimal = multiRequst.getParameter("comAnimal");
		String prvRoom = multiRequst.getParameter("prvRoom");
		String bigRoom = multiRequst.getParameter("bigRoom");

		
		Rest r = new Rest(restLocation,restName, ctgId,restAddress,restTel, parking, restTime,drivethrou,comAnimal,prvRoom,bigRoom);
		
		String menuName = multiRequst.getParameter("menu1");
		String menuPrice = multiRequst.getParameter("price1");
		String repMenu = multiRequst.getParameter("extra");
		
		Menu menu = new Menu(menuName, menuPrice,repMenu);
	
		ImgFile img = null;
		
		if(multiRequst.getOriginalFileName("upfile") != null) {
			img = new ImgFile();
			img.setImgOriginName(multiRequst.getOriginalFileName("upfile"));
			img.setImgChangeName(multiRequst.getFilesystemName("upfile"));
			img.setImgFilePath("resources/rest_upfiles/");
		}
		
		int result = new RestService().insertRest(r,img,menu);
		
		HttpSession session = request.getSession();
		
		if(result>0) {
			session.setAttribute("alertMsg", "식당이 성공적으로 등록됐습니다");
			response.sendRedirect(request.getContextPath() + "/rest.list?cpage=1");
			//response.sendRedirect(request.getContextPath() + "/rest.list?cpage=1");
		}else {
			if(img != null) {
				new File(savePath + img.getImgChangeName()).delete();
			}
			session.setAttribute("alertMsg","식당등록에 실패했습니다");
			response.sendRedirect(request.getContextPath() + "/restEnroll.ad");
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
