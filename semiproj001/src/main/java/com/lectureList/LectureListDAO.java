package com.lectureList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class LectureListDAO {
	private Connection conn = DBConn.getConnection();
	
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT COUNT(*) FROM lecture_list "
					+ " WHERE approved='approved'";
			pstmt = conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			
			if (pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		
		
		return result;
	}
	
	public List<LectureListDTO> listLecture(int offset, int rows){
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
					+ " WHERE approved='approved'"
					+ " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, rows);
			
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
	
	//?????? ????????? ??? 
	public int dataCount(String condition, String keyword) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT COUNT(*) FROM lecture_list WHERE approved='approved' ";
			
			if(condition.equals("all")) {
				sql+=" AND INSTR(subject,?)>=1 OR INSTR(content,?)>=1 ";
			} else {
				sql+=" AND INSTR(" + condition + ", ?)>=1";
			}
			pstmt=conn.prepareStatement(sql);
			
			if(condition.equals("all")) {
				pstmt.setString(1, keyword);
				pstmt.setString(2, keyword);
			}else {
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
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
	
	//?????? ????????? ???
	public List<LectureListDTO> listLecture(int offset, int rows, String condition, String keyword){
		List<LectureListDTO> list = new ArrayList<LectureListDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql;
		
		try {
			sql ="SELECT opened_code, lecture_code, lecture_name, lecture_subname, "
					+ " teacher_name, TO_CHAR(start_date,'YYYY-MM-DD') start_date, "
					+ " TO_CHAR(end_date, 'YYYY-MM-DD') end_date, "
					+ " curnum, maxnum, approved "
					+ " FROM lecture_list "
					+ " WHERE approved='approved'";
			
			if(condition.equals("all")) {
				sql+=" AND INSTR(subject,?)>=1 OR INSTR(content,?)>=1";
			} else {
				sql+=" AND INSTR(" + condition + ", ?)>=1";
			}
			sql+=" ORDER BY curnum DESC "
					+ " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";
			
			pstmt=conn.prepareStatement(sql);
			
			if(condition.equals("all")) {
				pstmt.setString(1, keyword);
				pstmt.setString(2, keyword);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, rows);
			}else {
				pstmt.setString(1, keyword);
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rows);
			}
			
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
	
	public LectureListDTO readLecutreList(String opened_code) {
		LectureListDTO dto =null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT opened_code, lecture_name, "
					+ " lecture_subname, teacher_name, "
					+ " TO_CHAR(start_date,'YYYY-MM-DD') start_date,  "
					+ " TO_CHAR(end_date, 'YYYY-MM-DD') end_date, "
					+ " curnum, maxnum, lecture_detail "
					+ " FROM lecture_detailed "
					+ " WHERE opened_code = ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, opened_code);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto= new LectureListDTO();
				dto.setOpened_code(rs.getString("opened_code"));
				dto.setLecture_name(rs.getString("lecture_name"));
				dto.setLecture_subname(rs.getString("lecture_subname"));
				dto.setTeacher_name(rs.getString("teacher_name"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setCurnum(rs.getInt("curnum"));
				dto.setMaxnum(rs.getInt("maxnum"));
				dto.setLecture_detail(rs.getString("lecture_detail"));
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
		
		
		return dto; 
	}
	
	public int registerLecture(String[] opened_codes, String student_id) throws SQLException {
		int result = 0;
		try {
			conn.setAutoCommit(false);
		} catch (Exception e) {
		}
		
		for(String s: opened_codes) {
			String sql = "insert into lecture_register values(?, ?, sysdate)";
		
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, s);
				pstmt.setString(2, student_id);
				if(pstmt.executeUpdate()!=1) {
					throw new Exception();	
				}
				result++;
			} catch (Exception e) {
				e.printStackTrace();
				conn.rollback();
				return 0;
			}
		}
		try {
			conn.commit();
		} catch (Exception e) {
		}
		
		return result;
	}
	
	
	public List<LectureListDTO> contentlist(String opened_code){
		List<LectureListDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql="SELECT content_code, content_title, content_detail, "
					+ " content_round, opened_code FROM lecture_content"
					+ " WHERE opened_code=? ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, opened_code);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				LectureListDTO dto = new LectureListDTO();
				dto.setContent_code(rs.getString("content_code"));
				dto.setContent_title(rs.getString("content_title"));
				dto.setContent_detail(rs.getString("content_detail"));
				dto.setContent_round(rs.getInt("content_round"));
				dto.setOpened_code(rs.getString("opened_code"));
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
