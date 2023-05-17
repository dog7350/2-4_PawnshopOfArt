package member;
import java.sql.*;
import java.util.*;

public class ReplyBean {
	private int BoardNo;
	private int ReplyNo;
	private String ReplyId;
	private Timestamp ReplyDate;
	private String ReplyContent;
	private int ReplyReport;
	
	public ReplyBean() {}
	
	public ReplyBean(int BoardNo, int ReplyNo, String ReplyId, Timestamp ReplyDate, String ReplyContent, int ReplyReport) {
		this.BoardNo = BoardNo;
		this.ReplyNo = ReplyNo;
		this.ReplyId = ReplyId;
		this.ReplyDate = ReplyDate;
		this.ReplyContent = ReplyContent;
		this.ReplyReport = ReplyReport;
	}
	
	public int getBoardNo() {
		return BoardNo;
	}
	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}
	public int getReplyNo() {
		return ReplyNo;
	}
	public void setReplyNo(int replyNo) {
		ReplyNo = replyNo;
	}
	public String getReplyId() {
		return ReplyId;
	}
	public void setReplyId(String replyId) {
		ReplyId = replyId;
	}
	public Timestamp getReplyDate() {
		return ReplyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		ReplyDate = replyDate;
	}
	public String getReplyContent() {
		return ReplyContent;
	}
	public void setReplyContent(String replyContent) {
		ReplyContent = replyContent;
	}
	public int getReplyReport() {
		return ReplyReport;
	}
	public void setReplyReport(int replyReport) {
		ReplyReport = replyReport;
	}
}
