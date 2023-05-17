package member;
import java.sql.*;
import java.util.*;

public class AlbumBean {
	private int AlbumNo;
	private String AlbumTitle;
	private String AlbumId;
	private Timestamp AlbumDate;
	private String AlbumGenre;
	private String AlbumArtist;
	private String AlbumContent;
	private String AlbumImg;
	private String AlbumMusic;
	private int AlbumPrice;
	private int AlbumInquiry;
	private int AlbumReport;
	private String AlbumNotice;
	
	public AlbumBean() {}
	
	public AlbumBean(int AlbumNo, String AlbumTitle, String AlbumId, Timestamp AlbumDate, String AlbumGenre, String AlbumArtist, String AlbumContent, String AlbumImg, String AlbumMusic, int AlbumPrice, int AlbumInquiry, int AlbumReport, String AlbumNotice) {
		this.AlbumNo = AlbumNo;
		this.AlbumTitle = AlbumTitle;
		this.AlbumId = AlbumId;
		this.AlbumDate = AlbumDate;
		this.AlbumGenre = AlbumGenre;
		this.AlbumArtist = AlbumArtist;
		this.AlbumContent = AlbumContent;
		this.AlbumImg = AlbumImg;
		this.AlbumMusic = AlbumMusic;
		this.AlbumPrice = AlbumPrice;
		this.AlbumInquiry = AlbumInquiry;
		this.AlbumReport = AlbumReport;
		this.AlbumNotice = AlbumNotice;
	}

	public int getAlbumNo() {
		return AlbumNo;
	}

	public void setAlbumNo(int albumNo) {
		AlbumNo = albumNo;
	}

	public String getAlbumTitle() {
		return AlbumTitle;
	}

	public void setAlbumTitle(String albumTitle) {
		AlbumTitle = albumTitle;
	}

	public String getAlbumId() {
		return AlbumId;
	}

	public void setAlbumId(String albumId) {
		AlbumId = albumId;
	}

	public Timestamp getAlbumDate() {
		return AlbumDate;
	}

	public void setAlbumDate(Timestamp albumDate) {
		AlbumDate = albumDate;
	}

	public String getAlbumGenre() {
		return AlbumGenre;
	}

	public void setAlbumGenre(String albumGenre) {
		AlbumGenre = albumGenre;
	}

	public String getAlbumArtist() {
		return AlbumArtist;
	}

	public void setAlbumArtist(String albumArtist) {
		AlbumArtist = albumArtist;
	}

	public String getAlbumContent() {
		return AlbumContent;
	}

	public void setAlbumContent(String albumContent) {
		AlbumContent = albumContent;
	}

	public String getAlbumImg() {
		return AlbumImg;
	}

	public void setAlbumImg(String albumImg) {
		AlbumImg = albumImg;
	}

	public String getAlbumMusic() {
		return AlbumMusic;
	}

	public void setAlbumMusic(String albumMusic) {
		AlbumMusic = albumMusic;
	}

	public int getAlbumInquiry() {
		return AlbumInquiry;
	}

	public void setAlbumInquiry(int albumInquiry) {
		AlbumInquiry = albumInquiry;
	}

	public int getAlbumReport() {
		return AlbumReport;
	}

	public void setAlbumReport(int albumReport) {
		AlbumReport = albumReport;
	}

	public String getAlbumNotice() {
		return AlbumNotice;
	}

	public void setAlbumNotice(String albumNotice) {
		AlbumNotice = albumNotice;
	}

	public int getAlbumPrice() {
		return AlbumPrice;
	}

	public void setAlbumPrice(int albumPrice) {
		AlbumPrice = albumPrice;
	}
}
