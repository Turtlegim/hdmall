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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}
	
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/* 배지현 : 한글화 처리 */
		request.setCharacterEncoding("utf-8");
		response.setContentType("\"text/html;charset=utf-8\"");

		/* 배지현 : session 값에서 login한 user_id 받아옴 */
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("userId");
		
		/* 배지현 : 등록할 내용과 제목 받아옴 */
		String context = request.getParameter("context");
		String title = request.getParameter("title");

		/* 배지현 : 문의 등록 */
		int result = qnaDAO.insertQna(loginUser, context, title);
		String destpage = "/jsp/qna_insert.jsp";

		if (result > 1) {
			request.setAttribute("message", "문의등록을 성공하였습니다.");
		} else {
			request.setAttribute("message", "문의등록을 실패하였습니다.");
		}
		
		/* 경민영 : 로그인 유효성 체크함수 */
		if (loginUser == null) {
			destpage = "/login";
			System.out.println("문의 등록은 로그인 후 이용 가능합니다.");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(destpage);
		dispatcher.forward(request, response);

	}
}