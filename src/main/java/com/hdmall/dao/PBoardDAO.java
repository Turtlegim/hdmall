package com.hdmall.dao;

import java.sql.CallableStatement;
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

import oracle.jdbc.internal.OracleCallableStatement;
import oracle.jdbc.internal.OracleTypes;
import util.DBManager;

// 김기범 : pboardDAO
public class PBoardDAO {
	private CallableStatement cstmt = null;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private OracleCallableStatement ocstmt = null;

	private PBoardDAO() {
	} // 싱글턴 패턴 처리

	private static PBoardDAO instance = new PBoardDAO();

	public static PBoardDAO getInstance() {
		return instance;
	}

	// Hit 상위 7개의 상품 목록을 가져오는 함수.
	public ArrayList<ProductVO> listTophitsPBoard() {
		ArrayList<ProductVO> productList = new ArrayList<>();
		String sql = "{call BEST_PACK.listTophitsPBoard_PROC(?)}"; // 패키지 내부에서 프로시저 오버로딩(입력값 없음)
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(1);
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
			DBManager.close(conn, cstmt, rs);
		}
		return productList;
	}

	// 카테고리별 Hit 상위 7개의 상품 목록을 가져오는 함수.
	public ArrayList<ProductVO> listTophitsPBoard(String cateno) {
		ArrayList<ProductVO> productList = new ArrayList<>();
		String sql = "{call BEST_PACK.listTophitsPBoard_PROC(?, ?)}"; // 패키지 내부에서 프로시저 오버로딩(입력 하나)
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(sql);
			cstmt.setString(1, cateno);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			rs = (ResultSet) cstmt.getObject(2);
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
			DBManager.close(conn, cstmt, rs);
		}
		return productList;
	}
}