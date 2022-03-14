package com.hdmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hdmall.vo.*;

import util.DBManager;

public class UserDAO {
	private Connection conn;
	private CallableStatement cstmt;

	private UserDAO() { } // 싱글턴 패턴
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
    	return instance;
	}
	  
	public UserVO loginUser(String userId, String userPwd) throws SQLException { // 로그인 후 필요한 정보 : 아이디, 비밀번호, 이름 
		conn = DBManager.getConnection();
		UserVO user = new UserVO();
	    
	    try {
	    	cstmt = conn.prepareCall("{call login_user_proc(?, ?, ?, ?)}");
			System.out.println(cstmt); 
	    	
		    cstmt.setString(1, userId);
		    cstmt.setString(2, userPwd);
		    
		    cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
		    cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
		    
		    cstmt.execute();
		    
		    String id = cstmt.getString(3);
		    String name = cstmt.getString(4);
		    System.out.println(id);
		    System.out.println(name);
		    
    		System.out.println("로그인 성공");
    		user.setId(id);
		    user.setName(name);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
		    DBManager.close(conn, cstmt);
	    }
	    
	    return user;
	}
	
	/* USER_TYPE 가져오기 */
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
	
	public int checkId(String userId) throws SQLException { // 회원가입시 아이디 중복 체크 
		int check = 0; // 중복이면 1
		
		try {
			conn = DBManager.getConnection();
	        cstmt = conn.prepareCall("select id_check_func(?) from dual");
	        cstmt.setString(1, userId);
	          
	        ResultSet result = cstmt.executeQuery();
	          
	        if (result.next()) { // 중복된 아이디를 세는 PL/SQL 함수 사용
	        	check = result.getInt(1);
	        }
	    } catch (Exception e){
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, cstmt);
	    }
        
		return check;
	}
	
	public int checkHpno(String userHpno) throws SQLException { // 회원가입시 아이디 중복 체크 
		int check = 0; // 중복이면 1
		
		try {
			conn = DBManager.getConnection();
	        cstmt = conn.prepareCall("select hpno_check_func(?) from dual");
	        cstmt.setString(1, userHpno);
	          
	        ResultSet result = cstmt.executeQuery();
	          
	        if (result.next()) { // 중복된 전화번호를 세는 PL/SQL 함수 사용
	        	check = result.getInt(1);
	        }
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		
		return check;
	}
	
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
		    cstmt.setString(7, "USER");
		    
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
	
	public int logoutUser(String userId) throws SQLException {
		int check = 0; // 로그인 실패면 0 
		
		conn = DBManager.getConnection();
		
		cstmt = conn.prepareCall("{call logout_user_proc(?, ?)}");
		System.out.println(cstmt); 
    	
	    cstmt.setString(1, userId);
	    cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
	    
	    cstmt.execute();
	    
	    String id = cstmt.getString(2);
	    System.out.println(id);
	    
	    if (id != null) {
	    	check = 1;
			System.out.println("로그아웃 성공");
	    } else {
	    	check = 0;
	    }
		
        DBManager.close(conn, cstmt);
 
        return check;
	}
	
	public int updateUser(String userPwd, String userName, String userHpno, String email1, String email2, String userId) throws SQLException { // 회원정보 수정 
		int check = 0; // 업데이트 실패면 0 
		
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
	
	public int deleteUser(String userId) throws SQLException { // 회원 탈퇴
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