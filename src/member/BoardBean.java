package member;
import java.sql.*;
import java.util.*;

public class BoardBean {
	private int BoardNo;
	private String BoardTitle;
	private String BoardId;
	private Timestamp BoardDate;
	private String BoardContent;
	private int BoardInquiry;
	private int BoardReport;
	private String BoardNotice;
	
	public BoardBean() {}
	
	public BoardBean(int BoardNo, String BoardTitle, String BoardId, Timestamp BoardDate, String BoardContent, int BoardInquiry, int BoardReport, String BoardNotice) {
		this.BoardNo = BoardNo;
		this.BoardTitle = BoardTitle;
		this.BoardId = BoardId;
		this.BoardDate = BoardDate;
		this.BoardContent = BoardContent;
		this.BoardInquiry = BoardInquiry;
		this.BoardReport = BoardReport;
		this.BoardNotice = BoardNotice;
	}
	
	public int getBoardNo() {
		return BoardNo;
	}
	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}
	public String getBoardTitle() {
		return BoardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		BoardTitle = boardTitle;
	}
	public String getBoardId() {
		return BoardId;
	}
	public void setBoardId(String boardId) {
		BoardId = boardId;
	}
	public Timestamp getBoardDate() {
		return BoardDate;
	}
	public void setBoardDate(Timestamp boardDate) {
		BoardDate = boardDate;
	}
	public String getBoardContent() {
		return BoardContent;
	}
	public void setBoardContent(String boardContent) {
		BoardContent = boardContent;
	}
	public int getBoardInquiry() {
		return BoardInquiry;
	}
	public void setBoardInquiry(int boardInquiry) {
		BoardInquiry = boardInquiry;
	}
	public int getBoardReport() {
		return BoardReport;
	}
	public void setBoardReport(int boardReport) {
		BoardReport = boardReport;
	}
	public String getBoardNotice() {
		return BoardNotice;
	}
	public void setBoardNotice(String boardNotice) {
		BoardNotice = boardNotice;
	}
	
}
