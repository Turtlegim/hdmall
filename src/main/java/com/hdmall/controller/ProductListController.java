package com.hdmall.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdmall.dao.ProductDAO;
import com.hdmall.vo.ProductVO;

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
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		String destPage = "";
		// 한글화 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		// ProductListContrller에서 선택하여 들어간 상품 아이디를 받아옴 
		String cate_no = request.getParameter("cate_no");
		String user_id = (String) session.getAttribute("userId");
		
		System.out.println(cate_no);
		System.out.println(user_id);
		
		request.setAttribute("cate", cate_no);
		
		int count; 
		
		// 커맨드 출력
		try {
			List<ProductVO> productList = new ArrayList<ProductVO>();
		
			if(cate_no.equals("신상품")) {
				
				productList = productDAO.listProductNew(user_id);			
				count = productDAO.getAllCount();						
				destPage =  "/jsp/productcategory.jsp";
			}
			else {	

				productList = productDAO.listProductCategory(cate_no);			
				count = productDAO.getCategoryCount(cate_no);				
				destPage = "/jsp/productcategory.jsp";
			}
			
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