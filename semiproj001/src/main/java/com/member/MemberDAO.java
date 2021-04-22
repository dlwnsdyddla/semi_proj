package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConn;

public class MemberDAO {
	private Connection conn = DBConn.getConnection();
	
	/**
	 * DB에 "id"와 일치하는 정보가 존재하면 MemberDTO 에 값을담아 리턴
	 * @param id
	 * @return MemberDTO
	 */
	public MemberDTO readMember(String id) {
		MemberDTO dto=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql = "SELECT id, pwd, type, member_name, registered, changed, resigned "
					+ " FROM member "
					+ " WHERE id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setType(rs.getString("type"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setRegistered(rs.getString("registered"));
				dto.setChanged(rs.getString("changed"));
				dto.setResigned(rs.getString("resigned"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
				}
			}
		}
		
		return dto;
	}
	
	

}
