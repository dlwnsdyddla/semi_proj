package com.regist_lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class Regist_LectureDAO {
	private Connection conn = DBConn.getConnection();
	
	//데이터개수 가져오기
	public int dataCount() {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql="select count(*) from lecture";
			
			pstmt = conn.prepareStatement(sql);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);///count값이 getint로 들어간다
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			if(pstmt!= null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			
		}

		return result;
		
	}
	
	//검색했을 때 데이터개수 가져오기
	public int dataCount(String condition, String keyword) {
		int result =0;
		//lecture_list와 member join
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		String sql;
		
		try {
			sql="select count(*)"
				+" from lecture_list"
				+" join member m on m.Id=l.Id";	
			
			if(condition.equals("all")) {
				sql+=" where instr(subject,?) >=1 or instr(content,?) >=1";
				
			}else if(condition.equals("created")) {
				keyword = keyword.replaceAll("(\\/|\\-|\\.)", "");
				sql+=" where to_char(created,'YYYY-MM-DD')=?";
			}else {
				sql+=" where instr("+condition+",?) >=1";
			}
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			if(condition.equals("all")) {
				pstmt.setString(2, keyword);
			}
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			
		}
		
		return result;
	}
	
	
	
	//학생들의 강의 목록 
	public List<Regist_LectureDTO> lecture_list(int offset, int rows, String id) {
		List<Regist_LectureDTO> list = new ArrayList<Regist_LectureDTO>();
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql;

		
		try {
			
			sql="select l.lecture_code, l.lecture_name, l.lecture_subname, teacher_name, student_id, curnum, maxnum,registered_date, start_date, end_date"
					+ " from lecture_list l"
					+" join lecture_student_registered r on r.opened_code = l.opened_code"
					+" where student_id=?";
			
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Regist_LectureDTO dto = new Regist_LectureDTO();
				dto.setStudent_id(rs.getString("student_id"));
				dto.setLecture_code(rs.getString("lecture_code"));
				dto.setLecture_name(rs.getString("lecture_name"));
				dto.setLecture_subname(rs.getString("lecture_subname"));
				dto.setTeacher_name(rs.getString("teacher_name"));
				dto.setCurnum(Integer.parseInt(rs.getString("curnum")));
				dto.setMaxnum(Integer.parseInt(rs.getString("maxnum")));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setRegistered_date(rs.getString("registered_date"));
				
				list.add(dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
					
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
				
		}
		
		
		return list;
		
	}
	
	//강사의 강의 보이기
	public List<Regist_LectureDTO> teacher_lecturelist(int offset, int rows, String id) {
		List<Regist_LectureDTO> list = new ArrayList<Regist_LectureDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql="select list.opened_code, list.lecture_code, list.lecture_name, list.lecture_subname, approved"
					+"  ,list.start_date, list.end_date, list.curnum, list.maxnum, l.teacher_id"
					+" from lecture l"
					+" join member m on m.id= l.teacher_id"
					+" join lecture_list list on list.teacher_name=m.member_name"
					+" where l.teacher_id =?";
			
			
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				Regist_LectureDTO dto = new Regist_LectureDTO();
				 
				 dto.setOpened_code(rs.getString("opened_code"));
				 dto.setLecture_code(rs.getString("lecture_code"));
				 dto.setLecture_name(rs.getString("lecture_name"));
				 dto.setTeacher_id(rs.getString("teacher_id"));				 
				 dto.setStart_date(rs.getString("start_date"));
				 dto.setEnd_date(rs.getString("end_date"));
				 dto.setCurnum(rs.getInt("curnum"));
				 dto.setMaxnum(rs.getInt("maxnum"));
				 dto.setApproved(rs.getString("approved"));
				
				 list.add(dto);
				
				
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
					
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
		
		
		return list;
	}
	
	
	//관리자 권한으로 강의 리스트 다 보기
	public List<Regist_LectureDTO> adminLecturelist(int offset, int rows, String id) {
		List<Regist_LectureDTO> list = new ArrayList<Regist_LectureDTO>();
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql=" select l.lecture_code, start_date, end_date, start_time, end_time,  "
					+" teacher_id, l.lecture_name, l.lecture_detail, approved_date"
					+" from lecture l "
					+" left outer join lecture_opened o on l.lecture_code=o.lecture_code";
			
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Regist_LectureDTO dto = new Regist_LectureDTO();
				
				dto.setLecture_code(rs.getString("lecture_code"));
				dto.setLecture_name(rs.getString("lecture_code"));
				dto.setTeacher_id(rs.getString("teacher_id"));
				dto.setOpened_code(rs.getString("start_date"));
				dto.setOpened_code(rs.getString("end_date"));
				dto.setStart_time(rs.getString("start_time"));
				dto.setEnd_time(rs.getString("end_time"));
				
				dto.setApproved_date(rs.getString("approved_date"));

				
				list.add(dto);

				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
					
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
		}
		return list;
	}
	
	
}
