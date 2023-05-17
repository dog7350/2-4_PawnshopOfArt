package member;

import java.sql.*;
import java.util.*;

public class BoardMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://222.112.186.30:3306/jspart?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private final String USER = "admin";
	private final String PASS = "testadmin";
	
	public BoardMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	} //BoardMgr()
	
	public int insertBoard(BoardBean bod) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("INSERT INTO openboard(Title, Id, Time, Content, Notice) VALUES (?, ?, ?, ?, ?)");
			pstmt.setString(1, bod.getBoardTitle());
			pstmt.setString(2, bod.getBoardId());
			pstmt.setTimestamp(3, bod.getBoardDate());
			pstmt.setString(4, bod.getBoardContent());
			pstmt.setString(5, bod.getBoardNotice());
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	} //InsertBoard
	
	public List<BoardBean> listBoard(String Notice) {
		List<BoardBean> rbList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM openboard WHERE notice=? ORDER BY No DESC");
			pstmt.setString(1, Notice);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean rb = new BoardBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Content"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
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
	} //ListBoard
	
	public BoardBean searchBoard(int No) {
		BoardBean rb = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM openboard WHERE no=?");
			pstmt.setInt(1, No);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rb = new BoardBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Content"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
					);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return rb;
	} // SearchBoard
	
	public int updateBoard(int no, String title, Timestamp time, String content, String notice) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("UPDATE openboard SET title=?, time=?, content=?, notice=? WHERE no=?");
			pstmt.setString(1, title);
			pstmt.setTimestamp(2, time);
			pstmt.setString(3, content);
			pstmt.setString(4, notice);
			pstmt.setInt(5, no);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}//UpdateBoard 1
	
	public int updateBoard(int no, int inquiry, int report, Timestamp time) {
		int check = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("UPDATE openboard SET inquiry=?, report=?, time=? WHERE no=?");
			pstmt.setInt(1, inquiry);
			pstmt.setInt(2, report);
			pstmt.setTimestamp(3, time);
			pstmt.setInt(4, no);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}//UpdateBoard 2
	
	public int deleteBoard(int no) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("DELETE FROM openboard WHERE no=?");
			pstmt.setInt(1, no);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}//DeleteBoard
	
	public List<BoardBean> searchBoardList(String Notice, String searchOption, String searchText) {
		List<BoardBean> rbList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			if(searchOption == null) {
				pstmt = conn.prepareStatement("SELECT * FROM openboard WHERE notice=? ORDER BY No DESC");
				pstmt.setString(1, Notice);
			} else if(searchOption.equals("전체") || searchOption.equals("장르") || searchOption.equals("아티스트")) {
				pstmt = conn.prepareStatement("SELECT * FROM openboard WHERE notice=? AND title LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			} else if(searchOption.equals("작성자") || searchOption.equals("아이디")) {
				pstmt = conn.prepareStatement("SELECT * FROM openboard WHERE notice=? AND id LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			} else if(searchOption.equals("내용")) {
				pstmt = conn.prepareStatement("SELECT * FROM openboard WHERE notice=? AND content LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			} else if(searchOption.equals("제목")) {
				pstmt = conn.prepareStatement("SELECT * FROM openboard WHERE notice=? AND title LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean rb = new BoardBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Content"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
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
	} //SearchBoardList
	
	public List<BoardBean> adminInqRepBoard(String select) {
		List<BoardBean> rbList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			if(select.equals("조회")) {
				pstmt = conn.prepareStatement("SELECT * FROM openboard ORDER BY Inquiry DESC, id ASC");
			} else if(select.equals("신고")) {
				pstmt = conn.prepareStatement("SELECT * FROM openboard ORDER BY Report DESC, id ASC");
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean rb = new BoardBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Content"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
					);
				rbList.add(rb);
				if(rbList.size() >= 5) break;
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return rbList;
	} //SearchBoardList
}
