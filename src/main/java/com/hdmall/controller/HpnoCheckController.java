package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
 
@WebServlet("/hpnoCheck")
public class HpnoCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}

	/* 경민영 : 전화번호 중복 확인 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 한글화 처리
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
	    PrintWriter out = response.getWriter();
	    HttpSession session = request.getSession();
	    
	    // join.jsp 에서 id가 userHpno인 input box에 입력한 내용 요청 후 저장
	    String userHpno = request.getParameter("userHpno");
	    System.out.println("전달된 userHpno : " + userHpno);
	    
	    try {
	    	int result = userDAO.checkHpno(userHpno); // 전화번호 중복 확인 
	    	System.out.println("전화번호 중복 결과 : " + result);
	    	
	        if (result > 0) { // 전화번호가 중복된 경우 
	        	out.print("{\"result\": 1}"); // user_manage.jsp로 result 1 값 전달 
	        } else { // 전화번호가 중복이 아닌 경우
	        	out.print("{\"result\": 0}"); // user_manage.jsp로 result 0 값 전달 
	        	session.setAttribute("idCheckResult", result); // 세션에 결과 저장
	        }
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