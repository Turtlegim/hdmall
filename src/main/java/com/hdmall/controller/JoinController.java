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

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();  
        
		String name = request.getParameter("userName");
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		String hpno = request.getParameter("userHpno");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");   
		
		int result = 0; // 회원가입을 실패하면 0 
		
		if (email2 == null) {
			email2 = request.getParameter("emaildomain");
		}
	    
        try {
    	    int checkHpno = userDAO.checkHpno(hpno); // 전화번호 중복 확인 
    	    
    	    result = userDAO.joinUser(id, pwd, name, hpno, email1, email2);
    	    
        	session.setAttribute("userId", id);
        	
            if (result == 1 && checkHpno == 0) {
            } else {
                if (checkHpno == 1) { // Controller에서 실행되도록 변경하기
                	result = 2;
                }
                
                result = 0;
            	
            	destPage = "/jsp/join.jsp";
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