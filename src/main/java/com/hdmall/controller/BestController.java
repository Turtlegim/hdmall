package com.hdmall.controller;

import java.io.*;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hdmall.dao.*;
import com.hdmall.vo.*;

// 김기범 : Best Controller
@WebServlet("/best") // servlet annotation 설정
public class BestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PBoardDAO pboardDAO;

	public void init() throws ServletException {
		pboardDAO = PBoardDAO.getInstance(); // 싱글톤 패턴.
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doHandle(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		try {
			doHandle(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String destPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cate_no = request.getParameter("cate_no"); // jsp에서 받아온 카테코리 넘버 저장 
		List<ProductVO> pvo = null; // 함수에서 반환된 Top hit produtcs를 담을 객체 생성.
		try {
			if (cate_no != null) { // 카테고리가 지정되어 있을 경우 
				pvo = pboardDAO.listTophitsPBoard(cate_no); // 매개변수가 있는 함수 호출하여 객체 받아옴.
				
			} else { // 카테고리가 전체일 경우 
				pvo = pboardDAO.listTophitsPBoard(); // 매개변수가 없는 함수 호출.
			}
			request.setAttribute("best", pvo); // 받아온 객체 request 객체에 set.
			destPage =  "/jsp/productBest.jsp"; // desination jsp page 지정.
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage); // 디스패처로 jsp로 요청을 넘김.
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//end class
}//end class