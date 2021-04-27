package com.registered;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class RegisteredDAO {
	private Connection conn = DBConn.getConnection();
	
	public List<RegisteredDTO> readRegistered(String opened_code) {
		List<RegisteredDTO> list = new ArrayList<RegisteredDTO>();
		String sql = "select m.member_name member_name, registered_date, r.student_id id"
				+ "  from lecture_register r, member m"
				+ "  where r.student_id=m.id "
				+ " and opened_code=?";
		ResultSet rs = null;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, opened_code);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				RegisteredDTO dto = new RegisteredDTO();
				dto.setMember_name(rs.getString("member_name"));
				String rdate = rs.getString("registered_date");
				rdate = rdate.substring(0, rdate.lastIndexOf("-")+3);
				dto.setRegistered_date(rdate);
				dto.setId(rs.getString("id"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return list;		
	}
	
	public String readLecture(String opened_code) {
		String lecture=null;
		String sql = "select lecture_name from lecture_student_registered "
				+ " where opened_code=?";
		ResultSet rs = null;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, opened_code);
			rs=pstmt.executeQuery();
			if(rs.next())
				lecture = rs.getString("lecture_name");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lecture;
	}
	
	public int dataCount(List<RegisteredDTO> list) {
		int count = list.size();
		return count;
	}
	
	public int totalCount(String opened_code) {
		int totalCount = 0;
		String sql = "select maxnum from lecture_opened where opened_code=?";
		ResultSet rs = null;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, opened_code);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalCount = rs.getInt("maxnum");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return totalCount;
	}
}
