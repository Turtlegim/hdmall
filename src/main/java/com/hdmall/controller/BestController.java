package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;

@WebServlet("/best")
public class BestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PBoardDAO pboardDAO;

	public void init() throws ServletException {
		pboardDAO = pboardDAO.getInstance();
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

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String destPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cate_no = request.getParameter("cate_no");
		List<ProductVO> pvo = null;
		//request.setAttribute("cate_no", cate_no);
		try {
			if (cate_no != null) {
				pvo = pboardDAO.listTophitsPBoard(cate_no);
				
			} else {
				pvo = pboardDAO.listTophitsPBoard();
			}
			request.setAttribute("best", pvo);
			destPage =  "/jsp/productBest.jsp";
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end class
}//end class

