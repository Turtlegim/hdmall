package com.hdmall.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.hdmall.vo.LikeVO;
import com.hdmall.vo.PBoardVO;
import com.hdmall.vo.ProductVO;

import util.DBManager;

public class LikeDAO {	
	private Connection conn;
	private PreparedStatement pstmt;
	
	private LikeDAO() { } // 싱글턴 패턴 처리
	private static LikeDAO instance = new LikeDAO();
	public static LikeDAO getInstance() {
		return instance;
	}
	
	public ArrayList<LikeVO> listLike() {
	    ArrayList<LikeVO> likelist = new ArrayList<>();
	    String sql = "select * from like_t";
	    
	    ResultSet rs = null;    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	    	  LikeVO lboard = new LikeVO();
	    	  lboard.setUser_id(rs.getString("user_id"));
	    	  lboard.setProd_id(rs.getString("prod_id"));
		      lboard.setIs_liked(rs.getBoolean("is_liked"));
		      likelist.add(lboard);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	    return likelist;
	  }
	
	public ArrayList<LikeVO> listLikeTable(String userid) {
		ArrayList<LikeVO> likelist = new ArrayList<>();
	    String sql = "select * from like_t where user_id = ?";
	    ResultSet rs = null;    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, userid);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	    	  LikeVO lboard = new LikeVO();
	    	  lboard.setUser_id(rs.getString("user_id"));
	    	  lboard.setProd_id(rs.getString("prod_id"));
		      lboard.setIs_liked(rs.getBoolean("is_liked"));
		      likelist.add(lboard);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	    return likelist;
	}
	
	public ArrayList<ProductVO> listisLiked(String userid) {
		ArrayList<ProductVO> productList = new ArrayList<>();
	    String sql = "select * "
	    		+ "from ( "
	    		+ "	  select * "
	    		+ "	  from pb_p_id_view "
	    		+ "	 ) t1 "
	    		+ "left outer join "
	    		+ "	( "
	    		+ "	 select b.prod_id "
	    		+ "	 		,c.is_liked "
	    		+ "	 from   user_t    a "
	    		+ "	        ,pboard_t b "
	    		+ "	        ,like_t   c "
	    		+ "	 where  a.user_id = c.user_id "
	    		+ "	 	and b.prod_id = c.prod_id "
	    		+ "	 	and a.user_id = ? "
	    		+ "	) t2 "
	    		+ "on t1.prod_id = t2.prod_id "
	    		+ "WHERE t2.is_liked = 1";
	    ResultSet rs = null;
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, userid);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	    	  ProductVO product = new ProductVO();
	    	  product.setId(rs.getString("prod_id"));
	    	  product.setCate_no(rs.getString("cate_no"));
	    	  product.setImg(rs.getString("prod_img"));
	    	  product.setName(rs.getString("pboard_title"));
	    	  product.setContext(rs.getString("pboard_context"));
	    	  productList.add(product);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	    return productList;
	  }
	
	public void cancleLike(String userid, String prodid) {
		String sql = "update like_t set is_liked = 0 where user_id = ? and prod_id = ?";
	    ResultSet rs = null;
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, userid);
		  pstmt.setString(2, prodid);
	      rs = pstmt.executeQuery();
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	}
	
	// 찜한 목록을 지우는 함수
	public int deleteLike(String userId) throws SQLException { // 회원 탈퇴 전 문의 내역 지우기 
    	conn = DBManager.getConnection();
		
		String query = "delete from like_t where user_id=?";
		System.out.println(query);

		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		
		int result = pstmt.executeUpdate();
		
        if (result == 1) {
        	System.out.println("찜한 목록 삭제 성공");
        } else { // 회원 탈퇴 실패
        	System.out.println("찜한 목록 삭제 실패");
        }
        
        DBManager.close(conn, pstmt);
        
		return result;
	}
	
	// 해당 유저가 찜한 목록이 존재하는지 확인하는 함수 
	public int isExistLike(String userId) throws SQLException {
    	conn = DBManager.getConnection();
		
		String query = "select count(*) from like_t where user_id=?";
		System.out.println(query);

		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		
		ResultSet result = pstmt.executeQuery();
		int count = 0;
		
		if(result.next()) {
			count = result.getInt(1);
		}
        System.out.println("Total rows : " + count);
        
        if (count == 0) {
        	System.out.println("해당 유저의 찜한 목록이 존재하지 않습니다.");
        }
        
        DBManager.close(conn, pstmt);
        
		return count;
	}
}