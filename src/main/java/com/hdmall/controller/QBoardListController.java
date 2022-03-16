package com.hdmall.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.hdmall.dao.QnaDAO;
import com.hdmall.dao.UserDAO;
import com.hdmall.vo.QBoardVO;

import util.Tool;


@WebServlet("/QBoardList")
public class QBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;			
		QnaDAO qnaDAO;
		UserDAO userDAO;
	
	public void init() throws ServletException {
		qnaDAO = QnaDAO.getInstance();
		userDAO = UserDAO.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		int count; 
		int count_combo;
		int count_like;
		String destpage = "";
		String user_type;
		
		List<QBoardVO> qboardList = new ArrayList<QBoardVO>();
		
		/*배지현 : 한글화 처리*/
		request.setCharacterEncoding("utf-8");
		response.setContentType("\"text/html;charset=utf-8\"");
		
		/*배지현 : session 값에서 login한 user_id 받아옴*/
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("userId");
																	
		try {
			if (loginUser != null) {
				
				/* 배지현 : USER_TYPE ADMIN or USER 확인 */
				user_type = userDAO.getUserType(loginUser);
				
				
				String col = Tool.checknull(request.getParameter("searchType")); 
				System.out.println("첫 col" + col);
				String word = Tool.checknull(request.getParameter("searchword"));
				System.out.println("첫 word" + word);
				
				/* 배지현 : 분기처리 */
				if(user_type.equals("ADMIN")) {
				 	qboardList = qnaDAO.qBoardListAll(col,word);				 			/*배지현 : ADMIN :검색 입력 값에 따른 list*/
				 	request.setAttribute("qboardList", qboardList);
				 
				 	count = qnaDAO.getAllProductCount_A();									/*배지현 : ADMIN 답변 되지 않은 총 list count*/
			        request.setAttribute("count", count);
			        
			        count_combo = qnaDAO.getAllProductCount_COMBO_A(col,word);  			/*배지현 : ADMIN 검색 입력 값에 따라 count*/
			        request.setAttribute("count_combo", count_combo);
			 	} else {	
			 		qboardList = qnaDAO.qBoardlistType_U(loginUser,col,word);		 		/*배지현 : USER 검색 입력 값에 따른 list*/
				 	request.setAttribute("qboardList", qboardList);
				 	
				    count = qnaDAO.getAllProductCount_U(loginUser);							/*배지현 : USER 게시글 총 count*/
				    request.setAttribute("count", count);
				    
			        count_combo = qnaDAO.getAllProductCount_COMBO_U(loginUser,col,word);  	/*배지현 : USER 검색 입력 값에 따라 count*/
			        request.setAttribute("count_combo", count_combo);
			        
			        count_like = qnaDAO.getLikeProductCount(loginUser); 				  	/*배지현 : USER가 찜한 목록 count*/
			        request.setAttribute("count_like", count_like);
			 	}			
				destpage = "/jsp/mypage.jsp";												

				RequestDispatcher dispatcher = request.getRequestDispatcher(destpage);
				dispatcher.forward(request, response);
			} else {
				destpage = "/hdmall/login";														/*경민영 : 로그인 유효성 체크 */
				System.out.println("마이페이지는 로그인 후 이용 가능합니다.");
				response.sendRedirect(destpage);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}