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

import com.hdmall.dao.LikeDAO;
import com.hdmall.dao.ProductDAO;
import com.hdmall.vo.LikeVO;
import com.hdmall.vo.ProductVO;

// 김민수 : 상품 리스트에서 특정 상품을 선택하면 실행되는 컨트롤러
@WebServlet("/productdetail")
public class ProductDetailController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ProductDAO productDAO;
	LikeDAO likeDAO;
	
	public void init(ServletConfig config) throws ServletException {
		// 싱글톤 패턴
		productDAO = ProductDAO.getInstance();
		likeDAO = LikeDAO.getInstance(); 
	}

	//get 요청시 doHand..로 전달
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		doHandle(request, response);
	}//endo.. 

	//post 요청시 doHand..로 전달
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}//end doP...

	private void doHandle(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		
		String destPage = "";
		
		// 김민수 : 한글화 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 김민수 : 세션에서 로그인한 user id를 받아옴
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("userId");
		
		// 김민수 : ProductListContrller에서 선택하여 들어간 상품 아이디 저장 
		String prod_id =request.getParameter("prod_id");	
		
		System.out.println("user_id : " + user_id + " prod_id " + prod_id);
		
		try {
			// 김민수 : 해당 상품 테이블 행 저장 
			ProductVO productVO = productDAO.getProduct(prod_id);
			
			// 김민수 : 해당 상품의 찜하기 총 갯수 저장 
			int likecount = productDAO.getLikeCount(prod_id);
			
			// 김민수 : 상품 상세페이지에 해당 유저가 해당 상품을 좋아요 눌렀는지 확인
			int islike = likeDAO.checkLikeUser(user_id, prod_id);
			
			// 김민수 : jsp에 다음의 값들을 setAttribute로 전달
			request.setAttribute("productVO", productVO); 
			request.setAttribute("likecount", likecount);
			request.setAttribute("islike", islike); 
			
			destPage = "/jsp/productdetail.jsp";
			
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		}	
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}