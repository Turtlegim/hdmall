package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;

// 김기범 : LikeCancelController
@WebServlet("/likeCancel") // servlet annotation 설정
public class LikeCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LikeDAO likeDAO;

	public void init() throws ServletException {
		likeDAO = LikeDAO.getInstance(); // 싱글톤 패턴.
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doHandle(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doHandle(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String destPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpSession session = request.getSession(); // 세션을 받아옴.
		String userId = (String) session.getAttribute("userId"); // 유저 아이디를 세션에서 받아옴.
		String prod_id = request.getParameter("prod_id"); // 상품 아이디를 세션에서 받아옴.
		try {
			if (userId == null) { // 로그인 되어있지 않을 경우 
				destPage = "/main.do"; // 메인으로 forward
			} else { // 로그인 되어 있을 경우 
				likeDAO.cancelLike(userId, prod_id); // cancleLike 함수 실행.
				System.out.println(prod_id + " 상품 좋아요 취소됨."); // 취소된 상품 로그 출력.
				destPage = "/like";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage); // 디스패처로 jsp로 요청을 넘김.
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// end class
}// end class
