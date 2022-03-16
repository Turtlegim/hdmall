package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.UserVO;

@WebServlet("/userManage")
public class UserManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
	}

	/* 경민영 : 회원정보관리 (회원정보 수정) */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		// 한글 처리
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        // 세션 저장
		HttpSession session = request.getSession();  
		String id = (String) session.getAttribute("userId");
        
        // destPage
  		// 1. 회원정보 수정 성공시 마이페이지로 이동 
  		// 2. 회원정보 수정 실패시 회원정보관리 초기 화면으로 이동 
    	String destPage = "";
        
    	// user_manage.jsp 에 입력한 내용 요청 후 저장
		String name = request.getParameter("userName");
		String hpno = request.getParameter("userHpno");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		int result = 0; // 회원정보 수정을 실패하면 0
		
		if (email2 == null) { // 이메일 주소란이 비어있는 경우 
			email2 = request.getParameter("emaildomain"); // 도메인 콤보 박스에 있는 값으로 저장하기
		}
		
		String email = email1 + email2;
	    
        try {
        	// 이름, 전화번호, 이메일을 필수로 입력해야 수정 가능 
            if (name != "" && hpno != "" && email != "") { // 빈 문자열이 존재하지 않는 경우
            	result = userDAO.updateUser(name, hpno, email1, email2, id); // 회원정보 수정 성공 
            	
            	destPage = "/QBoardList";
            	System.out.println("회원정보 수정 성공");
            } else {
                result = 0; // 회원정보 수정 실패
            	destPage = "/jsp/user_manage.jsp";
            	System.out.println("회원정보 수정 실패");
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