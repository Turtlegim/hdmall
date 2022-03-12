package com.hdmall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.hdmall.dao.*;

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
		String title = request.getParameter("title"); // 문의사항 제목 get
        String context = request.getParameter("context"); // 문의사항 제목 get  
        
		request.setCharacterEncoding("utf-8");
		response.setContentType("\"text/html;charset=utf-8\"");

		int result = qnaDAO.insertQna(loginUser,context, title);
		String destpage ="/jsp/qna_insert.jsp";
		
		if(result == 0) {
			 request.setAttribute("message", "문의 등록을 실패 했습니다.");
		} else {
			 request.setAttribute("message", "문의 등록을 성공 하였습니다.");
		}
		
        RequestDispatcher dispatcher = request.getRequestDispatcher(destpage);
		dispatcher.forward(request, response);
	}
}