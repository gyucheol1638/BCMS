package net.su.bcms.vo;

public class ComnctnNmeCardValueObject extends ComnctnSearchAndPageValueObject {

	private int comnctnSeq;//커뮤니케이션 고유값
	private int nmeCardSeq;//명함 고유값
	private int memSeq = 0;//멤버 고유값
	private String memName = "";//멤버 이름
	private String comnctnTitl = "";//커뮤니케이션 제목
	private String comnctnContn = "";//커뮤니케이션 내용
	private String comnctnType = "";//커뮤니케이션 종류
	private String comnctnCretDate = "";//커뮤니케이션 생성일
	private int comnctnPSeq;//커뮤니케이션 부모값
	private String comnctnUseAt = "";//커뮤니케이션 사용여부
	private String comnctnAtnd = "";//등록된 참석자
	private String comnctnNoAtnd = "";//미등록된 참석자
	private int comnctnCretrSeq = 0;
	private String newspeedType; //최신정보 타입(등록/삭제)

	
	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public int getComnctnSeq() {
		return comnctnSeq;
	}

	public void setComnctnSeq(int comnctnSeq) {
		this.comnctnSeq = comnctnSeq;
	}

	public int getNmeCardSeq() {
		return nmeCardSeq;
	}

	public void setNmeCardSeq(int nmeCardSeq) {
		this.nmeCardSeq = nmeCardSeq;
	}

	public int getMemSeq() {
		return memSeq;
	}

	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}

	

	public String getComnctnTitl() {
		return comnctnTitl;
	}

	public void setComnctnTitl(String comnctnTitl) {
		this.comnctnTitl = comnctnTitl;
	}

	public String getComnctnContn() {
		return comnctnContn;
	}

	public void setComnctnContn(String comnctnContn) {
		this.comnctnContn = comnctnContn;
	}

	public String getComnctnType() {
		return comnctnType;
	}

	public void setComnctnType(String comnctnType) {
		this.comnctnType = comnctnType;
	}

	public String getComnctnCretDate() {
		return comnctnCretDate;
	}

	public void setComnctnCretDate(String comnctnCretDate) {
		this.comnctnCretDate = comnctnCretDate;
	}

	public int getComnctnPSeq() {
		return comnctnPSeq;
	}

	public void setComnctnPSeq(int comnctnPSeq) {
		this.comnctnPSeq = comnctnPSeq;
	}

	public String getComnctnUseAt() {
		return comnctnUseAt;
	}

	public void setComnctnUseAt(String comnctnUseAt) {
		this.comnctnUseAt = comnctnUseAt;
	}

	public String getComnctnAtnd() {
		return comnctnAtnd;
	}

	public void setComnctnAtnd(String comnctnAtnd) {
		this.comnctnAtnd = comnctnAtnd;
	}

	public String getComnctnNoAtnd() {
		return comnctnNoAtnd;
	}

	public void setComnctnNoAtnd(String comnctnNoAtnd) {
		this.comnctnNoAtnd = comnctnNoAtnd;
	}

	public int getComnctnCretrSeq() {
		return comnctnCretrSeq;
	}

	public void setComnctnCretrSeq(int comnctnCretrSeq) {
		this.comnctnCretrSeq = comnctnCretrSeq;
	}

	public String getNewspeedType() {
		return newspeedType;
	}

	public void setNewspeedType(String newspeedType) {
		this.newspeedType = newspeedType;
	}
	
}
