package com.hdmall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.hdmall.dao.QnaDAO;
import com.hdmall.dao.UserDAO;
import com.hdmall.vo.QBoardVO;


@WebServlet("/QBoardDetail")
public class QBoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	QnaDAO qnaDAO;
	UserDAO userDAO;
	
	public void init(ServletConfig config) throws ServletException {
		qnaDAO = QnaDAO.getInstance();
		userDAO= UserDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		
		String destPage = "";
		
		/*한글 처리*/
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		/*session 값에서 login한 user_id 받아옴*/
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("userId");
		
		/*클릭한 qboard_id 받아옴*/
		String qboard_id =request.getParameter("qboard_id");	
		System.out.println(qboard_id);	
		
		String qboard_ans_yn = request.getParameter("ans_yn");
		System.out.println("클릭시 답변 유무 " + qboard_ans_yn);
		
		try {
			
			QBoardVO qboard_detail = qnaDAO.getQboardDetail(qboard_id); /*getQboardDetail 함수*/
			request.setAttribute("qboard_detail", qboard_detail); 
			
			String user_type= userDAO.getUserType(loginUser);   /*user_id 값 받아서 user_type 반환 함수*/	
			request.setAttribute("user_type", user_type);
		
			request.setAttribute("qboard_id",qboard_id);
			
			destPage = "/jsp/qnaDetail.jsp";
			
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		}	
		catch (Exception e) {
			e.printStackTrace();
		}

	}
}










