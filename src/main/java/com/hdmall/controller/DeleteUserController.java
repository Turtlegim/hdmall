package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;

@WebServlet("/deleteUser")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}

	/* 경민영 : 회원 탈퇴 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 한글 처리 
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json; charset=utf-8");
	
		// destPage
		// 1. 회원 탈퇴 성공 시 메인 화면으로 이동
		// 2. 회원 탈퇴 실패 시 회원정보관리 초기 화면으로 이동 
		String destPage = "/main.do";
		
		HttpSession session = request.getSession();
	    
	    String userId = (String) session.getAttribute("userId");
	    System.out.println("전달된 userId : " + userId);
	    
	    try {
	    	int result = userDAO.deleteUser(userId); // 회원 탈퇴 
	    	
	        if (result == 1) { // 회원 탈퇴 성공
	        	System.out.println("회원 탈퇴 성공"); 

	        	// 세션에 저장한 로그인 회원 정보 초기화
	            session.setAttribute("userId", null);
	            session.setAttribute("userName", null);
	            session.invalidate();
	            
	        	destPage = "/main.do";
	        } else { // 회원 탈퇴 실패 
	        	System.out.println("회원 탈퇴 실패");
	        	
	        	destPage = "/userManage";
	        }
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
	    } catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		doGet(request, response);
    }

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}//end class
}//end class