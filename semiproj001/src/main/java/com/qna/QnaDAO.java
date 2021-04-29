package com.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class QnaDAO {

	private Connection conn = DBConn.getConnection();
	
	public List<QnaDTO> qnaList() {
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		String sql = "select qna_code, question_content, question_name, answer_name, question_date "
				+ " from qna_content";
		try(PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_code(rs.getString("Qna_code"));
				dto.setQuestion_content(rs.getString("question_content"));
				dto.setQuestion_name(rs.getString("question_name"));
				dto.setAnswer_name(rs.getString("answer_name"));
				dto.setQuestion_date(rs.getString("question_date"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public QnaDTO qnaContent(String qna_code) {
		QnaDTO dto = new QnaDTO();
		String sql = "select * from qna_content where qna_code=?";
		ResultSet rs = null;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, qna_code);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setQna_code(rs.getString("qna_code"));
				dto.setOpened_code(rs.getString("opened_code"));
				dto.setLecture_name(rs.getString("lecture_name"));
				dto.setQuestion_id(rs.getString("question_id"));
				dto.setQuestion_name(rs.getString("question_name"));
				dto.setQuestion_title(rs.getString("question_title"));
				dto.setQuestion_content(rs.getString("question_content"));
				dto.setQuestion_date(rs.getString("question_date"));
				dto.setAnswer_id(rs.getString("answer_id"));
				dto.setAnswer_name(rs.getString("answer_name"));
				dto.setAnswer_content(rs.getString("answer_content"));
				dto.setAnswer_date(rs.getString("answer_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int insertAnswer(String qna_code, QnaDTO dto) {
		int result = 0;
		String sql = "update board_qna set answer_id=?, answer_content=?, answer_date=sysdate "
				+ " where qna_code=?";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, dto.getAnswer_id());
			pstmt.setString(2, dto.getAnswer_id());
			pstmt.setString(3, dto.getAnswer_content());
			pstmt.setString(4, qna_code);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public boolean teacherAnswer(String qna_code, String teacher_id) {
		int result = 0;
		String sql = "select qna_code from qna_content where qna_code=? and _id=?";
		ResultSet rs = null;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, qna_code);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}
}
