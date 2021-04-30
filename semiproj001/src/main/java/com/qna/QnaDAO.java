package com.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class QnaDAO {

	private Connection conn = DBConn.getConnection();
	
	public List<QnaDTO> qnaList() {
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		String sql = "select qna_code, opened_code, question_title, question_name, "
				+ " question_date, answer_title, answer_name, answer_date from qna_content";
		try(PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_code(rs.getString("qna_code"));
				dto.setOpened_code(rs.getString("opened_code"));
				dto.setQuestion_title(rs.getString("question_title"));
				dto.setQuestion_name(rs.getString("question_name"));
				dto.setQuestion_date(rs.getString("question_date"));
				dto.setAnswer_title(rs.getString("answer_title"));
				dto.setAnswer_name(rs.getString("answer_name"));
				dto.setAnswer_date(rs.getString("answer_date"));
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
				dto.setAnswer_title(rs.getString("answer_title"));
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
		String sql = "update board_qna set answer_id=?, answer_content=?, answer_title=?, answer_date=sysdate "
				+ " where qna_code=?";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, dto.getAnswer_id());
			pstmt.setString(2, dto.getAnswer_content());
			pstmt.setString(3, dto.getAnswer_title());
			pstmt.setString(4, qna_code);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public boolean teacherAnswer(String qna_code, String teacher_id) {
		String sql = "select teacher_id from lecture l"
				+ " join (select l.lecture_code, q.qna_code from qna_content q, lecture_opened o, lecture l"
				+ " where q.opened_code = o.opened_code and o.lecture_code = l.lecture_code ) r on l.lecture_code = r.lecture_code "
				+ " where qna_code=?";
		ResultSet rs = null;
		String t_id = null;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, qna_code);
			rs=pstmt.executeQuery();
			if(rs.next())
				t_id = rs.getString("teacher_id");
			
			if(t_id.equals(teacher_id))
				return true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public int insertQuestion(QnaDTO dto) throws SQLException {
		int result = 0;
		String sql = "INSERT INTO board_qna(qna_code, question_id, question_name, "
				+ "question_title, question_content, question_date) "
				+ " VALUES(?,?,?,?,?,SYSDATE) ";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, dto.getQna_code());
			pstmt.setString(2, dto.getQuestion_id());
			pstmt.setString(3, dto.getQuestion_name());
			pstmt.setString(4, dto.getQuestion_title());
			pstmt.setString(5, dto.getQuestion_content());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
		
	}
}
