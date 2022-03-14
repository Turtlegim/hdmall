package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;

@WebServlet("/likeCancel")
public class LikeCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LikeDAO likeDAO;

	public void init() throws ServletException {
		likeDAO = likeDAO.getInstance();
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

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String prod_id = request.getParameter("prod_id");
		// request.setAttribute("cate_no", cate_no);
		try {
			if (userId == null) {
//				PrintWriter out = response.getWriter();
//				out.println("<script>alert('로그인하십시오.'); </script>");
//				out.flush();
				destPage = "${contextPath}/jsp/main.jsp";
			} else {
				likeDAO.cancelLike(userId, prod_id);
				System.out.println(prod_id + " 상품 좋아요 취소됨.");
				destPage = "/like";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// end class
}// end class
