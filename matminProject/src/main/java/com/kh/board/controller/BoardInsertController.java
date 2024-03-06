package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
import com.kh.member.model.dao.MemberDao;
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
			
	
			
			String boardWriter = multiRequest.getParameter("userNo");
			String boardType = multiRequest.getParameter("type");
			String boardTitle = multiRequest.getParameter("title");
			String boardDate = multiRequest.getParameter("enrollDate");
			String restName = multiRequest.getParameter("restName");
			String restAdd = multiRequest.getParameter("restAdd");
			String boardContent = multiRequest.getParameter("content");	
			
			Board b = new Board();

			b.setRestName(restName);
			b.setRestAddress(restAdd);
			b.setBoardWriter(boardWriter);
			b.setBoardType(boardType);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardDate(boardDate);
			
			
			ImgFile img = null;
			
			if(multiRequest.getOriginalFileName("file") != null) {
				img = new ImgFile();
				img.setImgOriginName(multiRequest.getOriginalFileName("file"));
				img.setImgChangeName(multiRequest.getFilesystemName("file"));
				img.setImgFilePath("resources/board_upfiles/");
			}
			
			int result = new BoardService().insertBoard(b, img);
		
			HttpSession session = request.getSession();
			
			if(result > 0){
				session.setAttribute("alertMsg", "게시글 작성에 성공하셨습니다.");
				response.sendRedirect(request.getContextPath()+"/list.bo?cpage=1");
			
			} else {
				
				// 첨부파일이 있으면 업로드된 파일을 찾아서 삭제시킨 후 에러페이지 이동
				
				if(img != null) {
					new File(savePath + img.getImgChangeName()).delete(); 
				}
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
