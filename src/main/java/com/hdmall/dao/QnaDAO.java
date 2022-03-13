package com.hdmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;

import com.hdmall.vo.QBoardVO;
import java.util.ArrayList;

public class QnaDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private QnaDAO() {} //싱글턴패턴
	
	private static QnaDAO instance = new QnaDAO();
	public static QnaDAO getInstance() {
		return instance;
	}
	
	/* 문의사항 등록 지현 */
	
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
	

	/* USER 자신이 문의한 list count -지현*/
	public int getAllProductCount_U(String session_id){
		int count = 0;
		String query = "SELECT count(*) FROM qBOARD_T where user_id = ?";
		ResultSet rs = null;
		System.out.println(query);
		System.out.println(session_id);
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, session_id);
			rs =pstmt.executeQuery();
			if(rs.next())
			count = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn,pstmt,rs);
		}
		return count;
	}
	
	/*USER 게시글 입력 값에 따라 count -지현*/
		
	public int getAllProductCount_COMBO_U(String session_id, String col, String word){
		
		int count = 0;
		ResultSet rs = null;
		
		try {
				conn = DBManager.getConnection();
				StringBuffer query= new StringBuffer();
			
			if(col.equals("all")) {
				query.append("SELECT count(*) FROM qBOARD_T");
				query.append(" WHERE user_id = ?");
				query.append(" AND qboard_title LIKE ? OR qboard_context LIKE ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, session_id);
				pstmt.setString(2, "%" +word + "%");
				pstmt.setString(3, "%" +word + "%");
				
			}else if(col.equals("title")){
				query.append("SELECT count(*) FROM qBOARD_T");
				query.append(" WHERE user_id = ?");
				query.append(" AND qboard_title LIKE ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, session_id);
				pstmt.setString(2, "%" +word + "%");
				
			}else{
				query.append("SELECT count(*) FROM qBOARD_T");
				query.append(" WHERE user_id = ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, session_id);
			}	
			rs = pstmt.executeQuery();
			
			if(rs.next() == true)
				count = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn,pstmt,rs);
		}
		return count;
	}

	/* ADMIN 답변 되지 않은 총 list count- 지현*/
	public int getAllProductCount_A(){
		
		int count = 0;
		String query = "SELECT count(*) FROM qBOARD_T"; //ans_yn 부분 n 인것만 가져오는것 다음에 처리 
		ResultSet rs = null;
		System.out.println(query);
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			rs =pstmt.executeQuery();
			if(rs.next())
			count = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn,pstmt,rs);
		}
		return count;
	}
	
	/*ADMIN 게시글 입력 값에 따라 count - 지현*/
	
	public int getAllProductCount_COMBO_A(String col, String word){
		
		int count = 0;
		ResultSet rs = null;
		
		try {
				conn = DBManager.getConnection();
				StringBuffer query= new StringBuffer();
			
			if(col.equals("all")) {
				query.append("SELECT count(*) FROM qBOARD_T");
				query.append(" WHERE qboard_title LIKE ? OR qboard_context LIKE ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, "%" +word + "%");
				pstmt.setString(2, "%" +word + "%");

			}else if(col.equals("title")){
				query.append("SELECT count(*) FROM qBOARD_T");
				query.append(" WHERE qboard_title LIKE ?");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, "%" +word + "%");
				
			}else{
				query.append("SELECT count(*) FROM qBOARD_T");
				System.out.println(query); 
				pstmt = conn.prepareStatement(query.toString());
			}	
			rs = pstmt.executeQuery();
			
			if(rs.next() == true)
				count = rs.getInt(1);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn,pstmt,rs);
		}
		return count;
	}
	
	/*USER_TYPE = USER 일시 자신이 문의한 list - 지현*/
	public ArrayList<QBoardVO> qBoardlistType_U(String session_id,String col, String word){
		
		ArrayList<QBoardVO> productList = new ArrayList<QBoardVO>();
		
		System.out.println("session_id" + session_id);

		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			StringBuffer query= new StringBuffer();
			
			if(col.equals("all")) {
				query.append("SELECT * FROM (");
				query.append(" SELECT ROWNUM AS row_num");
				query.append(",pb.qboard_title");
				query.append(",pb.qboard_context");
				query.append(",pb.ins_dt");
				query.append(",DECODE(pb.ans_yn, '0', '미완료', '1' ,'완료') AS ans_yn");
				query.append(",pb.qboard_id");
				query.append(" FROM (");
				query.append(" SELECT * FROM QBOARD_T");
				query.append(" WHERE user_id = ?");
				query.append(" AND qboard_title LIKE ? OR qboard_context LIKE ?");
				query.append(" ORDER BY ins_dt DESC");
				query.append(") pb)");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1,session_id);
				pstmt.setString(2, "%" +word + "%");
				pstmt.setString(3, "%" +word + "%");
				System.out.println(query); 
				
			}else if(col.equals("title")){
				query.append("SELECT * FROM (");
				query.append(" SELECT ROWNUM AS row_num");
				query.append(",pb.qboard_title");
				query.append(",pb.qboard_context");
				query.append(",pb.ins_dt");
				query.append(",DECODE(pb.ans_yn, '0', '미완료', '1' ,'완료') AS ans_yn");
				query.append(",pb.qboard_id");
				query.append(" FROM (");
				query.append(" SELECT * FROM QBOARD_T");
				query.append(" WHERE user_id = ?");
				query.append(" AND qboard_title LIKE ?");
				query.append(" ORDER BY ins_dt DESC");
				query.append(") pb)");
				System.out.println(query); 
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1,session_id);
				pstmt.setString(2, "%" +word + "%");
				
			}else{
				query.append("SELECT * FROM (");
				query.append(" SELECT ROWNUM AS row_num");
				query.append(",pb.qboard_title");
				query.append(",pb.qboard_context");
				query.append(",pb.ins_dt");
				query.append(",DECODE(pb.ans_yn, '0', '미완료', '1' ,'완료') AS ans_yn");
				query.append(",pb.qboard_id");
				query.append(" FROM (");
				query.append(" SELECT * FROM QBOARD_T");
				query.append(" WHERE user_id = ?");
				query.append(" ORDER BY ins_dt DESC");
				query.append(") pb)");
				System.out.println(query); 
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1,session_id);
				
			}	
			rs = pstmt.executeQuery();

			while(rs.next() == true) {
					
					QBoardVO list = new QBoardVO();
					list.setNum(rs.getInt("row_num"));
					list.setTitle(rs.getString("qboard_title"));
					list.setContext(rs.getString("qboard_context"));
					list.setIns_dt(rs.getDate("ins_dt"));
					list.setAns_yn(rs.getString("ans_yn"));
					list.setId(rs.getString("qboard_id"));
					productList.add(list);
				}
			
			}catch(Exception e) {
				 e.printStackTrace();
			}finally {
				DBManager.close(conn,pstmt,rs);
			}
			return productList;	
			
	}

	/*USER_TYPE = ADMIN 일시 전체 list - 지현 */
	public ArrayList<QBoardVO> qBoardListAll(String col, String word){
		ArrayList<QBoardVO> productList = new ArrayList<QBoardVO>(); 

		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			StringBuffer query= new StringBuffer();
			
			if(col.equals("all")) {
				query.append("SELECT * FROM (");
				query.append(" SELECT ROWNUM AS row_num");
				query.append(",pb.qboard_title");
				query.append(",pb.qboard_context");
				query.append(",pb.ins_dt");
				query.append(",DECODE(pb.ans_yn, '0', '미완료', '1' ,'완료') AS ans_yn");
				query.append(",pb.qboard_id");
				query.append(" FROM (");
				query.append(" SELECT * FROM QBOARD_T");
				query.append(" WHERE qboard_title LIKE ? OR qboard_context LIKE ?");
				query.append(" ORDER BY ins_dt DESC");
				query.append(") pb)");
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, "%" +word + "%");
				pstmt.setString(2, "%" +word + "%");
				System.out.println(query); 
				
			}else if(col.equals("title")){
				query.append("SELECT * FROM (");
				query.append(" SELECT ROWNUM AS row_num");
				query.append(",pb.qboard_title");
				query.append(",pb.qboard_context");
				query.append(",pb.ins_dt");
				query.append(",DECODE(pb.ans_yn, '0', '미완료', '1' ,'완료') AS ans_yn");
				query.append(",pb.qboard_id");
				query.append(" FROM (");
				query.append(" SELECT * FROM QBOARD_T");
				query.append(" WHERE qboard_title LIKE ?");
				query.append(" ORDER BY ins_dt DESC");
				query.append(") pb)");
				System.out.println(query); 
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, "%" +word + "%");
				
			}else{
				query.append("SELECT * FROM (");
				query.append(" SELECT ROWNUM AS row_num");
				query.append(",pb.qboard_title");
				query.append(",pb.qboard_context");
				query.append(",pb.ins_dt");
				query.append(",DECODE(pb.ans_yn, '0', '미완료', '1' ,'완료') AS ans_yn");
				query.append(",pb.qboard_id");
				query.append(" FROM (");
				query.append(" SELECT * FROM QBOARD_T");
				query.append(" ORDER BY ins_dt DESC");
				query.append(") pb)");
				System.out.println(query); 
				pstmt = conn.prepareStatement(query.toString());
				
			}	
			rs = pstmt.executeQuery();

			while(rs.next() == true) {
					
					QBoardVO list = new QBoardVO();
					list.setNum(rs.getInt("row_num"));
					list.setTitle(rs.getString("qboard_title"));
					list.setContext(rs.getString("qboard_context"));
					list.setIns_dt(rs.getDate("ins_dt"));
					list.setAns_yn(rs.getString("ans_yn"));
					list.setId(rs.getString("qboard_id")); 
					productList.add(list);
					
			}
			
			
			}catch(Exception e) {
				 e.printStackTrace();
			}finally {
				DBManager.close(conn,pstmt,rs);
			}
			return productList;	
	}
	
	 /*회원 탈퇴 전 문의 내역 지우기 - 민영 03/14*/
	public int deleteQna(String userId) throws SQLException {

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
	

	/*해당 유저가 문의한 내역이 존재하는지 확인하는 함수 - 민영 03/14*/
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