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

	/* 경민영 : 로그인 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//  한글화 처리
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		// login.jsp 에서 입력한 내용 요충 후 저장 
        String userId = request.getParameter("userId");
        String userPwd = request.getParameter("userPwd");
        String id_rem = request.getParameter("id_rem"); // 아이디 저장 체크 박스의 체크 여부  
        System.out.println("전달된 아이디 체크 여부 : " + id_rem);
        
        HttpSession session = request.getSession();
        
        // destPage
     	// 1. 로그인 성공 시 메인 화면으로 이동
     	// 2. 로그인 실패 시 로그인 화면으로 이동
        String destPage = "/login";
        
        try {
        	// 쿠키 생성
    		Cookie cookie = new Cookie("userId", userId);
    		
    		UserVO user = userDAO.loginUser(userId, userPwd); // 로그인 
        	
        	if (user != null) { // 로그인 성공 
                System.out.println("로그인 성공");
                
                if(id_rem != null) { // 아이디 저장이 체크된 경우 쿠키로 아이디값 저장 
                    cookie = new Cookie("userId", userId);
                   
                	// 쿠키값 저장 시간을 지정, 숫자당 1초로 계산
                	cookie.setMaxAge(60*60*24*1); // 1일간 저장
                    response.addCookie(cookie);
                } else { // 아이디 저장 체크 박스를 해제한 경우
                	cookie = new Cookie("userId", null);
                	
                	// 쿠키 초기화 
                	cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
                
                // 세션에 저장한 로그인 회원 정보 저장
                session.setAttribute("userId", user.getId());
                session.setAttribute("userName", user.getName());
                session.setAttribute("remember", id_rem);

                destPage = "/main.do";
            } else { // 로그인 실패
            	System.out.println("로그인 실패");
            	destPage = "/jsp/login.jsp";
            }
            
            if (userId == "" || userPwd == "") {
            	System.out.println("빈칸이 존재합니다.");
            	destPage = "/jsp/login.jsp";
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