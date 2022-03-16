package com.hdmall.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdmall.dao.ProductDAO;
import com.hdmall.vo.ProductVO;

// 김민수 : 사이드 바에서 신상품, 여성캐쥬얼, 남성캐쥬얼 중 한가지를 선택하면 실행되는 컨트롤러 
@WebServlet("/productList")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ProductDAO productDAO;

	public void init(ServletConfig config) throws ServletException {
		productDAO = ProductDAO.getInstance(); // 싱글톤 패턴
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		String destPage = "";
		
		// 김민수 : 한글화 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		HttpSession session = request.getSession();
		
		// 김민수 : 세션에 저장된 user_id를 getAttribute하여 저장
		String user_id = (String) session.getAttribute("userId");
		
		// 김민수 : 쿼리스트링을 통해 전달된 cate_no 이라는 변수 값을 getParamete를 사용해 저장
		String cate_no = request.getParameter("cate_no");
				
		System.out.println("카테고리 : " + cate_no + " user id : " + user_id);

		// 각 상품 카테고리 페이지에 있는 상품 갯수를 담아두기 위한 선언
		int count; 
		

		try {
			List<ProductVO> productList = new ArrayList<ProductVO>();
			
			// 김민수 : 신상품과 여성/남성캐쥬얼 나누어 해당 카테고리에 해당하는 상품 테이블과 총 갯수 저장
			if(cate_no.equals("신상품")) {				
				productList = productDAO.listProductNew(user_id);			
				count = productDAO.getNewCount();						
			}
			else {	
				productList = productDAO.listProductCategory(cate_no, user_id);			
				count = productDAO.getCategoryCount(cate_no);				
			}
			
			// 김민수 : setAttribute하여 jsp에서 사용할 값들을 념겨준다. (선택한 카테고리, 상품 리스트, 상품 갯수)
			request.setAttribute("cate", cate_no);
			request.setAttribute("productList", productList);
			request.setAttribute("count", count);
			
			destPage =  "/jsp/productcategory.jsp";
						
			RequestDispatcher dispatch = request.getRequestDispatcher(destPage);
			dispatch.forward(request, response);
		}	
		catch (Exception e) {
			e.printStackTrace();
		}
	}	
}