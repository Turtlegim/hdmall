package com.hdmall.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.hdmall.vo.PBoardVO;
import com.hdmall.vo.ProductVO;

import util.DBManager;

public class PBoardDAO {	
	private PBoardDAO() { } // 싱글턴 패턴 처리
	private static PBoardDAO instance = new PBoardDAO();
	public static PBoardDAO getInstance() {
		return instance;
	}
	
	public ArrayList<ProductVO> listTophitsPBoard() {
	    ArrayList<ProductVO> productList = new ArrayList<>();
	    String sql = "select * from best_view";
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	    	  ProductVO product = new ProductVO();
	    	  product.setId(rs.getString("prod_id"));
		      product.setName(rs.getString("pbtitle"));
		      product.setCate_no(rs.getString("cate"));
		      product.setContext(rs.getString("pbtext"));
		      product.setImg(rs.getString("image"));
		      productList.add(product);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	    return productList;
	  }
	
	public ArrayList<ProductVO> listTophitsPBoard(String cateno) {
	    ArrayList<ProductVO> productList = new ArrayList<>();
	    String sql = "select * from best_view where cate = ?";
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, cateno);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	    	  ProductVO product = new ProductVO();
	    	  product.setId(rs.getString("prod_id"));
		      product.setName(rs.getString("pbtitle"));
		      product.setCate_no(rs.getString("cate"));
		      product.setContext(rs.getString("pbtext"));
		      product.setImg(rs.getString("image"));
		      productList.add(product);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	    return productList;
	}
}