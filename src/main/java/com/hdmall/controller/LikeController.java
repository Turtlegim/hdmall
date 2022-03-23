package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;

// 김기범 : LikeController
@WebServlet("/like") // servlet annotation 설정
public class LikeController extends HttpServlet {
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
		
		List<ProductVO> lvo = null; // 찜한 리스트를 담을 리스트 생성.
		HttpSession session = request.getSession(); // 세션을 받아옴.
		String userId = (String) session.getAttribute("userId"); // 유저 인증을 위해 세션으로부터 아이디를 받아옴.
		
		try {
			if (userId == null) { // 아이디가 없으면
				destPage = "/hdmall/login"; // 로그인 페이지로 이동
				System.out.println("찜하기는 로그인 후 이용 가능합니다.");
				response.sendRedirect(destPage);
			} else { // 아이디를 가져오면
				lvo = likeDAO.listisLiked(userId); // 유저가 찜한 목록을 받아
				request.setAttribute("likeboard", lvo); // jsp로 넘겨주기 위해 request 에 set 함.
				destPage = "/jsp/like.jsp";
				RequestDispatcher dispatch = request.getRequestDispatcher(destPage); // dispatch로 forward
				dispatch.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// end class
}// end class
