package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;

@WebServlet("/like")
public class LikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LikeDAO likeDAO;

	public void init() throws ServletException {
		likeDAO = LikeDAO.getInstance();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doHandle(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doHandle(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String destPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		List<ProductVO> lvo = null;
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		try {
			if (userId == null) {
				destPage = "/jsp/login.jsp";
				System.out.println("찜하기는 로그인 후 이용 가능합니다.");
			} else {
				lvo = likeDAO.listisLiked(userId);
				request.setAttribute("likeboard", lvo);
				destPage = "/jsp/like.jsp";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// end class
}// end class
