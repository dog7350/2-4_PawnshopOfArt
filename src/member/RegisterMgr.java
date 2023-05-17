package member;

import java.sql.*;
import java.util.*;

public class RegisterMgr {

	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://222.112.186.30:3306/jspart?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	private final String USER = "admin";
	private final String PASS = "testadmin";
	
	public RegisterMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	} //Member Mgr()
	
	//public Vector getMemberList() {}
	
	public void insertMember(String id, String pw, String name, String rrn, String phone, String email, String genre, String likemusic, String gender, String compose, String profile) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 'no', 'no')");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, rrn);
			pstmt.setString(5, phone);
			pstmt.setString(6, email);
			pstmt.setString(7, gender);
			pstmt.setString(8, genre);
			pstmt.setString(9, likemusic);
			pstmt.setString(10,  profile);
			pstmt.setString(11, compose);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
	} //InsertMember
	
	public RegisterBean memberLogin(String id) {
		RegisterBean rb = new RegisterBean();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rb.setMemberId(rs.getString("Id"));
				rb.setMemberPw(rs.getString("Pw"));
				rb.setMemberName(rs.getString("Name"));
				rb.setMemberRRN(rs.getString("Rrn"));
				rb.setMemberPhone(rs.getString("Phone"));
				rb.setMemberEmail(rs.getString("Email"));
				rb.setMemberGender(rs.getString("Gender"));
				rb.setMemberGenre(rs.getString("Genre"));
				rb.setMemberLikemusic(rs.getString("LikeMusic"));
				rb.setMemberProfile(rs.getString("Profile"));
				rb.setMemberCompose(rs.getString("Compose"));
				rb.setMemberCash(rs.getInt("Cash"));
				rb.setMemberStop(rs.getString("Stop"));
				rb.setMemberAdmin(rs.getString("Admin"));
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return rb;
	} //MemberLogin
	
	public List<RegisterBean> memberSearch(String searchOption, String searchText) {
		List<RegisterBean> rbList = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			if(searchOption == null) {
				pstmt = conn.prepareStatement("SELECT * FROM member ORDER BY id");
			} else if(searchOption.equals("아이디")) {
				pstmt = conn.prepareStatement("SELECT * FROM member WHERE id LIKE ? ORDER BY id");
				pstmt.setString(1, searchText);
			} else if(searchOption.equals("이름")) {
				pstmt = conn.prepareStatement("SELECT * FROM member WHERE name LIKE ? ORDER BY id");
				pstmt.setString(1, searchText);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RegisterBean rb = new RegisterBean(
						rs.getString("Id"),
						rs.getString("Pw"),
						rs.getString("Name"),
						rs.getString("Rrn"),
						rs.getString("Phone"),
						rs.getString("Email"),
						rs.getString("Gender"),
						rs.getString("Genre"),
						rs.getString("LikeMusic"),
						rs.getString("Profile"),
						rs.getString("Compose"),
						rs.getInt("Cash"),
						rs.getString("Stop"),
						rs.getString("Admin")
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
	} //MemberSearch
	
	public int memberDelete(String id) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
				
			pstmt = conn.prepareStatement("DELETE FROM member WHERE id=?");
			pstmt.setString(1, id);
				
			check = pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	} //MemberDelete
	
	public int memberStop(String id, String state) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if (state.equals("no")) {
			state = "yes";
		} else if (state.equals("yes")) {
			state = "no";
		}
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
				
			pstmt = conn.prepareStatement("UPDATE member SET stop=? WHERE id=?");
			pstmt.setString(1, state);
			pstmt.setString(2, id);
				
			check = pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	} //MemberDelete
	
	public int updateMember(String id, String pw, String phone, String email, String gender, String genre, String likemusic, String profile, String compose) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("UPDATE member SET pw=?, phone=?, email=?, gender=?, genre=?, likemusic=?, compose=?, profile=? WHERE id=?");
			pstmt.setString(1, pw);
			pstmt.setString(2, phone);
			pstmt.setString(3, email);
			pstmt.setString(4, gender);
			pstmt.setString(5, genre);
			pstmt.setString(6, likemusic);
			pstmt.setString(7, compose);
			pstmt.setString(8, profile);
			pstmt.setString(9, id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}
	
	public int memberCash(RegisterBean mem, int cash) {
		int check = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("UPDATE member SET cash=? WHERE id=?");
			pstmt.setInt(1, cash);
			pstmt.setString(2, mem.getMemberId());
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) try {rs.close();} catch(Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if (conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return check;
	}
}