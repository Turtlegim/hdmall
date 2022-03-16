package com.hdmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hdmall.vo.*;

import util.DBManager;

/* UserDAO */
public class UserDAO {
	private Connection conn;
	private CallableStatement cstmt;

	private UserDAO() { } // 싱글턴 패턴
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
    	return instance;
	}
	 
	/* 경민영 : 회원 로그인 */
	public UserVO loginUser(String userId, String userPwd) throws SQLException { // 로그인 후 세션에 저장할 회원 정보 : 아이디, 이름 
		conn = DBManager.getConnection(); 
		UserVO user = new UserVO();
	    
	    try {
	    	cstmt = conn.prepareCall("{call login_user_proc(?, ?, ?, ?)}"); // 로그인 시 입력한 아이디와 비밀번호가 가입한 회원 정보와 일치하면 아이디와 이름을 반환해주는 프로시저
			System.out.println(cstmt); 
	    	
		    cstmt.setString(1, userId); // 입력한 회원 아이디
		    cstmt.setString(2, userPwd); // 입력한 회원 정보
		    
		    cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
		    cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		    
		    cstmt.execute(); // cstmt 실행
		    
		    String id = cstmt.getString(3); // 반환된 아이디를 저장
		    String name = cstmt.getString(4); // 반환된 이름을 저장
		    
		    System.out.println("로그인 결과 회원의 이름은 : " + name); // 확인용
		    
		    if (id != null && name != null) { // 회원 아이디와 비밀번호 조회에 성공하면
		    	System.out.println("로그인 성공"); // 확인용
	    		user.setId(id); // 아이디 set
			    user.setName(name); // 비밀번호 set 
		    } else {
		    	System.out.println("로그인 실패");
		    	user = null; // 조회된 회원 null 
		    }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
		    DBManager.close(conn, cstmt);
	    }
	    
	    return user;
	}
	
	/* 배지현 : USER_TYPE을 가져오는 함수 */
    public String getUserType(String session_id) throws SQLException{    
       System.out.println("getUserType_session_id : " + session_id);
       String user_type = "";
     
       try {
    	   conn = DBManager.getConnection();
           cstmt = conn.prepareCall("select get_usertype_func(?) from dual");
           cstmt.setString(1, session_id);
          
           ResultSet result = cstmt.executeQuery();
          
           if (result.next()) {
              user_type = result.getString(1);
              System.out.println("admin(관리자)입니다.");
          } else {
              System.out.println("존재하지 않는 회원입니다.");
          }
       } catch (Exception e){
    	  e.printStackTrace();
       } finally {
    	  DBManager.close(conn, cstmt);
       }
      
       System.out.println("user_type" + user_type);
        
       return user_type;   
    }
	
    /* 경민영 : 회원가입시 아이디 중복 확인을 하는 함수 */
	public int checkId(String userId) throws SQLException { 
		int check = 0; // 중복이면 1
		
		try {
			conn = DBManager.getConnection();
	        cstmt = conn.prepareCall("select id_check_func(?) from dual"); // 아이디 중복 조회 후 조회된 count를 반환 
	        cstmt.setString(1, userId);
	          
	        ResultSet result = cstmt.executeQuery();
	          
	        if (result.next()) { 
	        	check = result.getInt(1);
	        }
	    } catch (Exception e){
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, cstmt);
	    }
        
		return check;
	}
	
	/* 경민영 : 회원정보 수정시 전화번호 중복을 확인하는 함수, DB Table 내에서 회원 전화번호는 UNIQUE KEY */
	public int checkHpno(String userHpno) throws SQLException {
		int check = 0; // 중복이면 1
		
		try {
			conn = DBManager.getConnection();
	        cstmt = conn.prepareCall("select hpno_check_func(?) from dual"); // 전화번호 중복 조회 후 조회된 count를 반환
	        cstmt.setString(1, userHpno);
	          
	        ResultSet result = cstmt.executeQuery();
	          
	        if (result.next()) { 
	        	check = result.getInt(1);
	        }
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		
		return check;
	}
	
	/* 경민영 : 회원가입 */
	public int joinUser(String userId, String userPwd, String userName, String userHpno, String email1, String email2) throws SQLException {
		conn = DBManager.getConnection();
	    int result = 0;
	    
	    try {
	    	cstmt = conn.prepareCall("{call join_user_proc(?, ?, ?, ?, ?, ?, ?)}");
			System.out.println(cstmt); 
	    	
		    cstmt.setString(1, userId);
		    cstmt.setString(2, userPwd);
		    cstmt.setString(3, userName);
		    cstmt.setString(4, userHpno);
		    cstmt.setString(5, email1);
		    cstmt.setString(6, email2);
		    cstmt.setString(7, "USER"); // 회원가입시 회원의 유형은 USER로 설정 (기본값), ADMIN 계정은 Table 내에 존재
		    
		    result = cstmt.executeUpdate();
		    
	    	if (result == 1) {
        		System.out.println("회원가입 성공");
	        } else {
	        	System.out.println("회원가입 실패");
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
		    DBManager.close(conn, cstmt);
	    }
	    
	    return result;
	}
	
	/* 경민영 : 로그아웃 */
	public int logoutUser(String userId) throws SQLException {
		int check = 0; // 로그인 실패면 0 
		
		conn = DBManager.getConnection();
		
		cstmt = conn.prepareCall("{call logout_user_proc(?, ?)}");
		System.out.println(cstmt); 
    	
	    cstmt.setString(1, userId);
	    cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
	    
	    cstmt.execute();
	    
	    String id = cstmt.getString(2);
	    
	    if (id != null) {
	    	check = 1;
			System.out.println("로그아웃 성공");
	    } else {
	    	check = 0;
	    	System.out.println("로그아웃 실패");
	    }
		
        DBManager.close(conn, cstmt);
 
        return check;
	}
	
	/* 경민영 : 회원정보관리 - 마이페이지에서 회원정보를 수정할 때 사용하는 함수 */
	public int updateUser(String userPwd, String userName, String userHpno, String email1, String email2, String userId) throws SQLException { // 회원정보 수정 
		int check = 0; // 수정을 실패면 0 
		
		try {
			conn = DBManager.getConnection();
			
			cstmt = conn.prepareCall("{call update_user_proc(?, ?, ?, ?, ?, ?)}");
			
			cstmt.setString(1, userPwd);
			cstmt.setString(2, userName);
			cstmt.setString(3, userHpno);
			cstmt.setString(4, email1);
			cstmt.setString(5, email2);
			cstmt.setString(6, userId);
			
		    check = cstmt.executeUpdate();
		    System.out.println("회원정보 수정 결과를 확인하는 check : " + check);
		    
			if (check == 1) {
	    		System.out.println("회원정보 수정 성공");
	        } else {
	        	System.out.println("회원정보 수정 실패");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		
		return check;
	}
	
	/* 경민영 : 회원정보관리 화면에서 회원탈퇴하기를 했을 때 실행되는 함수 */
	public int deleteUser(String userId) throws SQLException {
		int result = 0;

		try {
			conn = DBManager.getConnection();
			
			String query = "{call delete_user_proc(?, ?)}";
			
			cstmt = conn.prepareCall(query);
			cstmt.setString(1, userId);
			
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			
			cstmt.executeUpdate();
			
			result = cstmt.getInt(2);
			
			if (result == 1) { // 회원 탈퇴 성공
	        	System.out.println("회원 탈퇴 성공");
	        } else { // 회원 탈퇴 실패
	        	System.out.println("회원 탈퇴 실패");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
        
		return result;
	}
}