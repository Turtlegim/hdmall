package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;

// 김기범 : MainController
@WebServlet("/main.do") // servlet annotation 설정
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PBoardDAO pboardDAO;
	LikeDAO likeDAO;

	public void init() throws ServletException {
		likeDAO = LikeDAO.getInstance();
		pboardDAO = PBoardDAO.getInstance();
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
		String destPage = "/jsp/main.jsp"; // dest page 설정 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HashMap<String, Integer> l_list = likeDAO.prodLikeInfo(); // 구글 차트에 사용할 상품명과 찜 갯수를 받아옴.
		request.setAttribute("likelist", l_list); // jsp에 넘겨주기 위해 설정.
		try {
			
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage); // dispatcher로 forward.
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// end class
}// end class
