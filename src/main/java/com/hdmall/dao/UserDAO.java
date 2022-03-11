package com.hdmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hdmall.vo.*;

import util.DBManager;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;

	private UserDAO() { }//싱글턴 패턴
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
    	return instance;
	}
	  
	public UserVO loginUser(String userId, String userPwd) throws SQLException { // 로그인 후 필요한 정보 : 아이디, 비밀번호, 이름 
		conn = DBManager.getConnection();
		
		String query = "select * from user_t where USER_ID = ? AND USER_PW = ?";
		System.out.println(query);
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		pstmt.setString(2, userPwd);
		
		ResultSet result = pstmt.executeQuery();
		
		UserVO user = null;
        if (result.next()) {
        	user = new UserVO();
        	
        	user.setId(userId);
        	user.setPwd(userPwd);
        	result.getString("user_nm");
        	user.setName(result.getString("user_nm"));
        	
        	System.out.println("로그인 성공");
        } else {
        	System.out.println("존재하지 않는 회원입니다.");
        }
 
        conn.close();
 
        return user;
	}
	
	public int checkId(String userId) throws SQLException { // 회원가입시 아이디 중복 체크 
		int check = 0; // 중복이면 0 
    	conn = DBManager.getConnection();
		
		String query = "select * from user_t where user_id=?";
		System.out.println(query);

		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		
		ResultSet result = pstmt.executeQuery();
		
        if (result.next()) {
        	check = 1;
        	System.out.println("중복된 아이디입니다.");
        } else {
        	check = 0;
        	System.out.println("사용 가능 아이디입니다.");
        }
        
        conn.close();
        
		return check;
	}
	
	public int checkHpno(String userHpno) throws SQLException { // 회원가입시 아이디 중복 체크 
		int check = 0; // 중복이면 0 
    	conn = DBManager.getConnection();
		
		String query = "select * from user_t where hp_no=?";
		System.out.println(query);

		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userHpno);
		
		ResultSet result = pstmt.executeQuery();
		
        if (result.next()) {
        	check = 1;
        	System.out.println("중복된 전화번호입니다.");
        } else {
        	check = 0;
        	System.out.println("사용 가능한 전화번호입니다.");
        }
        
        conn.close();
        
		return check;
	}
	
	public int joinUser(String userId, String userPwd, String userName, String userHpno, String email1, String email2) throws SQLException {
		conn = DBManager.getConnection();
		String query = "insert into user_t (user_id, user_pw, user_nm, hp_no, email_f, email_l, user_type) values (?, ?, ?, ?, ?, ?, ?)";
		System.out.println(query);
	
	    int result = 0; 
	    
	    try {
	    	pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userName);
			pstmt.setString(4, userHpno);
			pstmt.setString(5, email1);
			pstmt.setString(6, email2);
			pstmt.setString(7, "USER");
			
			result = pstmt.executeUpdate();
	    	if (result == 1) {
        		System.out.println("회원가입 성공");
	        } else {
	        	System.out.println("회원가입 실패");
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } 
	    
	    conn.close();
		
		return result;
	}
	
	public int logoutUser(String userName) throws SQLException {
		int check = 0; // 로그인 실패면 0 
		
		conn = DBManager.getConnection();
		String query = "select * from user_t where USER_NM = ?";
		System.out.println(query);
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userName);
		
		ResultSet result = pstmt.executeQuery();
		
        if (result.next()) {
        	check = 1;
        	System.out.println("로그아웃 성공");
        } else {
        	check = 0; 
        	System.out.println("로그아웃 실패");
        }
 
        conn.close();
 
        return check;
	}
}