package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;

@WebServlet("/userManage")
public class UserManageController extends HttpServlet {
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
        
    	String destPage = "/jsp/mypage.jsp";

        PrintWriter out = response.getWriter();
        
		String pwd = request.getParameter("userPwd");
		String name = request.getParameter("userName");
		String hpno = request.getParameter("userHpno");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2"); 
		
		HttpSession session = request.getSession();  
		String id = (String) session.getAttribute("userId");
		
		int result = 0; // 회원 정보 수정을 실패하면 0 
		
		if (email2 == null) {
			email2 = request.getParameter("emaildomain");
		}
	    
        try {
    	    result = userDAO.updateUser(pwd, name, hpno, email1, email2, id);
        	
            if (result == 1) {
            	out.print("{\"result\": 1}"); // 회원정보 수정 성공

            	destPage = "/jsp/mypage.jsp";
            } else {
                result = 0;
            	out.print("{\"result\": 0}"); // 회원정보 수정 실패
            	
            	destPage = "/jsp/user_manage.jsp";
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