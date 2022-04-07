package com.Action;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DataBase.MyDb;

@WebServlet("/LoginReg")
public class LoginReg extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginReg() throws Exception {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String action_flag = request.getParameter("action_flag");
		System.out.println("action_flag----->>" + action_flag);
		if (action_flag.equals("userLogin")) {
			try {
				userLogin(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action_flag.equals("adminLogin")) {
			try {
				adminLogin(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (action_flag.equals("userReg")) {
			try {
				userReg(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void userLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String path = request.getContextPath();
		if (passwd == "" | id == "") {
			response.sendRedirect(path + "/userLogin.jsp");
		}
		MyDb service = new MyDb();
		service.getConn("social_web", "root", "123456");
		boolean flag = service.matchUser(id, passwd);
		if (flag) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", id);
			String sql1 = String.format("select * from users where user_id='%s'", id);
			ResultSet rs = service.executeQuery1(sql1);
			rs.next();
			String nickname = rs.getString("user_nickname");
			session.setAttribute("nickname", nickname);
			service.closeConn();
			response.sendRedirect(path + "/loginSuccess.jsp");

		} else {
			service.closeConn();
			response.sendRedirect(path + "/loginFail.jsp");

		}
	}

	protected void userReg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String ques = request.getParameter("ques");
		String ans = request.getParameter("ans");
		String path = request.getContextPath();
		if (passwd == "" | id == "") {
			response.sendRedirect(path + "/userLogin.jsp");
			return;
		}
		MyDb service = new MyDb();
		service.getConn("social_web", "root", "123456");

		boolean flag = service.addUser(id, passwd, nickname, email, ques, ans);
		if (flag) {
			service.closeConn();
			response.sendRedirect(path + "/regSuccess.jsp");
		} else {
			service.closeConn();
			response.sendRedirect(path + "/regFail.jsp");
		}
	}

	protected void adminLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String path = request.getContextPath();
		if (passwd == "" | id == "") {
			response.sendRedirect(path + "/adminLogin.jsp");
		}
		MyDb service = new MyDb();
		service.getConn("social_web", "root", "123456");
		boolean flag = service.matchAdmin(id, passwd);
		if (flag) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", id);
			String sql1 = String.format("select * from admins where admin_id='%s'", id);
			ResultSet rs = service.executeQuery1(sql1);
			rs.next();
			String nickname = rs.getString("admin_nickname");
			session.setAttribute("nickname", nickname);
			service.closeConn();
			response.sendRedirect(path + "/adminLoginSuccess.jsp");
		} else {
			service.closeConn();
			response.sendRedirect(path + "/adminloginFail.jsp");
		}
	}

}
