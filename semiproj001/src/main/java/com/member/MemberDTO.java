package com.member;

public class MemberDTO {
	
	private String id;			// 아이디
	private String pwd;			// 패스워드
	private String member_name;	// 이름
	private String type;		// 유저 롤 -> 학생:s, 강사:t, 관리자:a
	private String registered;	// 가입일자
	private String changed;		// 정보 수정일자
	private String resigned;	// 회원탈퇴일
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegistered() {
		return registered;
	}
	public void setRegistered(String registered) {
		this.registered = registered;
	}
	public String getChanged() {
		return changed;
	}
	public void setChanged(String changed) {
		this.changed = changed;
	}
	public String getResigned() {
		return resigned;
	}
	public void setResigned(String resigned) {
		this.resigned = resigned;
	}
	
}
