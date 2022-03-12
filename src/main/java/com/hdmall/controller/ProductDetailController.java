package com.hdmall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hdmall.dao.ProductDAO;
import com.hdmall.vo.ProductVO;

@WebServlet("/productdetail/*")
public class ProductDetailController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ProductDAO productDAO;

	public void init(ServletConfig config) throws ServletException {
		productDAO = ProductDAO.getInstance();
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
		// 한글화 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		
		// ProductListContrller에서 선택하여 들어간 상품 아이디를 받아옴 
		String prod_id =request.getParameter("prod_id");
		
		System.out.println(prod_id);
		
		//커맨드 출력
		try {
			// 받아온 상품 아이디를 통해 getProduct함수의 인자로 전해주어 상품테이블의 컬럼을 가져옴
			ProductVO productVO = productDAO.getProduct(prod_id);
			request.setAttribute("productVO", productVO); 
			
			destPage = "/jsp/productdetail.jsp";
			
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		}	
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}