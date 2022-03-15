package com.hdmall.dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.hdmall.vo.ProductVO;

import oracle.jdbc.OracleTypes;
import util.DBManager;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	
	private ProductDAO() {  } // 싱글톤 패턴
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	} 	
	
	public ArrayList<ProductVO> listProductNew(String user_id) {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "{call listProductNew_PROC(?, ?)}";
		try {
			conn =  DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, user_id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setId(rs.getString("prod_id"));
				product.setImg(rs.getString("prod_img"));
				product.setName(rs.getString("pboard_title"));
				product.setContext(rs.getString("pboard_context"));
				product.setPrice(rs.getString("is_liked"));
				productList.add(product);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return productList;
	}

	public int getNewCount() {
		int count = 0;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("select newcount_product_func() from dual");
			rs = cstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return count;
	}

	public ArrayList<ProductVO> listProductCategory(String cate_no, String user_id) {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select *"
				+ " from (select a.prod_id, a.cate_no, a.prod_img, b.pboard_title, b.pboard_context "
				+ " from product_t a, pboard_t b"
				+ " where a.prod_id = b. prod_id"
				+ "    AND a.cate_no = ?) t1"
				+ " left outer join "
				+ " (select b.prod_id, is_liked"
				+ " from user_t a, pboard_t b, like_t c"
				+ " where a.user_id = c.user_id"
				+ "    AND b.prod_id = c.prod_id"
				+ "    AND a.user_id = ?) t2"
				+ " on t1.prod_id = t2.prod_id";
		System.out.println(sql);
		ResultSet rs = null;
		try {
			conn =  DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cate_no);
			pstmt.setString(2, user_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setId(rs.getString("prod_id"));
				product.setImg(rs.getString("prod_img"));
				product.setCate_no(rs.getString("cate_no"));
				product.setName(rs.getString("pboard_title"));
				product.setContext(rs.getString("pboard_context"));
				product.setPrice(rs.getString("is_liked"));
						
				productList.add(product);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;

	}
	

	public int getCategoryCount(String cate_no) {
		int count = 0;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("select catecount_product_func(?) from dual");
			cstmt.setString(1, cate_no);
			rs = cstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return count;
	}

	public ProductVO getProduct(String prod_id) {
		ProductVO product = null;
		
		ResultSet rs = null;    	    
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("{call get_product_proc(?, ?, ?, ?)}");
			cstmt.setString(1, prod_id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(4, java.sql.Types.NUMERIC);

			cstmt.executeQuery();
			rs = (ResultSet)cstmt.getObject(2);
			
			while (rs.next()) { 
				product = new ProductVO();
				product.setId(rs.getString("prod_id"));
				product.setCate_no(rs.getString("cate_no"));;
				product.setName(rs.getString("prod_nm"));
				product.setPrice(rs.getString("prod_price"));
				product.setImg(rs.getString("prod_img"));
				product.setContext(rs.getString("prod_context"));
			}
			countUpdate(cstmt.getString(3), cstmt.getInt(4) + 1); // 조회수 업데이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return product;
	}
	
	// 조회수 업데이트 해주는 함수
	public int countUpdate(String pboardId, int currhit) {
		String sql = "{call countUpdate_PROC(?, ?)}";
		int updatedRowCount = 0;
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, pboardId);
			cstmt.setInt(2, currhit);
			updatedRowCount = cstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return updatedRowCount;
	}

	public int getLikeCount(String prod_id) {
		int count = 0;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("select likecount_product_func(?) from dual");
			cstmt.setString(1, prod_id);
			rs = cstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return count;
	}
}