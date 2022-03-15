package com.hdmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hdmall.vo.LikeVO;
import com.hdmall.vo.ProductVO;

import util.DBManager;

public class LikeDAO {	
	private Connection conn;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	
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
        
        conn.close();
        
		return count;
	}
	
	// 김민수 
	public int insertLike(String userId, String prodId, String isLike) throws SQLException {
		int result = 0;
		conn = DBManager.getConnection();
		
		try {
			cstmt = conn.prepareCall("{call INSERT_LIKE_PROC(?, ?, ?)}");
			
			System.out.println(cstmt);
			cstmt.setString(1, userId);
			cstmt.setString(2, prodId);
			cstmt.setString(3, isLike);

			result = cstmt.executeUpdate();
			
			System.out.println(result);
			if (result == 1) {
				System.out.println("상품을 찜하였습니다.");
			} else {
				System.out.println("상품 찜하기 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			DBManager.close(conn, cstmt);
		}
		return result;
	}

	public int updateLike(String islike, String userId, String prodId) {
		int result = 0;
		String sql = "update like_t "
				+ "set is_liked = ?" +
				"where user_id= ? AND prod_id= ?";	     
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, islike);
			pstmt.setString(2, userId);
			pstmt.setString(3, prodId);

			result = pstmt.executeUpdate();

			if (result == 1) {
				System.out.println("찜하기 수정");
			} else {
				System.out.println("찜하기 수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}

	public LikeVO checkLikeUser(String userId, String prodId) throws SQLException{
		LikeVO like = null;
		String query = "select * from like_t b where user_id = ? AND prod_id = ?";
		System.out.println(query);
		ResultSet result = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, prodId);
			result = pstmt.executeQuery();

			if (result.next()) {
				like = new LikeVO();
				like.setIs_liked(result.getBoolean("is_liked"));
			}				
		} catch (Exception e) {
			e.printStackTrace();
		} 

		conn.close();

		return like;
	}

	public int checkLikeInfo(String userId, String prodId) throws SQLException{
		int count = 0; // 이미있으면 1 없으면 0
		
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("{call checkinfo_like_func(?, ?, ?)}");
			cstmt.setString(1, userId);
			cstmt.setString(2, prodId);
			cstmt.registerOutParameter(3, java.sql.Types.NUMERIC);
			
			cstmt.execute();
			
			count = cstmt.getInt(3);
			
			if (count == 1) {
				System.out.println("테이블에 정보가 존재합니다.");
			}
			else if (count == 0){
				System.out.println("테이블에 정보가 존재하지 않습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 

		 conn.close();

		return count;
	}
}