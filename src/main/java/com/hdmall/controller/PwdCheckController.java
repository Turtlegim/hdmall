package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.UserVO;

/* 경민영: 비밀번호 확인 (회원정보 수정 전) */
@WebServlet("/pwdCheck")
public class PwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 한글화 처리
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
	    PrintWriter out = response.getWriter();
	    
	    // user_manage.jsp 에 입력한 내용 요청 후 저장 
	    String userId = (String) request.getSession().getAttribute("userId");
	    String userPwd = request.getParameter("userPwd");
	    System.out.println("전달된 userPwd : " + userPwd);
	    
	    try {
	        UserVO user = userDAO.loginUser(userId, userPwd); // 로그인 함수를 통해 비밀번호를 제대로 입력했는지 확인
	        if (user != null) { // 존재하는 회원 
	        	out.print("{\"result\": 1}"); // json문법은 객체 표현할때 프라퍼티 앞에 백슬러시 큰따옴표가 필요 
	        } else { // 존재하지 않는 회원, 비밀번호 다시 입력 
	        	out.print("{\"result\": 0}");
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