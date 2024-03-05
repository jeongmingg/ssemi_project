package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.ImgFile;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo =  Integer.parseInt(request.getParameter("bno"));
		
		System.out.println(boardNo);
		
		BoardService bService = new BoardService();
		
		int result = bService.increaseCount(boardNo);
		
		if(result > 0) {
			
			Board b = bService.selectBoard(boardNo);
			ImgFile img = bService.selectImgFile(boardNo);
			
			request.setAttribute("b", b);
			request.setAttribute("img", img);
			
			System.out.println(b);
			request.getRequestDispatcher("views/board/boardListDetailView.jsp").forward(request, response);
			
		} else {
			request.setAttribute("alertMsg", "조회를 실패하였습니다.");
			request.getRequestDispatcher("views/board/boardListDetailView.jsp").forward(request, response);
			
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
