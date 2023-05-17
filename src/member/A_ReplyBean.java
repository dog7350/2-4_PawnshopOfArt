package member;
import java.sql.Timestamp;

public class A_ReplyBean {
	private int AlbumNo;
	private int A_ReplyNo;
	private String A_ReplyId;
	private Timestamp A_ReplyDate;
	private String A_ReplyContent;
	private int A_ReplyReport;
	
	public A_ReplyBean() {}
	
	public A_ReplyBean(int AlbumNo, int A_ReplyNo, String A_ReplyId, Timestamp A_ReplyDate, String A_ReplyContent, int A_ReplyReport) {
		this.AlbumNo = AlbumNo;
		this.A_ReplyNo = A_ReplyNo;
		this.A_ReplyId = A_ReplyId;
		this.A_ReplyDate = A_ReplyDate;
		this.A_ReplyContent = A_ReplyContent;
		this.A_ReplyReport = A_ReplyReport;
	}

	public int getAlbumNo() {
		return AlbumNo;
	}

	public void setAlbumNo(int albumNo) {
		AlbumNo = albumNo;
	}

	public int getA_ReplyNo() {
		return A_ReplyNo;
	}

	public void setA_ReplyNo(int a_ReplyNo) {
		A_ReplyNo = a_ReplyNo;
	}

	public String getA_ReplyId() {
		return A_ReplyId;
	}

	public void setA_ReplyId(String a_ReplyId) {
		A_ReplyId = a_ReplyId;
	}

	public Timestamp getA_ReplyDate() {
		return A_ReplyDate;
	}

	public void setA_ReplyDate(Timestamp a_ReplyDate) {
		A_ReplyDate = a_ReplyDate;
	}

	public String getA_ReplyContent() {
		return A_ReplyContent;
	}

	public void setA_ReplyContent(String a_ReplyContent) {
		A_ReplyContent = a_ReplyContent;
	}

	public int getA_ReplyReport() {
		return A_ReplyReport;
	}

	public void setA_ReplyReport(int a_ReplyReport) {
		A_ReplyReport = a_ReplyReport;
	}
}
