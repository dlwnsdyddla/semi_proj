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
			
			sql="select * from lecture_student_registered where student_id=?";
			
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Regist_LectureDTO dto = new Regist_LectureDTO();
				dto.setOpened_code(rs.getString("opened_code"));
				dto.setStudent_id(rs.getString("student_id"));
				dto.setLecture_code(rs.getString("lecture_code"));
				dto.setLecture_name(rs.getString("lecture_name"));
				dto.setLecture_subname(rs.getString("lecture_subname"));
				dto.setRegistered_date(rs.getString("registered_date"));
				dto.setTeacher_name(rs.getString("teacher_name"));
				dto.setCurnum(rs.getInt("curnum"));
				dto.setMaxnum(rs.getInt("maxnum"));
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
	public List<Regist_LectureDTO> teacher_lecturelist(int offset, int rows, String name) {
		List<Regist_LectureDTO> list = new ArrayList<Regist_LectureDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql="select opened_code, lecture_code, lecture_name, lecture_subname, approved ,to_char(start_date,'YY-MM-DD') start_date, to_char(end_date,'YY-MM-DD') end_date, curnum, maxnum, "
					+ " teacher_name from lecture_list "
					+ " WHERE teacher_name = ?";
			
			
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, name);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				Regist_LectureDTO dto = new Regist_LectureDTO();
				 
				 dto.setOpened_code(rs.getString("opened_code"));
				 dto.setLecture_code(rs.getString("lecture_code"));
				 dto.setLecture_name(rs.getString("lecture_name"));
				 dto.setLecture_subname(rs.getString("lecture_subname"));
				 dto.setTeacher_name(rs.getString("teacher_name"));				 
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
	public List<Regist_LectureDTO> adminLecturelist(int offset, int rows) {
		List<Regist_LectureDTO> list = new ArrayList<Regist_LectureDTO>();
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql="select opened_code, lecture_code, lecture_name, lecture_subname, approved ,TO_CHAR(start_date, 'YY-MM-DD') start_date, TO_CHAR(end_date, 'YY-MM-DD') end_date, curnum, maxnum, "
					+ " teacher_name from lecture_list ";
			
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Regist_LectureDTO dto = new Regist_LectureDTO();
				
				dto.setOpened_code(rs.getString("opened_code"));
				dto.setLecture_code(rs.getString("lecture_code"));
				dto.setLecture_name(rs.getString("lecture_name"));
				dto.setLecture_subname(rs.getString("lecture_subname"));
				dto.setTeacher_name(rs.getString("teacher_name"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setCurnum(rs.getInt("curnum"));
				dto.setMaxnum(rs.getInt("maxnum"));
				
				dto.setApproved_date(rs.getString("approved"));

				
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
