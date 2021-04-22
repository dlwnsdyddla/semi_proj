package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/*")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		} else if(uri.indexOf("pwd.do")!=-1) {
			pwdForm(req, resp);
		} else if(uri.indexOf("pwd_ok.do")!=-1) {
			pwdSubmit(req, resp);
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

	}

	private void memberSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	private void pwdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	private void pwdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	private void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	private void userIdCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}	
	

}
