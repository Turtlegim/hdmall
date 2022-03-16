package com.hdmall.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;

import com.hdmall.vo.ProductVO;
import com.hdmall.vo.QBoardVO;

import oracle.jdbc.OracleTypes;

import java.util.ArrayList;

public class QnaDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;

	private QnaDAO() {
	} // 싱글턴패턴

	private static QnaDAO instance = new QnaDAO();

	public static QnaDAO getInstance() {
		return instance;
	}

	/* 배지현 : 문의사항 등록 */
	public int insertQna(String session_id, String context, String title) {
		int result = 0;
		try {
			conn = DBManager.getConnection();

			cstmt = conn.prepareCall("{call insert_Qna_PROC(?,?,?)}");
			System.out.println(cstmt);
			cstmt.setString(1, session_id);
			cstmt.setString(2, context);
			cstmt.setString(3, title);
			result = cstmt.executeUpdate();

			if (result == 1) {
				System.out.println("문의사항 등록 성공");
			} else {
				System.out.println("문의사항 등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return result;
	}

	/* 배지현 : 찜하기 총 count */
	public int getLikeProductCount(String session_id) {

		ResultSet rs = null;
		int count = 0;
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("select LikeCount_Qna_FUNC(?) from dual");
			cstmt.setString(1, session_id);
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

	/* 배지현 : 각 USER의 문의사항 list count */
	public int getAllProductCount_U(String session_id) {

		ResultSet rs = null;
		int count = 0;
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("select qboardCount_Qna_FUNC(?) from dual");
			cstmt.setString(1, session_id);
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

	/* 배지현 : 각 USER가 검색한 문의사항 list count */
	public int getAllProductCount_COMBO_U(String session_id, String col, String word) {

		int count = 0;
		ResultSet rs = null;
		System.out.println(session_id);
		try {
			conn = DBManager.getConnection();
			if (col.equals("all")) {
				cstmt = conn.prepareCall("select qboardCountComboU_all_Qna_func(?,?,?) from dual");
				cstmt.setString(1, session_id);
				cstmt.setString(2, word);
				cstmt.setString(3, word);

			} else if (col.equals("title")) {
				cstmt = conn.prepareCall("select qboardCountComboU_Title_Qna_func(?,?) from dual");
				cstmt.setString(1, session_id);
				cstmt.setString(2, word);

			} else {
				cstmt = conn.prepareCall("select qboardCount_Qna_FUNC(?) from dual");
				cstmt.setString(1, session_id);
			}
			rs = cstmt.executeQuery();

			if (rs.next() == true)
				count = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return count;
	}

	
	/* 배지현 : ADMIN이 답변 하지 않은 list 총 count */
	public int getAllProductCount_A() {

		int count = 0;
		String query = "SELECT count(*) FROM qBOARD_T where ans_yn = 0"; // 배지현 : "ans_yn = 0" 은 답변미완료.
		ResultSet rs = null;
		System.out.println(query);
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
			System.out.println("지금 ADMIN COUNT" + count);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}

	/* 배지현 : ADMIN의 검색한 문의사항 list count */
	public int getAllProductCount_COMBO_A(String col, String word) {

		int count = 0;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			if (col.equals("all")) {
				cstmt = conn.prepareCall("select qboardCountComboA_all_Qna_func(?,?) from dual");
				cstmt.setString(1, word);
				cstmt.setString(2, word);

			} else if (col.equals("title")) {
				cstmt = conn.prepareCall("select qboardCountComboA_all_Title_Qna_func(?) from dual");
				cstmt.setString(1, word);
			} else {
				cstmt = conn.prepareCall("select qboardCountComboA_Qna_else_func(?) from dual");
				cstmt.setInt(1, 0);
			}
			rs = cstmt.executeQuery();

			if (rs.next() == true)
				count = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return count;
	}

	/* 배지현 : USER_TYPE이 USER 일 때, 검색입력에 따른 문의한 list */
	public ArrayList<QBoardVO> qBoardlistType_U(String session_id, String col, String word) {
		System.out.println("session_id" + session_id);

		ArrayList<QBoardVO> productList = new ArrayList<QBoardVO>();
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			if (col.equals("all")) { /* 배지현 : 콤보박스 전체 의미 */
				String query = "{call QBOARD_USERLIST_ALL_QNA_PROC(?,?,?,?)}";
				cstmt = conn.prepareCall(query);
				cstmt.setString(1, session_id);
				cstmt.setString(2, word);
				cstmt.setString(3, word);
				cstmt.registerOutParameter(4, OracleTypes.CURSOR);
				cstmt.executeQuery();
				rs = (ResultSet) cstmt.getObject(4);

			} else if (col.equals("title")) { /* 배지현 : 콤보박스 제목 의미 */
				String query = "{call QBOARD_USERLIST_TITLE_QNA_PROC(?,?,?)}";
				cstmt = conn.prepareCall(query);
				cstmt.setString(1, session_id);
				cstmt.setString(2, word);
				cstmt.registerOutParameter(3, OracleTypes.CURSOR);
				cstmt.executeQuery();
				rs = (ResultSet) cstmt.getObject(3);

			} else {
				String query = "{call QBOARD_USERLIST_ELSE_QNA_PROC(?,?)}";
				cstmt = conn.prepareCall(query);
				cstmt.setString(1, session_id);
				cstmt.registerOutParameter(2, OracleTypes.CURSOR);
				cstmt.executeQuery();
				rs = (ResultSet) cstmt.getObject(2);
			}

			while (rs.next() == true) {
				QBoardVO list = new QBoardVO();
				list.setNum(rs.getInt("row_num"));
				list.setTitle(rs.getString("qboard_title"));
				list.setContext(rs.getString("qboard_context"));
				list.setIns_dt(rs.getDate("ins_dt"));
				list.setAns_yn(rs.getString("ans_yn"));
				list.setId(rs.getString("qboard_id"));
				productList.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return productList;

	}

	/* 배지현 : USER_TYPE이 ADMIN 일 때, 검색입력에 따른 문의한 list */
	public ArrayList<QBoardVO> qBoardListAll(String col, String word) {

		ArrayList<QBoardVO> productList = new ArrayList<QBoardVO>();
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			if (col.equals("all")) {
				String query = "{call QBOARD_ADMINLIST_ALL_QNA_PROC(?,?,?)}";
				cstmt = conn.prepareCall(query);
				cstmt.setString(1, word);
				cstmt.setString(2, word);
				cstmt.registerOutParameter(3, OracleTypes.CURSOR);
				cstmt.executeQuery();
				rs = (ResultSet) cstmt.getObject(3);

			} else if (col.equals("title")) {
				String query = "{call QBOARD_ADMINLIST_TITLE_QNA_PROC(?,?)}";
				cstmt = conn.prepareCall(query);
				cstmt.setString(1, word);
				cstmt.registerOutParameter(2, OracleTypes.CURSOR);
				cstmt.executeQuery();
				rs = (ResultSet) cstmt.getObject(2);
			} else {
				String query = "{call QBOARD_ADMINLIST_ELSE_QNA_PROC(?)}";
				cstmt = conn.prepareCall(query);
				cstmt.registerOutParameter(1, OracleTypes.CURSOR);
				cstmt.executeQuery();
				rs = (ResultSet) cstmt.getObject(1);
			}
			while (rs.next() == true) {
				QBoardVO list = new QBoardVO();
				list.setNum(rs.getInt("row_num"));
				list.setTitle(rs.getString("qboard_title"));
				list.setContext(rs.getString("qboard_context"));
				list.setIns_dt(rs.getDate("ins_dt"));
				list.setAns_yn(rs.getString("ans_yn"));
				list.setId(rs.getString("qboard_id"));
				productList.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return productList;
	}

	/* 경민영 : 회원 탈퇴 전 문의 내역 지우기 */
	public int deleteQna(String userId) throws SQLException {
		int count = 0;

		try {
			conn = DBManager.getConnection();
			String query = "{call delete_qna_proc(?, ?)}";
			cstmt = conn.prepareCall(query);
			cstmt.setString(1, userId);
			cstmt.registerOutParameter(2, java.sql.Types.NUMERIC);
			ResultSet result = cstmt.executeQuery();

			if (result.next()) {
				count = result.getInt(2);
			}

			System.out.println("Total rows : " + count);

			if (count == 0) {
				System.out.println("해당 유저의 문의 목록이 존재하지 않습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}

		return count;
	}

	/* 경민영 : 해당 유저가 문의한 내역이 존재하는지 확인하는 함수 */
	public int isExistQna(String userId) throws SQLException {
		int count = 0;
		try {
			conn = DBManager.getConnection();
			String query = "{? = call isexist_qna_func(?)}";
			cstmt = conn.prepareCall(query);
			cstmt.registerOutParameter(1, java.sql.Types.NUMERIC);
			cstmt.setString(2, userId);
			cstmt.executeQuery();
			count = cstmt.getInt(1);
			System.out.println("Total rows : " + count);

			if (count == 0) {
				System.out.println("해당 유저의 문의 내역이 존재하지 않습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}

		return count;
	}

	/* 배지현 : qboard_id에 해당하는 문의사항 호출함수 */
	public QBoardVO getQboardDetail(String qprod_id) {
		QBoardVO qboard = null;
		String query = "select * from QBOARD_T where qboard_id = ?";
		System.out.println(query);
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, qprod_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				qboard = new QBoardVO();
				qboard.setId(rs.getString("qboard_id"));
				qboard.setTitle(rs.getString("qboard_title"));
				;
				qboard.setIns_dt(rs.getDate("ins_dt"));
				qboard.setContext(rs.getString("qboard_context"));
				qboard.setAns_title(rs.getString("ans_title"));
				qboard.setAns_ins_dt(rs.getDate("ans_ins_dt"));
				qboard.setDetail(rs.getString("ans_detail"));
				qboard.setAns_yn(rs.getString("ans_yn"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return qboard;
	}

	/* 배지현 : 답변 등록 */
	public int UpdateAns(int qboard_id, String context, String title) {
		int result = 0;
		System.out.println(qboard_id);
		System.out.println(context);
		System.out.println(title);
		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall("{call UPDATE_ANS_PROC(?,?,?,?)}");
			cstmt.setInt(1, qboard_id);
			cstmt.setString(2, context);
			cstmt.setString(3, title);
			cstmt.setInt(4, 1);
			result = cstmt.executeUpdate();
			System.out.println(result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
		return result;
	}
}
