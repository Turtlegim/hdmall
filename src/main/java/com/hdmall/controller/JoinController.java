package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;
 
/**
 * Servlet implementation class MemberController
 */
@WebServlet("/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        

		// 한글 처리
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();  
        
		String name = request.getParameter("userName");
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		String hpno = request.getParameter("userHpno");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");   
		
		if (email2 == null) {
			email2 = request.getParameter("emaildomain");
		}
	    
        try {
    	    int checkHpno = userDAO.checkHpno(hpno); // 전화번호 중복 확인 
            int result = userDAO.joinUser(id, pwd, name, hpno, email1, email2);
    	    
        	String destPage = "/jsp/join.jsp";
        	session.setAttribute("userId", id);
        	
            if (result == 1 && checkHpno == 1) {
                destPage = "/jsp/main.jsp";

            	out.print("{\"result\": 1}"); // 회원가입 성공 
            } else {
                if (checkHpno == 0) {
                	result = 2;
                	out.print("{\"result\": 2}"); // 회원가입 실패 사유 : 전화번호 중복 
                }
                
                result = 0;
            	out.print("{\"result\": 0}"); // 회원가입 실패 
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        } catch (SQLException e) {
			e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		doGet(request, response);
    }

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}//end class
}//end class