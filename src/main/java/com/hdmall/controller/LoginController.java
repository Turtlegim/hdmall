package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;
 
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String id_rem = request.getParameter("id_rem"); // 아이디 저장 체크 박스의 체크 여부 
        System.out.println("전달된 아이디 체크 여부 : " + id_rem);
        
        HttpSession session = request.getSession();
        
        String destPage = "";
        String result = "0"; // 로그인 실패하면 0 
        
        try {
        	UserVO user = userDAO.loginUser(userId, userPwd);
            
            response.setCharacterEncoding("UTF-8"); // 한글도 입력 가능하게 하기
    		
    		Cookie cookie = new Cookie("userId", userId); // 쿠키 생성 
    		
            if (user != null) {
                System.out.println("로그인 성공");
                
                String userName = user.getName(); // 이름 저장 후 보여주기 
                if(id_rem != null) { // 아이디 저장 여부를 보고 쿠키로 아이디값 저장 
                    cookie = new Cookie("userId", userId);
                   
                	// 쿠키값 저장 시간을 지정, 숫자당 1초로 계산
                	cookie.setMaxAge(60*60*24*1); // 1일간 저장
                    response.addCookie(cookie);
                } else {
                	cookie = new Cookie("userId", null);
                	
                	// 쿠키 초기화 
                	cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
                
                result = "1";
                session.setAttribute("result", result);
                System.out.println("로그인 성공 session : "+session.getAttribute("result"));
                
                session.setAttribute("userId", userId);
                session.setAttribute("userName", userName);
                session.setAttribute("remember", id_rem);

                destPage = "/jsp/main.jsp";
            } else {
            	System.out.println("로그인 실패");
            	result = "0";
            	session.setAttribute("result", null);
            	System.out.println("로그인 실패 session : "+session.getAttribute("result"));
            	
            	destPage = "/jsp/login.jsp";
            }
        } catch (SQLException e) {
        	e.printStackTrace();
        } 
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		doGet(request, response);
    }

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}//end class
}//end class