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

	/* 경민영 : 회원 가입 */ 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        
		// 한글 처리
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        // destPage
 		// 1. 회원 탈퇴 성공 시 메인 화면으로 이동
 		// 2. 회원 탈퇴 실패 시 회원가입 화면으로 이동 
    	String destPage = "/main.do";

        HttpSession session = request.getSession();  
        
        // join.jsp 에 입력한 내용 요청 후 저장
		String name = request.getParameter("userName");
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		String rePwd = request.getParameter("reUserPwd");
		String hpno = request.getParameter("userHpno");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");   
		
		int result = 0; // 회원가입을 실패하면 0 
		
		if (email2 == null) { // 이메일 주소란이 비어있는 경우 
			email2 = request.getParameter("emaildomain"); // 도메인 콤보 박스에 있는 값으로 저장하기
		}
		
		if (pwd != rePwd) { // 비밀번호와 비밀번호 확인에 입력한 내용이 일치하지 않는 경우 
			session.setAttribute("isPwdEqual", 1);
		}
	    
        try {
    	    int checkHpno = userDAO.checkHpno(hpno); // 전화번호 중복 확인 
    	    
    	    if (checkHpno == 0) { // 전화번호가 중복되지 않은 경우 joinUser 실행
    	    	result = userDAO.joinUser(id, pwd, name, hpno, email1, email2); // 회원 가입 
    	    	result = 0;
    	    }
        	
            if (result == 1) { // 회원가입 성공
            	result = 1;
            } else { // 회원가입 실패
        		result = 0;
        		destPage = "/jsp/join.jsp";
            }
            
            // 회원가입의 결과를 세션에 저장
            // 0 : 회원가입 실패
            // 1 : 회원가입 성공 
            session.setAttribute("joinResult", result);
            
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