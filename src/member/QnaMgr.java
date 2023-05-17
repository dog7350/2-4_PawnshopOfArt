package member;

import java.sql.*;
import java.util.*;

public class QnaMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://222.112.186.30:3306/jspart?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private final String USER = "admin";
	private final String PASS = "testadmin";
	
	public QnaMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	} //QnaMgr()
	
	public int insertQna(String id, String title, String content) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("INSERT INTO qna(id, title, content) VALUES (?, ?, ?)");
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	} //InsertQna
	
	public int answerQna(int b_no, String id, String title, String content) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("INSERT INTO qna(B_No, id, title, content) VALUES (?, ?, ?, ?)");
			pstmt.setInt(1, b_no);
			pstmt.setString(2, id);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	} //AnswerQna
	
	public List<QnaBean> listQna() {
		List<QnaBean> qaList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM qna WHERE Title IS NOT NULL ORDER BY B_No ASC");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaBean qa = new QnaBean(
						rs.getInt("B_No"),
						rs.getString("Id"),
						rs.getString("Title"),
						rs.getTimestamp("Time"),
						rs.getString("Content")
					);
				qaList.add(qa);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return qaList;
	} //ListQna
	
	public List<QnaBean> listQna(int b_no) {
		List<QnaBean> qaList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM qna WHERE B_no=? ORDER BY Time DESC");
			pstmt.setInt(1, b_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaBean qa = new QnaBean(
						rs.getInt("B_No"),
						rs.getString("Id"),
						rs.getString("Title"),
						rs.getTimestamp("Time"),
						rs.getString("Content")
					);
				qaList.add(qa);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return qaList;
	} //ListQna
	
	public QnaBean searchQna(int b_no) {
		QnaBean qa = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM qna WHERE B_no=? ORDER BY Time ASC");
			pstmt.setInt(1, b_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qa = new QnaBean(
						rs.getInt("B_No"),
						rs.getString("Id"),
						rs.getString("Title"),
						rs.getTimestamp("Time"),
						rs.getString("Content")
					);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return qa;
	} //SearchQna
	
	public int deleteQna(int b_no) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("DELETE FROM qna WHERE B_No=?");
			pstmt.setInt(1, b_no);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}//DeleteQna

}
