package com.hdmall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hdmall.dao.LikeDAO;
import com.hdmall.vo.LikeVO;

/**
 * Servlet implementation class LikeController
 */
@WebServlet("/LikeProduct")
public class LikeProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	LikeDAO likeDAO;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		likeDAO = LikeDAO.getInstance(); // 싱글톤 패턴
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		String destPage = "";
		// 한글화 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String userId = request.getParameter("userId");
		String prodId = request.getParameter("prodId");
		String isLike = request.getParameter("isLike");
	    System.out.println("전달된 userId : " + userId);
	    System.out.println("전달된 prodId : " + prodId);
	    System.out.println("전달된 isLike : " + isLike);
		
	    int result = 0;
	    
	    PrintWriter out = response.getWriter();
	    
		try {
			int check = likeDAO.checkLikeInfo(userId, prodId);
			System.out.println(check);
			
			// 1이면 like_t 테이블에 이미 user 정보가 존재 
			if (check == 1) {

				if (isLike.equals("1")) {
					isLike = "0";
				}
				else {
					isLike = "1";
				}
				System.out.println(userId + " " + prodId + " " +isLike);
				
				result = likeDAO.updateLike(isLike, userId, prodId);
			} else {
				isLike = "1";
				result = likeDAO.insertLike(userId, prodId, isLike);		     						
			}
		
		}	
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}