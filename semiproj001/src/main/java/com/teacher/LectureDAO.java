package com.teacher;
import java.sql.Connection;


//import com.regist_lecture.Regist_LectureDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.regist_lecture.Regist_LectureDTO;
import com.util.DBConn;
public class LectureDAO {
	private Connection conn = DBConn.getConnection();
	
	
	
	
	
	//강사의 강의 신청
	public int insertLecture(Regist_LectureDTO dto) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql=" insert into lecture(lecture_code, lecture_name, lecture_subname, lecture_detail, teacher_id )"
					+ " values(?,?,?,?,?)";
			
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getLecture_code());
			pstmt.setString(2, dto.getLecture_name());
			pstmt.setString(3, dto.getLecture_subname());
			pstmt.setString(4, dto.getLecture_detail());
			pstmt.setString(5, dto.getTeacher_id());
			
			
			result = pstmt.executeUpdate();
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				
			}
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
					
				}
			}
		}
		return result;
	}
	
	
	//강의리스트
	public List<Regist_LectureDTO> teacher_lecturelist(String lecture_code, String lecture_code2, String id) {
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
	
	
	// 코드의 하나의 데이터 가져오기
	
	
	//강의 수정
	public int updateLecture(Regist_LectureDTO dto, String id) throws SQLException {
		int result =0;
		PreparedStatement pstmt =null;
		String sql;
		
		try {
			
			sql ="update lecture set lecture_name=? lecture_subname=?"
					+ " , lecture_detail=?"
					+ " where teacher_id=?, lecture_code=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getLecture_name());
			pstmt.setString(2, dto.getLecture_subname());
			pstmt.setString(3, dto.getLecture_detail());
			pstmt.setString(4, id);
			pstmt.setString(5, dto.getLecture_code());
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					
				}
			}
			
		}
		
		return result;
	}
	

	
}

