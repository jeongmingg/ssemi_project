package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
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
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10* 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String boardNo = (multiRequest.getParameter("bno"));
			
			String boardWriter = multiRequest.getParameter("userNo");
			String restName = multiRequest.getParameter("restName");
			String restAdd = multiRequest.getParameter("restAdd");
			String boardContent = multiRequest.getParameter("content");	
			
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setRestName(restName);
			b.setRestAddress(restAdd);
			b.setBoardWriter(boardWriter);
			b.setBoardContent(boardContent);

		
			ImgFile img = null;
			
			String bno = boardNo.replaceAll("\\D", "");
			

			if(multiRequest.getOriginalFileName("file") != null) { // 넘어온 첨부파일 있을 경우
				System.out.println("!@#$#%^^");
				System.out.println(multiRequest.getOriginalFileName("file"));
				
				img = new ImgFile();
				img.setImgOriginName(multiRequest.getOriginalFileName("file"));
				img.setImgChangeName(multiRequest.getFilesystemName("file"));
				img.setImgFilePath("resources/board_upfiles/");
				img.setRefNo(bno);
				
				if(multiRequest.getParameter("originFileNo") != null) {
					// update
					img.setImgFileNo(multiRequest.getParameter("originFileNo"));
					//img.setRefNo(bno);
				} else {
					// insert
					img.setRefNo(bno);
				}
			
			}
			
			int result = new BoardService().updateBoard(b, img);
			
			if(result > 0) {
				System.out.println("here");
				request.setAttribute("img", img);
				System.out.println(request.getAttribute("img"));
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "수정에 성공하셨습니다 😀");
				response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + bno);
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "🚨 수정에 실패하셨습니다");
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
