package com.hdmall.controller;
import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;
 
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}

	/* 경민영 : 로그아웃 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
        // 한글 처리 
 		response.setContentType("text/html;charset=UTF-8");
 		response.setContentType("application/json; charset=utf-8");
 		
 		// destPage
		// 로그아웃 성공 시 메인 화면으로 이동
        String destPage = "";
		 
 		// 세션에 존재하는 아이디 불러오기 
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        try {
        	int result = userDAO.logoutUser(userId); // 로그아웃 
            
            if (result == 1) { // 로그아웃 성공
                System.out.println("로그아웃 성공");
                
                // 세션 값 초기화
                session.setAttribute("userId", null);
                session.setAttribute("userName", null);
                session.invalidate();
                
                destPage = "/main.do";
            } else { // 로그아웃 실패
            	System.out.println("로그아웃 실패");
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		doGet(request, response);
    }

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}//end class
}//end class