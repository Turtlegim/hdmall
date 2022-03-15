package com.hdmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	// 찜한 목록을 지우는 함수
	public int deleteLike(String userId) throws SQLException { // 회원 탈퇴 전 문의 내역 지우기
		int result = 0;

		try {
			conn = DBManager.getConnection();
			String query = "{call deleteLike_PROC(?, ?)}";
			cstmt = conn.prepareCall(query);
			cstmt.setString(1, userId);
			int res = 0;
			cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
			result = cstmt.executeUpdate();
			res = cstmt.getInt(2);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		if (result > 0) {
			System.out.println("찜한 목록 삭제 성공");
		} else { // 회원 탈퇴 실패
			System.out.println("찜한 목록 삭제 실패");
		}
		return result;
	}

	// 해당 유저가 찜한 목록이 존재하는지 확인하는 함수
	public int isExistLike(String userId) throws SQLException {
		int count = 0;
		ResultSet result = null;
		try {
			conn = DBManager.getConnection();
			String query = "{call isExistLike_PROC(?,?)}";
			cstmt = conn.prepareCall(query);
			cstmt.setString(1, userId);
			cstmt.registerOutParameter(2, java.sql.Types.NUMERIC);
			result = cstmt.executeQuery();
			if (result.next()) {
				count = result.getInt(1);
			}
			System.out.println("Total rows : " + count);

			if (count == 0) {
				System.out.println("해당 유저의 찜한 목록이 존재하지 않습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return count;

	}
	
	// 김민수
	public int insertLike(String userId, String prodId, String isLike) throws SQLException {
		String query = "insert into like_t (user_id, prod_id, is_liked) values (?, ?, ?)";
		System.out.println(query);
		int result = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, prodId);
			pstmt.setString(3, isLike);

			result = pstmt.executeUpdate();

			if (result == 1) {
				System.out.println("상품을 찜하였습니다.");
			} else {
				System.out.println("찜하기 수정실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 

		conn.close();

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
		int check = 0; // 이미있으면 1 없으면 0
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
				check = 1;
				System.out.println("테이블에 정보가 존재합니다.");
			}
			else {
				check = 0;
				System.out.println("테이블에 정보가 존재하지 않습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 

		conn.close();

		return check;
	}
}