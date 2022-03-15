package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;
 
@WebServlet("/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        
		// 한글 처리
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
    	String destPage = "/jsp/main.jsp";

        HttpSession session = request.getSession();  
        
		String name = request.getParameter("userName");
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		String rePwd = request.getParameter("reUserPwd");
		String hpno = request.getParameter("userHpno");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");   
		
		int result = 0; // 회원가입을 실패하면 0 
		
		if (email2 == null) {
			email2 = request.getParameter("emaildomain");
		}
		
		if (pwd != rePwd) {
			session.setAttribute("isPwdEqual", 1);
		}
	    
        try {
    	    int checkHpno = userDAO.checkHpno(hpno); // 전화번호 중복 확인 
    	    
    	    result = userDAO.joinUser(id, pwd, name, hpno, email1, email2);
    	    
        	session.setAttribute("userId", id);
        	
            if (result == 1) { // 회원가입 성공
            	result = 1;
            } else { // 회원가입 실패
                if (checkHpno == 1) { // 전화번호 중복으로 회원가입 실패한 경우
                	result = 2;
                }
                
                result = 0;
            	
            	destPage = "/jsp/join.jsp";
            }
            
            session.setAttribute("joinResult", result); // 회원가입의 결과를 세션에 저장
            
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