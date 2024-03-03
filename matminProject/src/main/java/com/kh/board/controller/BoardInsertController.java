package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.ImgFile;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String boardType = request.getParameter("type");
			String boardTitle = request.getParameter("title");
			String nickname = request.getParameter("name");
			String boardDate = request.getParameter("enrollDate");
			String restName = request.getParameter("restName");
			String restAdd = request.getParameter("restAdd");
			String boardContent = request.getParameter("content");
			
			Board b = new Board();
			b.setBoardType(boardType);
			b.setBoardTitle(boardTitle);
			b.setBoardWriter(nickname);
			b.setBoardDate(boardDate);
			b.setRestId(restName);
			b.setRestId(restAdd);
			b.setBoardContent(boardContent);
			
			ImgFile img = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				img = new ImgFile();
				img.setImgOriginName(multiRequest.getOriginalFileName("upfile"));
				img.setImgChangeName(multiRequest.getFilesystemName("upfile"));
				img.setImgFilePath("resources/board_upfiles/");
			}
			
			int result = new BoardService().insertBoard(b, img);
		
			
			if(result > 0){
				
				LocalDate currentDate = LocalDate.now();
				request.setAttribute("currentDate", currentDate);
				
				request.getRequestDispatcher(request.getContextPath()+"/list.bo?cpage=1").forward(request, response);
			
			} else {
				
				// 첨부파일이 있으면 업로드된 파일을 찾아서 삭제시킨 후 에러페이지 이동
				
				if(img != null) {
					new File(savePath + img.getImgOriginName()).delete(); 
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "게시글 작성에 실패하셨습니다.");
				response.sendRedirect(request.getContextPath()+"list.bo?cpage=1");
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
