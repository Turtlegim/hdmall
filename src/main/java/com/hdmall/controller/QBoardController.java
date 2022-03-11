package com.hdmall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import com.hdmall.dao.*;
import com.hdmall.vo.*;


@WebServlet("/QBoardIns")
public class QBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QnaDAO qnaDAO;

	public void init() throws ServletException {
		qnaDAO = QnaDAO.getInstance();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.setCharacterEncoding("utf-8");
		response.setContentType("\"text/html;charset=utf-8\"");
		
		HttpSession session = request.getSession();

		String loginUser = (String) session.getAttribute("userId");
		String title = request.getParameter("title"); // 문의 제목 get 
        String context = request.getParameter("context"); //문의 내용 get  
        

        
        
		request.setCharacterEncoding("utf-8");
		response.setContentType("\"text/html;charset=utf-8\"");

		int result = qnaDAO.insertQna(loginUser,context, title); //,loginUser.getId()
		String destpage ="/jsp/qna_insert.jsp";
		
		if(result == 0) {
			 request.setAttribute("message", "문의등록에 실패했습니다.");
		} else {
			 request.setAttribute("message", "문의를 등록하였습니다.");
		}
		
        RequestDispatcher dispatcher = request.getRequestDispatcher(destpage);
		dispatcher.forward(request, response);
	
}
}


