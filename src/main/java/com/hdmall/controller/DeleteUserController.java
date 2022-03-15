package com.hdmall.controller;

import java.io.*;
import java.sql.SQLException;
 
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
 
@WebServlet("/deleteUser")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;
	QnaDAO qnaDAO;
	LikeDAO likeDAO;

	public void init() throws ServletException {
		userDAO = UserDAO.getInstance();
		qnaDAO = QnaDAO.getInstance();
		likeDAO = likeDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		String destPage = "/jsp/mypage.jsp";
		
		HttpSession session = request.getSession();
	    PrintWriter out = response.getWriter();
	    
	    String userId = (String) session.getAttribute("userId");
	    System.out.println("전달된 userId : " + userId);
	    
	    try {
	    	int qnaCount = qnaDAO.isExistQna(userId);
	    	int likeCount = likeDAO.isExistLike(userId);
	    	
	    	if (qnaCount != 0) {
	    		int deleteQna = qnaDAO.deleteQna(userId); // 문의 내역 삭제
	    	}
	    	
	    	if (likeCount != 0) {
		    	int deleteLike = likeDAO.deleteLike(userId); // 찜하기 목록 삭제 
	    	}
	    	
	    	int result = userDAO.deleteUser(userId); // 회원 탈퇴
	    	
	        if (result == 1) { 
	        	System.out.println("회원 탈퇴 성공");
	        	out.print("{\"result\": 1}"); // json문법은 객체 표현할때 프라퍼티 앞에 백슬러시 큰따옴표가 필요 

	            session.setAttribute("userId", null);
	            session.setAttribute("userName", null);
	            session.invalidate();
	            
	        	destPage = "/main.do";
	        } else {
	        	System.out.println("회원 탈퇴 실패");
	        	out.print("{\"result\": 0}");
	        	
	        	destPage = "/jsp/user_manage.jsp";
	        }
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
	    } catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void getInstance() {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		doGet(request, response);
    }

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}//end class
}//end class