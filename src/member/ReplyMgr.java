package member;

import java.sql.*;
import java.util.*;

public class ReplyMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://222.112.186.30:3306/jspart?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private final String USER = "admin";
	private final String PASS = "testadmin";
	
	public ReplyMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	} //ReplyMgr()
	
	public int insertReply(ReplyBean rep) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("INSERT INTO reply(B_No, Id, Content) VALUES (?, ?, ?)");
			pstmt.setInt(1, rep.getBoardNo());
			pstmt.setString(2, rep.getReplyId());
			pstmt.setString(3, rep.getReplyContent());
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	} //InsertReply
	
	public List<ReplyBean> listReply(int b_no) {
		List<ReplyBean> rbList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM reply WHERE B_No=? ORDER BY R_No ASC");
			pstmt.setInt(1, b_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyBean rb = new ReplyBean(
						rs.getInt("B_No"),
						rs.getInt("R_No"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Content"),
						rs.getInt("Report")
					);
				rbList.add(rb);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return rbList;
	} //ListReply
	
	public ReplyBean selectReply(int b_no, int r_no) {
		ReplyBean rep = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM reply WHERE B_No=? AND R_No=?");
			pstmt.setInt(1, b_no);
			pstmt.setInt(2, r_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rep = new ReplyBean(
							rs.getInt("B_No"),
							rs.getInt("R_No"),
							rs.getString("Id"),
							rs.getTimestamp("Time"),
							rs.getString("Content"),
							rs.getInt("Report")
						);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return rep;
	} //SearchReply
	
	public int deleteReply(int b_no, int r_no) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("DELETE FROM reply WHERE B_No=? AND R_No=?");
			pstmt.setInt(1, b_no);
			pstmt.setInt(2, r_no);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}//DeleteReply
	
	public int updateReply(int b_no, int r_no, Timestamp time, String content) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("UPDATE reply SET time=?, content=? WHERE b_no=? AND r_no=?");
			pstmt.setTimestamp(1, time);
			pstmt.setString(2, content);
			pstmt.setInt(3, b_no);
			pstmt.setInt(4, r_no);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}//UpdateReply
	
	public int reportReply(int b_no, int r_no, Timestamp time, int report) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("UPDATE reply SET time=?, report=? WHERE b_no=? AND r_no=?");
			pstmt.setTimestamp(1, time);
			pstmt.setInt(2, report);
			pstmt.setInt(3, b_no);
			pstmt.setInt(4, r_no);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}//UpdateReply
	
	public List<ReplyBean> searchReplyList(String searchOption, String searchText) {
		List<ReplyBean> rpList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			if(searchOption == null) {
				pstmt = conn.prepareStatement("SELECT * FROM reply ORDER BY id DESC");
			} else if(searchOption.equals("아이디")) {
				pstmt = conn.prepareStatement("SELECT * FROM reply WHERE id LIKE ? ORDER BY id DESC");
				pstmt.setString(1, searchText);
			} else if(searchOption.equals("내용")) {
				pstmt = conn.prepareStatement("SELECT * FROM reply WHERE content LIKE ? ORDER BY id DESC");
				pstmt.setString(1, searchText);
			} else if(searchOption.equals("제목")) {
				pstmt = conn.prepareStatement("SELECT * FROM reply WHERE title LIKE ? ORDER BY id DESC");
				pstmt.setString(1, searchText);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyBean rp = new ReplyBean(
						rs.getInt("B_No"),
						rs.getInt("R_No"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Content"),
						rs.getInt("Report")
					);
				rpList.add(rp);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return rpList;
	} //SearchReplyList
}
