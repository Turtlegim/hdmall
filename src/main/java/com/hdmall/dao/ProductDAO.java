package com.hdmall.dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hdmall.vo.ProductVO;

import oracle.jdbc.OracleTypes;
import util.DBManager;

public class ProductDAO {
	private Connection conn;
	private CallableStatement cstmt;
	
	private ProductDAO() {  } // 싱글톤 패턴
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	} 	
	
	// 김민수 : 신상품 카테고리에 포함된 상품 리스트 
	public ArrayList<ProductVO> listProductNew(String user_id) throws SQLException {
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
				product.setIslike(rs.getString("is_liked"));
				productList.add(product);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return productList;
	}
	
	// 김민수 : 신상품 카테고리에 포함된 상품 총 갯수 count
	public int getNewCount() throws SQLException {
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
	
	// 김민수 : 여성/남성캐쥬얼 카테고리에 포함된 상품 리스트 
	public ArrayList<ProductVO> listProductCategory(String cate_no, String user_id) throws SQLException {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "{call listProductCategory_PROC(?, ?, ?)}";
		ResultSet rs = null;
		try {
			conn =  DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, cate_no);
			cstmt.setString(2, user_id);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet)cstmt.getObject(3);

			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setId(rs.getString("prod_id"));
				product.setImg(rs.getString("prod_img"));
				product.setCate_no(rs.getString("cate_no"));
				product.setName(rs.getString("pboard_title"));
				product.setContext(rs.getString("pboard_context"));
				product.setIslike(rs.getString("is_liked"));		
				productList.add(product);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return productList;

	}
	
	// 김민수 : 여성/남성캐쥬얼 카테고리에 포함된 상품의 총 갯수 count
	public int getCategoryCount(String cate_no) throws SQLException {
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
	
	// 김민수 : 상품 상세페이지에서 나타나는 상품 정보
	public ProductVO getProduct(String prod_id) throws SQLException {
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
			
			int hitcount = cstmt.getInt(4) + 1;
			
			while (rs.next()) { 
				product = new ProductVO();
				product.setId(rs.getString("prod_id"));
				product.setCate_no(rs.getString("cate_no"));;
				product.setName(rs.getString("prod_nm"));
				product.setPrice(rs.getString("prod_price"));
				product.setImg(rs.getString("prod_img"));
				product.setContext(rs.getString("prod_context"));
				product.setHitnum(hitcount);
				}
			countUpdate(cstmt.getString(3), hitcount); // 조회수 업데이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return product;
	}
	
	// 조회수 업데이트 해주는 함수
	public int countUpdate(String pboardId, int currhit) throws SQLException{
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
	
	// 김민수 : 상품 상세페이지에서 해당 상품의 총 찜하기 갯수 count
	public int getLikeCount(String prod_id) throws SQLException {
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