package com.KoreaIT.java.Jsp_AM.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.KoreaIT.java.Jsp_AM.util.DBUtil;
import com.KoreaIT.java.Jsp_AM.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/member/doJoin")
public class MemberDoJoinServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		// DB연결
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스가 없습니다.");
			e.printStackTrace();
		}

		String url = "jdbc:mysql://127.0.0.1:3306/JSP_AM?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";
		String user = "root";
		String password = "";

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(url, user, password);

			String loginId = request.getParameter("loginId");
			String loginPw = request.getParameter("loginPw");
			String ConfirmloginPw = request.getParameter("ConfirmloginPw");
			String name = request.getParameter("name");

			SecSql sql = SecSql.from("SELECT COUNT(*) > 0");
			sql.append("FROM `member`");
			sql.append("WHERE loginId = ?;", loginId);

			boolean isLoginIdDup = DBUtil.selectRowBooleanValue(conn, sql);
			while (true) {
				if (isLoginIdDup) {
					response.getWriter().append("<script>alert('입력한 아이디는 사용중입니다.'); location.replace('join')");
					break;
				} else if (loginId.length() == 0 || loginId.contains(" ")) {
					response.getWriter().append("<script>alert('아이디를 다시 입력해주세요.'); location.replace('join')");
					break;
				} else if (loginPw.length() == 0 || loginPw.contains(" ")) {
					response.getWriter().append("<script>alert('비밀번호를 다시 입력해주세요.'); location.replace('join')");
					break;
				} else if (name.length() == 0|| name.contains(" ")) {
					response.getWriter().append("<script>alert('이름은 공백으로 둘 수 없습니다.'); location.replace('join')");
					break;
				} else if (loginPw != ConfirmloginPw) {
					response.getWriter().append("<script>alert('비밀번호가 일치하지 않습니다.'); location.replace('join')");
					break;
				} else 

					sql = SecSql.from("INSERT INTO`member`");
					sql.append("SET regDate = NOW(),");
					sql.append("loginId = ?,", loginId);
					sql.append("loginPw = ?,", loginPw);
					sql.append("`name` = ?;", name);

					int id = DBUtil.insert(conn, sql);

					response.getWriter().append(String
							.format("<script>alert('%d번 회원이 등록되었습니다.'); location.href='../home/main';</script>", id));
					break;
				
			}
		} catch (SQLException e) {
			System.out.println("에러 : " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}