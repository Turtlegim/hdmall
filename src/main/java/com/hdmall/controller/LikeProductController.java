package com.hdmall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hdmall.dao.LikeDAO;

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
		// 한글화 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 서블릿에서 클라이언트에 데아토를 보내기위해 사용하는 변수
		PrintWriter out = response.getWriter();
		
		String userId = request.getParameter("userId");
		String prodId = request.getParameter("prodId");
		String isLike = request.getParameter("isLike");
	    System.out.println("전달된 userId : " + userId);
	    System.out.println("전달된 prodId : " + prodId);
	    System.out.println("전달된 isLike : " + isLike);
		
	    int result = 0;
	    
		try {
			// checkLikeInfo 함수에서 이미 유저한 찜한 기록이 있는지를 1 또는 0으로 받아와 check 변수에 저장
			int check = likeDAO.checkLikeInfo(userId, prodId);
			System.out.println("테이블 정보 존재하면 1 아니면 0 : " + check);
			
			// 1이면 like_t 테이블에 이미 user 정보가 존재 
			if (check == 1) {
				String like;
				
				// if else 문으로 찜하기가 되어있을 때 0으로 안되있을 때 1로 반대로 바꿈
				if (isLike.equals("true")) {
					like = "0";
				}
				else {
					like = "1";
				}
						
				// updateLike 함수에서 찜하기 수정 성공여부 1또는 0을 result에 저장
				result = likeDAO.updateLike(like, userId, prodId);
				System.out.println("update 실행");
				
				if (result == 1) {
		        	out.print("1"); // ajax 가 sussses 이면 1을 보내줌 
		        } 
			
			// 0이면 like_t 테이블에 user 정보가 존재하지 않으므로 insert
			} else {
				String like = "1";
				
				// insertLike 함수에서 찜하기 수정 성공여부 1또는 0을 result에 저장
				result = likeDAO.insertLike(userId, prodId, like);	
				System.out.println("insert 실행");
				
				if (result == 1) {				
		        	out.print("2"); // ajax 가 sussses 이면 2을 보내줌
		        } 
			}
		
		}	
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}