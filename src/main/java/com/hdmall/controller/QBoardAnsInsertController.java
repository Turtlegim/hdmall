package com.hdmall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hdmall.dao.QnaDAO;
import com.hdmall.dao.UserDAO;

@WebServlet("/QBoardAnsInsert")
public class QBoardAnsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QnaDAO qnaDAO;
	UserDAO userDAO;

	public void init() throws ServletException {
		qnaDAO = QnaDAO.getInstance();
		userDAO = UserDAO.getInstance();
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
		String destPage = "";

		/* 한글 처리 */
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		/* 현 게시물의 qboard_id 받아옴 */
		String qboard_id = request.getParameter("qboard_id");
		System.out.println(qboard_id);

		/* 관리자가 입력한 값 받아옴 */
		String ansContext = request.getParameter("context");
		String ansTitle = request.getParameter("title");

		/* ans_yn 업데이트 */
		try {
			int result = qnaDAO.UpdateAns(qboard_id, ansContext, ansTitle);

			if (result > 0) {
				System.out.println("답변 등록이 완료되었습니다.");
			} else {
				System.out.println("답변 등록이 실패하였습니다.");
			}

			destPage = "/jsp/mypage.jsp";

			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
