package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDaoImpl;
import com.login.dto.LoginDto;

/**
 * Servlet implementation class UserBoardController
 */
@WebServlet("/controller.do")
public class UserBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserBoardController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		LoginDaoImpl dao = new LoginDaoImpl();

		if (command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			HttpSession session = request.getSession();
			LoginDto dto = dao.selectLogin(id, pw);
			if (dto != null) {

				session.setAttribute("dto", dto);
				if (dto.getGrade().equals("ADMIN")) {
					response.sendRedirect("Admin.jsp");
				} else if (dto.getGrade().equals("MANAGER")) {
					response.sendRedirect("Manager.jsp");
				} else if (dto.getGrade().equals("USER")) {
					response.sendRedirect("User.jsp");
				}
			} else {
				jsResponse("id/pw를 다시 확인해주세요.", "Login.jsp", response);
			}

		} else if (command.equals("UserList")) {
			List<LoginDto> list = dao.selectAll();
			System.out.println("들어오냐");
			request.setAttribute("list", list);
			dispatch("UserList.jsp", request, response);

		} else if (command.equals("detail")) {
			int no = Integer.parseInt(request.getParameter("no"));
			LoginDto dto = dao.selectOne(no);

			request.setAttribute("dto", dto);
			dispatch("Detail.jsp", request, response);
		} else if (command.equals("updateGrade")) {
			String no = request.getParameter("no");
			String grade = request.getParameter("grade");

			int res = dao.updateGrade(no, grade);
			if (res > 0) {
				dispatch("UserList.jsp", request, response);
				System.out.println("성공");
			} else {
				dispatch("UserList.jsp", request, response);
				System.out.println("실패");
			}

		} else if (command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("Login.jsp");
		} else if (command.equals("Member")) {
			response.sendRedirect("Member.jsp");
		} else if (command.equals("insert")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String nikname = request.getParameter("nikname");
			String email = request.getParameter("email");
			String phone1 = request.getParameter("phone");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String phone = phone1 + "-" + phone2 + "-" + phone3;
			String addr = request.getParameter("addr");
			String subaddr = request.getParameter("subaddr");
			LoginDto dto = new LoginDto(id, pw, name, nikname, email, phone, addr, subaddr);
			int res = dao.insert(dto);
			if (res > 0) {
				dispatch("Login.jsp", request, response);
			} else {
				dispatch("Member.jsp", request, response);
			}
		} else if (command.equals("idchk")) {
			String id = request.getParameter("id");
			LoginDto dto = dao.idchk(id);
			String result = "duplicate";
			if (dto == null) {
				result = "ok";
			}
			PrintWriter out = response.getWriter();
			out.println(result);

		} else if (command.equals("nichk")) {
			String nikname = request.getParameter("nikname");
			LoginDto dto = dao.nichk(nikname);
			String result = "duplicate";
			if (dto == null) {
				result = "ok";
			}
			PrintWriter out = response.getWriter();
			out.println(result);
		} else if (command.equals("emailchk")) {
			String email = request.getParameter("email");
			LoginDto dto = dao.emailchk(email);
			String result = "duplicate";
			if(dto==null) {
				result="ok";
			}
			PrintWriter out = response.getWriter();
			out.println(result);
		} else if (command.equals("updateOut")) {
			int no = Integer.parseInt(request.getParameter("no"));
			int res = dao.updateOut(no);
			if (res > 0) {
				jsResponse("탈퇴성공", "Login.jsp", response);
			} else {
				jsResponse("탈퇴실패", "User.jsp", response);
			}

		} else if (command.equals("selectId")) {
			String name = request.getParameter("name");
			System.out.println(name);
			String email = request.getParameter("email");
			System.out.println(email);
			LoginDto dto = dao.selectId(name, email);
			request.setAttribute("dto", dto);
			dispatch("Id.jsp", request, response);
		} else if (command.equals("selectPw")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			LoginDto dto = dao.selectPw(id, name, email);
			request.setAttribute("dto", dto);
			dispatch("Pw.jsp", request, response);
		} else if (command.equals("update")) {
			String pw = request.getParameter("pw");
			String email = request.getParameter("email");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String phone = phone1+phone2+ phone3;
			String addr = request.getParameter("addr");
			String subaddr = request.getParameter("subaddr");
			int no = Integer.parseInt(request.getParameter("no"));
			
			LoginDto dto = new LoginDto(no,pw,email,phone,addr,subaddr);
			int res = dao.update(dto);
			if (res > 0) {
				dispatch("User.jsp", request, response);
			} else {
				dispatch("User.jsp", request, response);
			}
		}

	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type=\"text/javascript\">" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";

		PrintWriter out = response.getWriter();
		out.print(s);
	}
}
