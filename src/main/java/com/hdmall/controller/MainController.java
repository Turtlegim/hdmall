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

@WebServlet("/main.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PBoardDAO pboardDAO;
	LikeDAO likeDAO;

	public void init() throws ServletException {
		likeDAO = LikeDAO.getInstance();
		pboardDAO = PBoardDAO.getInstance();
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
		String destPage = "/jsp/main.jsp";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HashMap<String, Integer> l_list = likeDAO.prodLikeInfo();
		request.setAttribute("likelist", l_list);
		try {
			
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// end class
}// end class
