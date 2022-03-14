package com.hdmall.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.hdmall.vo.ProductVO;

import util.DBManager;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private ProductDAO() {  } // 싱글톤 패턴
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	} 	
	
	public ArrayList<ProductVO> listProductNew(String user_id) {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select *"
				+ " from (select a.prod_id, a.cate_no, a.prod_img, b.pboard_title, b.pboard_context "
				+ " from product_t a, pboard_t b"
				+ " where a.prod_id = b. prod_id) t1"
				+ " left outer join "
				+ " (select b.prod_id, is_liked"
				+ " from user_t a, pboard_t b, like_t c"
				+ " where a.user_id = c.user_id"
				+ "    AND b.prod_id = c.prod_id"
				+ "    AND a.user_id = ?) t2"
				+ " on t1.prod_id = t2.prod_id";

		ResultSet rs = null;
		try {
			conn =  DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setId(rs.getString("prod_id"));
				product.setImg(rs.getString("prod_img"));
				product.setName(rs.getString("pboard_title"));
				product.setContext(rs.getString("pboard_context"));
				product.setCate_no(rs.getString("is_liked"));
				productList.add(product);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;

	}

	public int getAllCount() {
		int count = 0;
		String sql = "SELECT count(*) FROM product_t a ,pboard_t b WHERE a.prod_id = b.prod_id";	    

		ResultSet rs = null;    	    
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}

	public ArrayList<ProductVO> listProductCategory(String cate_no) {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "SELECT * FROM product_t a ,pboard_t b WHERE a.prod_id = b.prod_id AND a.CATE_NO = ?";

		ResultSet rs = null;
		try {
			conn =  DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cate_no);
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
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;

	}

	public int getCategoryCount(String cate_no) {
		int count = 0;
		String sql = "SELECT count(*) FROM product_t a ,pboard_t b WHERE a.prod_id = b.prod_id AND a.CATE_NO = ?";	    

		ResultSet rs = null;    	    
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cate_no);
			rs = pstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}

	public ProductVO getProduct(String prod_id) {
		ProductVO product = null;
		String sql = "select * from product_t where prod_id=?";	 
		
		ResultSet rs = null;    	    
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_id);
			rs = pstmt.executeQuery();
			if (rs.next()) { 
				product = new ProductVO();
				product.setId(rs.getString("prod_id"));
				product.setCate_no(rs.getString("cate_no"));;
				product.setName(rs.getString("prod_nm"));
				product.setPrice(rs.getString("prod_price"));
				product.setImg(rs.getString("prod_img"));
				product.setContext(rs.getString("prod_context"));       
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return product;
	}

	public int getLikeCount(String prod_id) {
		int count = 0;
		String sql = "select count(a.prod_id) from product_t a, like_T b where a.prod_id = b.prod_id AND b.prod_id = ?";	    
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;    	    
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prod_id);
			rs = pstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return count;
	}
}