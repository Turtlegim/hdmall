package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;

@WebServlet("/idCheck")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}
	
	/* 경민영 : 아이디 중복 확인 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 한글화 처리
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
	    PrintWriter out = response.getWriter();
	    HttpSession session = request.getSession();
	    
	    // join.jsp 에서 id가 userId인 input box에 입력한 내용 요청 후 저장 
	    String userId = request.getParameter("userId");
	    System.out.println("전달된 useId : " + userId);
	    
	    try {
	        int result = userDAO.checkId(userId); // 아이디 중복 확인
	        
	        if (result > 0) { // 아이디가 중복된 경우 
	        	out.print("{\"result\": 1}"); // join.jsp로 result 1 값 전달  
	        } else { // 아이디가 중복이 아닌 경우 
	        	out.print("{\"result\": 0}"); // join.jsp로 result 0 값 전달 
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