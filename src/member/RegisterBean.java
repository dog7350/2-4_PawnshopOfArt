package member;

public class RegisterBean {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberRRN;
	private String memberPhone;
	private String memberEmail;
	private String memberGender;
	private String memberGenre;
	private String memberLikemusic;
	private String memberProfile;
	private String memberCompose;
	private int memberCash;
	private String memberStop;
	private String memberAdmin;
	
	public RegisterBean() {};
	
	public RegisterBean(String memberId, String memberPw, String memberName, String memberRRN, String memberPhone, String memberEmail, String memberGender, String memberGenre, String memberLikemusic, String memberProfile, String memberCompose, int memberCash, String  memberStop, String memberAdmin) {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberRRN = memberRRN;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberGender = memberGender;
		this.memberGenre = memberGenre;
		this.memberLikemusic = memberLikemusic;
		this.memberProfile = memberProfile;
		this.memberCompose = memberCompose;
		this.memberCash = memberCash;
		this.memberStop = memberStop;
		this.memberAdmin = memberAdmin;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberRRN() {
		return memberRRN;
	}
	public void setMemberRRN(String memberRRN) {
		this.memberRRN = memberRRN;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberGenre() {
		return memberGenre;
	}
	public void setMemberGenre(String memberGenre) {
		this.memberGenre = memberGenre;
	}
	public String getMemberLikemusic() {
		return memberLikemusic;
	}
	public void setMemberLikemusic(String memberLikemusic) {
		this.memberLikemusic = memberLikemusic;
	}
	public String getMemberCompose() {
		return memberCompose;
	}
	public void setMemberCompose(String memberCompose) {
		this.memberCompose = memberCompose;
	}
	public int getMemberCash() {
		return memberCash;
	}
	public void setMemberCash(int memberCash) {
		this.memberCash = memberCash;
	}
	public String getMemberStop() {
		return memberStop;
	}
	public void setMemberStop(String memberStop) {
		this.memberStop = memberStop;
	}
	public String getMemberAdmin() {
		return memberAdmin;
	}
	public void setMemberAdmin(String memberAdmin) {
		this.memberAdmin = memberAdmin;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
}