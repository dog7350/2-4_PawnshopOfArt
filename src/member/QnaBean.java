package member;
import java.sql.*;
import java.util.*;

public class QnaBean {
	private int Q_BoardNo;
	private String Q_UserId;
	private String Q_BoardTitle;
	private Timestamp Q_Date;
	private String Q_Content;
	
	public QnaBean() {}
	
	public QnaBean(int Q_BoardNo, String Q_UserId, String Q_BoardTitle, Timestamp Q_Date, String Q_Content) {
		this.Q_BoardNo = Q_BoardNo;
		this.Q_UserId = Q_UserId;
		this.Q_BoardTitle = Q_BoardTitle;
		this.Q_Date = Q_Date;
		this.Q_Content = Q_Content;
	}
	
	public int getQ_BoardNo() {
		return Q_BoardNo;
	}
	public void setQ_BoardNo(int q_BoardNo) {
		Q_BoardNo = q_BoardNo;
	}
	public String getQ_UserId() {
		return Q_UserId;
	}
	public void setQ_UserId(String q_UserId) {
		Q_UserId = q_UserId;
	}
	public String getQ_BoardTitle() {
		return Q_BoardTitle;
	}
	public void setQ_BoardTitle(String q_BoardTitle) {
		Q_BoardTitle = q_BoardTitle;
	}
	public Timestamp getQ_Date() {
		return Q_Date;
	}
	public void setQ_Date(Timestamp q_Date) {
		Q_Date = q_Date;
	}
	public String getQ_Content() {
		return Q_Content;
	}
	public void setQ_Content(String q_Content) {
		Q_Content = q_Content;
	}
}
