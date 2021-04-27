package com.member;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.util.MyUploadServlet;

@MultipartConfig
@WebServlet("/member/*")
public class MemberServlet extends MyUploadServlet {
	private static final long serialVersionUID = 1L;
	private String pathname;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		
		HttpSession session=req.getSession();
		// 이미지를 저장할 경로(pathname)
		String root=session.getServletContext().getRealPath("/");
		pathname=root+"uploads"+File.separator+"memberImages";
		
		if(uri.indexOf("login.do")!=-1) {
			loginForm(req, resp);
		} else if(uri.indexOf("login_ok.do")!=-1) {
			loginSubmit(req, resp);
		} else if(uri.indexOf("logout.do")!=-1) {
			logout(req, resp);
		} else if(uri.indexOf("member.do")!=-1) {
			memberForm(req, resp);
		} else if(uri.indexOf("member_ok.do")!=-1) {
			memberSubmit(req, resp);
		} else if(uri.indexOf("changePwd.do")!=-1) {
			changePwdForm(req, resp);
		} else if(uri.indexOf("changePwd_ok.do")!=-1) {
			changePwdSubmit(req, resp);
		} else if(uri.indexOf("update_ok.do")!=-1) {
			updateSubmit(req, resp);
		} else if(uri.indexOf("userIdCheck.do")!=-1) {
			userIdCheck(req, resp);
		}
	}

	private void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	}

	private void loginSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 처리
		// 세션객체. 세션 정보는 서버에 저장(로그인정보, 권한등을저장)
		HttpSession session=req.getSession();
		
		MemberDAO dao=new MemberDAO();
		String cp=req.getContextPath();
		
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		
		MemberDTO dto=dao.readMember(id);
		if(dto!=null) {
			if(pwd.equals(dto.getPwd())) {
				// 로그인 성공 : 로그인정보를 서버에 저장
				// 세션의 유지시간을 20분설정(기본 30분)
				session.setMaxInactiveInterval(20*60);
				
				// 세션에 저장할 내용
				Sessioninfo info=new Sessioninfo();
				info.setId(dto.getId());
				info.setMember_name(dto.getMember_name());
				info.setType(dto.getType());
				
				// 세션에 member이라는 이름으로 저장
				session.setAttribute("member", info);
				
				// 메인화면으로 리다이렉트
				resp.sendRedirect(cp);
				return;
			} 
		}
		
		// 로그인 실패인 경우(다시 로그인 폼으로)
		String msg="회원정보가 일치하지 않습니다.";
		req.setAttribute("message", msg);
		
		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	}
	
	private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그아웃
		HttpSession session=req.getSession();
		String cp=req.getContextPath();

		// 세션에 저장된 정보를 지운다.
		session.removeAttribute("member");
		
		// 세션에 저장된 모든 정보를 지우고 세션을 초기화 한다.
		session.invalidate();
		
		// 루트로 리다이렉트
		resp.sendRedirect(cp);
	}
	
	private void memberForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/member/signup.jsp");
	}

	private void memberSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String message;
		
		try {
			MemberDTO dto = new MemberDTO();
			dto.setId(req.getParameter("id"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setMember_name(req.getParameter("member_name"));
			dto.setType(req.getParameter("type"));
			
			String filename=null;
			Part p = req.getPart("member_picture_filename");
			Map<String, String> map = doFileUpload(p, pathname);
			if(map != null) {
				filename = map.get("saveFilename");
			}
			dto.setMember_picture_filename(filename);
			
			dao.insertMember(dto);
			
			String cp=req.getContextPath();
			resp.sendRedirect(cp);
			return;
		} catch (SQLException e) {
			if(e.getErrorCode()==1)
				message = "중복된 아이디입니다.";
			else
				message = "회원 가입 실패.";
		} catch (Exception e) {
			message = "회원 가입 실패.";
			e.printStackTrace();
		}
		
		req.setAttribute("message", message);
		forward(req, resp, "/WEB-INF/views/member/signup.jsp");
	}
	
	private void changePwdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/views/member/changePwd.jsp");
	}

	private void changePwdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = req.getSession();
		String result;
		
		try {
			MemberDTO dto = new MemberDTO();
			Sessioninfo info = (Sessioninfo)session.getAttribute("member");
			
			dto.setId(info.getId());
			
			if(dao.updateMemberPwd(dto, req.getParameter("newPwd"), req.getParameter("currentPwd")) == 0) {
				result = "현재 비밀번호를 확인해주세요.";
				req.setAttribute("result", result);
				forward(req, resp, "/WEB-INF/views/member/changePwd.jsp");
				return;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		logout(req, resp);
	}

	private void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	private void userIdCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}	
	

}
