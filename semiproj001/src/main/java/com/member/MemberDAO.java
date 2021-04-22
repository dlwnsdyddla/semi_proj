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
	
	/**
	 * member 테이블에 정보 추가 (insert문)
	 * @param dto
	 * @return int
	 * @throws SQLException
	 */
	public int insertMember(MemberDTO dto) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			conn.setAutoCommit(false);
			
			sql = "INSERT INTO member(id, pwd, type, member_name, registered, changed, resigned) VALUES (?, ?, ?, ?, SYSDATE, SYSDATE, '')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getType());
			pstmt.setString(4, dto.getMember_name());

			result = pstmt.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e2) {
			}
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
				}
			}
		}
		
		return result;
	}
	
	/**
	 * member 테이블에 정보 수정 (update문)
	 * @param dto
	 * @return int
	 * @throws SQLException
	 */
	public int updateMember(MemberDTO dto) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			conn.setAutoCommit(false);
			
			sql = "UPDATE member SET pwd=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getId());
			
			result = pstmt.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e2) {
			}
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
				}
			}
		}
		
		return result;
	}
	
	/**
	 * "id" 값으로 검색해 정보가 있으면
	 * type -> d 로 변경하고
	 * resigned -> SYSDATE 로 변경하여
	 * 탈퇴처리 (update문)
	 * @param id
	 * @return int
	 * @throws SQLException
	 */
	public int deleteMember(String id) throws SQLException {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			conn.setAutoCommit(false);
			
			sql="UPDATE member SET type='d', resigned=SYSDATE WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			conn.commit();
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e2) {
			}
			e.printStackTrace();
			throw e;
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return result;
	}
	

}
