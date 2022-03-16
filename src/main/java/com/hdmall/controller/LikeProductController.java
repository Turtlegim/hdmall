package com.hdmall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hdmall.dao.LikeDAO;

// 김민수 : 상품 상세페이지에서 찜하기 버튼 클릭시 수행되는 컨트롤러
@WebServlet("/LikeProduct")
public class LikeProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	LikeDAO likeDAO;

	public void init(ServletConfig config) throws ServletException {
		likeDAO = LikeDAO.getInstance(); // 싱글톤 패턴
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		// 김민수 : 한글화 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
				
		// 김민수 : 서블릿에서 클라이언트에 데아토를 보내기위해 사용하는 변수
		PrintWriter out = response.getWriter();
		
		// 김민수 : jsp파일에서 ajax로 전해진 데이터를 변수로 사용하기 위해 저장
		String userId = request.getParameter("userId");
		String prodId = request.getParameter("prodId");
		String isLike = request.getParameter("isLike");
	    System.out.println("전달된 userId : " + userId);
	    System.out.println("전달된 prodId : " + prodId);
	    System.out.println("전달된 isLike : " + isLike);
		
	    int result = 0;
	    
		try {
			// 김민수 : checkLikeInfo 함수에서 이미 유저한 찜한 기록이 있는지를 1 또는 0으로 받아와 check 변수에 저장
			int check = likeDAO.checkLikeInfo(userId, prodId);
			
			// 김민수 : 1이면 like_t 테이블에 이미 user 정보가 존재 
			if (check == 1) {
				
				// 김민수 : if else 문으로 찜하기가 되어있을 때 0으로 안되있을 때 1로 반대로 바꿈
				if (isLike.equals("1")) {
					isLike = "0";
				}
				else {
					isLike = "1";
				}
						
				// 김민수 : updateLike 함수에서 찜하기 수정 성공여부 1또는 0을 result에 저장
				result = likeDAO.updateLike(isLike, userId, prodId);
				
				// 김민수 : if문으로 updateLike 함수의 성공여부와 isLike 변수 값을 확인하여 
				//        찜하기를 취소하는 것인지 다시 등록하는것이 판단후 ajax에 값을 전달 
				if (result == 1 && isLike.equals("0")) {
					System.out.println("업데이트 취소");
					out.print(1);
		        } 
				else if (result == 1 && isLike.equals("1")) {
					System.out.println("업데이트 다시 등록");
					out.print(2);
				}
				else {
					out.print("0");
				}
			
			// 김민수 : 0이면 like_t 테이블에 user 정보가 존재하지 않으므로 insert
			} else {				
				
				//김민수 : insertLike 함수에서 찜하기 등록 성공여부 1또는 0을 result에 저장
				result = likeDAO.insertLike(userId, prodId, "1");	
				System.out.println("insert 실행");
								
				if (result == 1) {	
					out.print(2);
		        } 
				else {
					out.print("0");
				}
			}
		
		}	
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}