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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
        HttpSession session = request.getSession();
        
		response.setContentType("text/html;charset=UTF-8");
		
		 PrintWriter out = response.getWriter();
		 
		request.getRequestDispatcher("/src/main/webapp/jsp/main.jsp");
        
        String userId = (String) session.getAttribute("userId");
        
        try {
        	int result = userDAO.logoutUser(userId);
            String destPage = "/jsp/login.jsp";
            
            if (result == 1) { // 로그아웃 성공
                System.out.println("로그아웃 성공");
                session.setAttribute("userId", null);
                session.setAttribute("userName", null);
                session.invalidate();
                
                destPage = "/jsp/main.jsp";
            } else {
            	System.out.println("로그아웃 실패");
            }
            out.print("{\"result\":"+result+"}");
             
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