package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			sql = "SELECT id, pwd, type, member_name, TO_CHAR(registered,'YY-MM-DD') registered, TO_CHAR(changed,'YY-MM-DD') changed, TO_CHAR(resigned,'YY-MM-DD') resigned  "
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
			
			sql = "INSERT INTO member(id, pwd, type, member_name, registered, changed, resigned, member_picture_filename) VALUES (?, ?, ?, ?, SYSDATE, SYSDATE, '', ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getType());
			pstmt.setString(4, dto.getMember_name());
			pstmt.setString(5, dto.getMember_picture_filename());

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
	 * 비밀번호 변경 (update문)
	 * @param dto
	 * @return int
	 * @throws SQLException
	 */
	public int updateMemberPwd(MemberDTO dto, String newPwd, String oldPwd) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			conn.setAutoCommit(false);
			
			sql = "UPDATE member SET pwd=?, changed=SYSDATE WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, oldPwd);
			
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
	public int deleteMember(MemberDTO dto, String pwd) throws SQLException {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			conn.setAutoCommit(false);
			
			sql="UPDATE member SET type='d', resigned=SYSDATE WHERE id= ? AND pwd = ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, pwd);
			
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
	
	
	public int dataCount(String type) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			if(type.equals("all")) {
				sql = " SELECT COUNT(*) FROM member ";
			} else {
				sql = " SELECT COUNT(*) FROM member WHERE type = ?";
			}
			pstmt = conn.prepareStatement(sql);
			
			if(! type.equals("all")) {
				pstmt.setString(1, type);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
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
		
		return result;
	}
	
	public int dataCount(String condition, String keyword) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql =  " SELECT COUNT(*) FROM member ";
			sql += " WHERE INSTR("+ condition + ", ?) >= 1 ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			
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
		return result;
	}
	
	public List<MemberDTO> listMember(int offset, int rows, String type) {
		List<MemberDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT id, type, member_name, TO_CHAR(registered,'YY-MM-DD') registered, TO_CHAR(changed,'YY-MM-DD') changed, TO_CHAR(resigned,'YY-MM-DD') resigned, member_picture_filename "
					+ " FROM member "
					+ " WHERE NOT type = 'd' AND NOT type ='a' ";
			
			if(! type.equals("all")) {
				sql += " AND type = ? ";
			}
			sql +=	" ORDER BY member_name "
				+ " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ";
			pstmt = conn.prepareStatement(sql);
			
			if(type.equals("all")) {
				pstmt.setInt(1, offset);
				pstmt.setInt(2, rows);
			} else {
				pstmt.setString(1, type);
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rows);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setType(rs.getString("type"));
				dto.setRegistered(rs.getString("registered"));
				dto.setChanged(rs.getString("changed"));
				dto.setResigned(rs.getString("resigned"));
				dto.setMember_picture_filename(rs.getString("member_picture_filename"));
				
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
}
