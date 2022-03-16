package com.hdmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hdmall.vo.LikeVO;
import com.hdmall.vo.ProductVO;

import oracle.jdbc.internal.OracleTypes;
import util.DBManager;

public class LikeDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private LikeDAO() {
	} // 싱글턴 패턴 처리

	private static LikeDAO instance = new LikeDAO();

	public static LikeDAO getInstance() {
		return instance;
	}
	
	// Like Table 전체를 커서로 받아오는 함수.
	public ArrayList<LikeVO> listLike() {
		ArrayList<LikeVO> likelist = new ArrayList<>();
		String sql = "{call listLike_PROC(?)}";

		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(1);
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
			DBManager.close(conn, cstmt, rs);
		}
		return likelist;
	}
	
	// 특정 User의 Like Table을 질의하는 함수.
	public ArrayList<LikeVO> listLikeTable(String userid) {
		ArrayList<LikeVO> likelist = new ArrayList<>();
		String sql = "{call listLikeTable_PROC(?,?)}";
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, userid);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(2);
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
			DBManager.close(conn, cstmt, rs);
		}
		return likelist;
	}
	
	// 특정 User가 Like 한 상품들의 정보를 불러오는 함수.
	public ArrayList<ProductVO> listisLiked(String userid) {
		ArrayList<ProductVO> productList = new ArrayList<>();
		String sql = "select * " + "from ( " + "	  select * " + "	  from pb_p_id_view " + "	 ) t1 "
				+ "left outer join " + "	( " + "	 select b.prod_id " + "	 		,c.is_liked "
				+ "	 from   user_t    a " + "	        ,pboard_t b " + "	        ,like_t   c "
				+ "	 where  a.user_id = c.user_id " + "	 	and b.prod_id = c.prod_id " + "	 	and a.user_id = ? "
				+ "	) t2 " + "on t1.prod_id = t2.prod_id " + "WHERE t2.is_liked = 1";
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
	
	// 특정 User의 특정 prod에 대한 Like를 취소하는 함수. (delete하지 않음.)
	public void cancelLike(String userid, String prodid) {
		CallableStatement cstmt = null;
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("{call cancelLike_PROC(?,?,?)}");
			cstmt.setString(1, userid);
			cstmt.setString(2, prodid);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.executeUpdate();
			String msg = cstmt.getString(3);

			System.out.println(msg);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
	}
	
	// 김민수 
	public int insertLike(String userId, String prodId, String isLike) throws SQLException {
		int result = 0;
		
		try {
			conn = DBManager.getConnection();
			
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
	     
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("{call update_like_proc(?, ?, ?)}");

			cstmt.setString(1, islike);
			cstmt.setString(2, userId);
			cstmt.setString(3, prodId);

			result = cstmt.executeUpdate();

			if (result == 1) {
				System.out.println("찜하기 수정");
			} else {
				System.out.println("찜하기 수정실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return result;
	}
	
	public int checkLikeUser(String userId, String prodId) throws SQLException{
//		LikeVO like = null;
		ResultSet result = null;
		int islike = 0;

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("select checkuser_like_func(?, ?) from dual");
			cstmt.setString(1, userId);
			cstmt.setString(2, prodId);
		
			result = cstmt.executeQuery();
			
			if (result.next()) {
				islike = result.getInt(1);
//				like = new LikeVO();
//				like.setIs_liked(result.getBoolean("is_liked"));
			}		
			System.out.println(islike);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		conn.close();

		return islike;
	}

	public int checkLikeInfo(String userId, String prodId) throws SQLException{
		int count = 0; // 이미있으면 1 없으면 0
		
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("{call checkinfo_like_proc(?, ?, ?)}");
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
	
	public HashMap<String, Integer> prodLikeInfo() {
		HashMap<String, Integer> list = new HashMap<>();
		String sql = "{call prodLikeInfo_PROC(?)}";
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			rs = (ResultSet) cstmt.getObject(1);
			while (rs.next()) {
				list.put(rs.getString("prod_name"), rs.getInt("prod_cnt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return (list);
	}
	
}