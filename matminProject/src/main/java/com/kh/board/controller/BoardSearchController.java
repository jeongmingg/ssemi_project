package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class BoardSearchController
 */
@WebServlet("/search.bo")
public class BoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; // 총 게시글 수
		int currentPage; // 현재페이지
		int pageLimit; // 하단 페이징바 개수
		int boardLimit; // 한페이지에 보여지는 게시글 수
		
		int maxPage; // 총 마지막 페이지수
		int startPage; // 페이징바 시작 수
		int endPage; // 페이징 바 끝 수
		
		String keyWord = request.getParameter("keyWord");
		
		listCount = new BoardService().searchListCount(keyWord);

		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		System.out.println(currentPage);

		pageLimit = 5;
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		int checkNum = 2;
		
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> sList = new BoardService().boardSearchList(keyWord, pi);
		
		 //ajax로 두개를 한번에 넘겨주기위해 HashMap 사용	
		 HashMap<String, Object> list = new HashMap<String, Object>();
		
		 // list안에 값 담아주기
		 list.put("pi", pi);
		 list.put("sList", sList);
		 list.put("checkNum", checkNum);
		 
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
