package com.regist_lecture;


//개설된 강의 조회 dto
public class Regist_LectureDTO {

	private String opened_code;
	private String lecture_name;
	private String lecture_subname;
	private String lecture_code;
	private String student_id;
	private String registered_date;
	private String teacher_name;
	private String teacher_id;
	private String start_date;
	private String end_date;
	private int curnum;
	private int maxnum;
	private String approved;
	private String approved_date;
	private String lecture_detail;
	private String start_time;
	private String end_time;
	
	
	
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getLecture_detail() {
		return lecture_detail;
	}
	public void setLecture_detail(String lecture_detail) {
		this.lecture_detail = lecture_detail;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getApproved_date() {
		return approved_date;
	}
	public void setApproved_date(String approved_date) {
		this.approved_date = approved_date;
	}
	public String getOpened_code() {
		return opened_code;
	}
	public void setOpened_code(String opened_code) {
		this.opened_code = opened_code;
	}
	public String getLecture_name() {
		return lecture_name;
	}
	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}
	public String getLecture_subname() {
		return lecture_subname;
	}
	public void setLecture_subname(String lecture_subname) {
		this.lecture_subname = lecture_subname;
	}
	public String getLecture_code() {
		return lecture_code;
	}
	public void setLecture_code(String lecture_code) {
		this.lecture_code = lecture_code;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getRegistered_date() {
		return registered_date;
	}
	public void setRegistered_date(String registered_date) {
		this.registered_date = registered_date;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getCurnum() {
		return curnum;
	}
	public void setCurnum(int curnum) {
		this.curnum = curnum;
	}
	public int getMaxnum() {
		return maxnum;
	}
	public void setMaxnum(int maxnum) {
		this.maxnum = maxnum;
	}
	public String getApproved() {
		return approved;
	}
	public void setApproved(String approved) {
		this.approved = approved;
	}
	
	
	
}
