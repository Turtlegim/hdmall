package com.hdmall.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBManager;
import com.hdmall.vo.QBoardVO;

public class QnaDAO { 
	private QnaDAO() {} 
	private static QnaDAO instance = new QnaDAO();
	public static QnaDAO getInstance() {
		return instance;
	}


public int insertQna(String session_id,String context,String title) { 
	System.out.println(session_id + " " + context + " " + title );
	String query = "insert into QBOARD_T"
			+  "(qboard_id,user_id,qboard_context,ins_dt,qboard_title)"
			+  "values(qprodId_seq.nextval,?,?,?,?)";
	System.out.println(query);
	Connection conn = null;
	PreparedStatement pstmt = null;

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
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		DBManager.close(conn,pstmt);
	}
	return result;
  }
}
