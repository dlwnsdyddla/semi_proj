package com.approved;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class ApprovedDAO {
	private Connection conn = DBConn.getConnection();
	
	public List<ApprovedDTO> readApproved() {
		List<ApprovedDTO> list = new ArrayList<ApprovedDTO>();
		String sql = "select lecture_name, teacher_name, start_date, end_date, lecture_subname "
				+ " from lecture_list where approved='non-approved' ";
		try(PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	public int submitLecture(String opened_code, String admin_id) {
		int result = 0;
		String sql = "update lecture_opened set approved_date=sysdate, approver_id=? "
				+ " where opend_code =?";
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
