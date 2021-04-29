package com.approved;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lectureList.LectureListDTO;
import com.util.DBConn;

public class ApprovedDAO {
	private Connection conn = DBConn.getConnection();
	
	public List<LectureListDTO> listLecture(){
		List<LectureListDTO> list = new ArrayList<LectureListDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql; 
		
		try {
			sql = "SELECT opened_code, lecture_code, lecture_name, lecture_subname, "
					+ " teacher_name, TO_CHAR(start_date,'YYYY-MM-DD') start_date, "
					+ " TO_CHAR(end_date,'YYYY-MM-DD') end_date, "
					+ " curnum, maxnum, approved "
					+ " FROM lecture_list "
					+ " WHERE approved='non-approved'";
			
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LectureListDTO dto = new LectureListDTO();
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
		} finally {
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
	
	public int submitLecture(String opened_code, String admin_id) {
		int result = 0;
		String sql = "update lecture_opened set approved_date=sysdate, approver_id=? "
				+ " where opened_code =?";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, admin_id);
			pstmt.setString(2, opened_code);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int denyLecture(String opened_code) {
		int result = 0;
		String sql = "delete from lecture_opened where opened_code=?";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, opened_code);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
