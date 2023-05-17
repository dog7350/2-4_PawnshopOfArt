package member;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public class AlbumMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://222.112.186.30:3306/jspart?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private final String USER = "admin";
	private final String PASS = "testadmin";
	
	public AlbumMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	} //AlbumMgr()
	
	public int insertAlbum(String id, String title, String genre, String artist, String content, String img, String music, String price, String notice) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("INSERT INTO albumboard(title, id, genre, artist, content, img, music, price, notice) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			pstmt.setString(3, genre);
			pstmt.setString(4, artist);
			pstmt.setString(5, content);
			pstmt.setString(6, img);
			pstmt.setString(7, music);
			pstmt.setString(9, notice);
			
			if(price == null) {
				pstmt.setInt(8, 0);
			} else {
				int p = Integer.parseInt(price);
				pstmt.setInt(8, p);
			}
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	} //InsertAlbum
	
	public List<AlbumBean> listAlbum(String Notice, String genre) {
		List<AlbumBean> abList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			if(genre.equals("None")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? ORDER BY No DESC");
				pstmt.setString(1, Notice);
			} else {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? AND genre=? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, genre);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AlbumBean ab = new AlbumBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Genre"),
						rs.getString("Artist"),
						rs.getString("Content"),
						rs.getString("Img"),
						rs.getString("Music"),
						rs.getInt("Price"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
					);
				abList.add(ab);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return abList;
	} //ListAlbum
	
	public AlbumBean searchAlbum(int No) {
		AlbumBean ab = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE no=?");
			pstmt.setInt(1, No);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ab = new AlbumBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Genre"),
						rs.getString("Artist"),
						rs.getString("Content"),
						rs.getString("Img"),
						rs.getString("Music"),
						rs.getInt("Price"),
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
		
		return ab;
	} // SearchAlbum
	
	public int updateAlbum(String id, String title, String genre, String artist, String content, String img, String music, String price, String notice, int no) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("UPDATE albumboard SET title=?, id=?, genre=?, artist=?, content=?, img=?, music=?, price=?, notice=? WHERE no=?");
			pstmt.setString(1, title);
			pstmt.setString(2, id);
			pstmt.setString(3, genre);
			pstmt.setString(4, artist);
			pstmt.setString(5, content);
			pstmt.setString(6, img);
			pstmt.setString(7, music);
			pstmt.setString(9, notice);
			pstmt.setInt(10, no);
			
			if(price == null) {
				pstmt.setInt(8, 0);
			} else {
				int p = Integer.parseInt(price);
				pstmt.setInt(8, p);
			}
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	} //UpdateAlbum
	
	public int updateAlbum(int no, int inquiry, int report, Timestamp time) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("UPDATE albumboard SET time=?, inquiry=?, report=? WHERE no=?");
			pstmt.setTimestamp(1, time);
			pstmt.setInt(2, inquiry);
			pstmt.setInt(3, report);
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
	} //UpdateAlbum
	
	public int deleteAlbum(int no) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("DELETE FROM albumboard WHERE no=?");
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
	}//DeleteAlbum
	
	public List<AlbumBean> searchAlbumList(String Notice, String searchOption, String searchText) {
		List<AlbumBean> abList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			if(searchOption == null) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? ORDER BY No DESC");
				pstmt.setString(1, Notice);
			} else if(searchOption.equals("전체")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? AND title LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			} else if(searchOption.equals("작성자") || searchOption.equals("아이디")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? AND id LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			} else if(searchOption.equals("내용")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? AND content LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			} else if(searchOption.equals("장르")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? AND genre LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			} else if(searchOption.equals("아티스트")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? AND artist LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			} else if(searchOption.equals("제목")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? AND title LIKE ? ORDER BY No DESC");
				pstmt.setString(1, Notice);
				pstmt.setString(2, searchText);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AlbumBean ab = new AlbumBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Genre"),
						rs.getString("Artist"),
						rs.getString("Content"),
						rs.getString("Img"),
						rs.getString("Music"),
						rs.getInt("Price"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
					);
				abList.add(ab);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return abList;
	} //SearchAlbumList
	
	public List<AlbumBean> adminInqRepAlbum(String select) {
		List<AlbumBean> abList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			if(select.equals("조회")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard ORDER BY Inquiry DESC, id ASC");
			} else if(select.equals("신고")) {
				pstmt = conn.prepareStatement("SELECT * FROM albumboard ORDER BY Report DESC, id ASC");
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AlbumBean ab = new AlbumBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Genre"),
						rs.getString("Artist"),
						rs.getString("Content"),
						rs.getString("Img"),
						rs.getString("Music"),
						rs.getInt("Price"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
					);
				abList.add(ab);
				if(abList.size() >= 5) break;
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return abList;
	} //AdminInqRepAlbum
	
	public List<AlbumBean> albumTOP10(String notice) {
		List<AlbumBean> abList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? ORDER BY Inquiry DESC, id ASC");
			pstmt.setString(1, notice);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AlbumBean ab = new AlbumBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Genre"),
						rs.getString("Artist"),
						rs.getString("Content"),
						rs.getString("Img"),
						rs.getString("Music"),
						rs.getInt("Price"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
					);
				abList.add(ab);
				if(abList.size() >= 10) break;
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return abList;
	} //AlbumTOP10
	
	public List<AlbumBean> searchAlbumList(String notice) {
		List<AlbumBean> abList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM albumboard WHERE notice=? ORDER BY Inquiry DESC, id ASC");
			pstmt.setString(1, notice);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AlbumBean ab = new AlbumBean(
						rs.getInt("No"),
						rs.getString("Title"),
						rs.getString("Id"),
						rs.getTimestamp("Time"),
						rs.getString("Genre"),
						rs.getString("Artist"),
						rs.getString("Content"),
						rs.getString("Img"),
						rs.getString("Music"),
						rs.getInt("Price"),
						rs.getInt("Inquiry"),
						rs.getInt("Report"),
						rs.getString("Notice")
					);
				abList.add(ab);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return abList;
	} //SearchAlbumList
}
