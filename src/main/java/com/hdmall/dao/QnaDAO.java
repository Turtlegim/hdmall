package com.hdmall.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;

import com.hdmall.vo.ProductVO;
import com.hdmall.vo.QBoardVO;
import java.util.ArrayList;
import java.util.List;

public class QnaDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private QnaDAO() {
	}

	private static QnaDAO instance = new QnaDAO();

	public static QnaDAO getInstance() {
		return instance;
	}
	
	/* 문의사항 등록 */
	public int insertQna(String session_id, String context, String title) {

		String query = "insert into QBOARD_T"
					 + "(qboard_id,user_id,qboard_context,ins_dt,qboard_title)"
					 + "values(qprodId_seq.nextval,?,?,?,?)";

		int result = 0;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			java.util.Date utilDate = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			pstmt.setString(1, session_id);
			pstmt.setString(2, context);
			pstmt.setDate(3, sqlDate);
			pstmt.setString(4, title);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	/* my_page 자기가 문의한 list */
	public ArrayList<QBoardVO> listQBoard(String session_id,int page){
		 
		 ArrayList<QBoardVO> lists = new ArrayList<QBoardVO>();
		
		 int startNum = (page-1)*5+1;
		 int endNum = page*5;
		 System.out.println(startNum + "//" + endNum);
		 
		 String query ="SELECT * FROM ("
	                +      "SELECT ROWNUM AS row_num"
	                + ",pb.qboard_title"
	                + ",pb.qboard_context"
	                + ",pb.ins_dt"
	                + ",pb.ans_yn"
	                + ",pb.qboard_id"
	                + "FROM ("
	                +             "SELECT * FROM QBOARD_T"
					+			  "WHERE user_id = ?"
					+ 			   "ORDER BY ins_dt DESC"
	                +            ")pb"
	                +         "))WHERE row_num >= ? and row_num <= ?";
		 
		ResultSet rs = null;
		try{
			conn =  DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, session_id);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			rs = pstmt.executeQuery();
		while(rs.next()) {
				QBoardVO qnalist = new QBoardVO();
				qnalist.setTitle(rs.getString("title"));
				qnalist.setContext(rs.getString("context"));
				qnalist.setIns_dt(rs.getDate("ins_dt"));
				qnalist.setAns_yn(rs.getBoolean("ans_yn"));
				qnalist.setId(rs.getString("qboard_id"));
				lists.add(qnalist);
			}
		}catch(Exception e) {
			 e.printStackTrace();
		}finally {
			DBManager.close(conn,pstmt,rs);
		}
		return lists;	
	}		
	
	// 고객센터에 문의한 내역을 지우는 함수
	public int deleteQna(String userId) throws SQLException { // 회원 탈퇴 전 문의 내역 지우기 
    	conn = DBManager.getConnection();
		
		String query = "delete from qboard_t where user_id=?";
		System.out.println(query);

		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		
		int result = pstmt.executeUpdate();
		
        if (result == 1) {
        	System.out.println("문의 내역 삭제 성공");
        } else { // 회원 탈퇴 실패
        	System.out.println("문의 내역 삭제 실패");
        }
        
        DBManager.close(conn, pstmt);
        
		return result;
	}
	
	// 해당 유저가 문의한 내역이 존재하는지 확인하는 함수 
	public int isExistQna(String userId) throws SQLException {
    	conn = DBManager.getConnection();
		
		String query = "select count(*) from qboard_t where user_id=?";
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
        	System.out.println("해당 유저의 문의 내역이 존재하지 않습니다.");
        }
        
        DBManager.close(conn, pstmt);
        
		return count;
	}
}