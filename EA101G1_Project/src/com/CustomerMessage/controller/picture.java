package com.CustomerMessage.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.sql.DataSource;
@MultipartConfig
public class picture extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

    req.setCharacterEncoding("UTF-8");
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			String cm_id = req.getParameter("cm_id").trim();
			ResultSet rs = stmt.executeQuery(
				"SELECT cm_pic FROM CUSTOMER_MESSAGE WHERE cm_id='"+cm_id+"'");

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("cm_pic"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				InputStream in=getServletContext().getResourceAsStream("/NoData/null2.jpg");
				byte[] b=new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			InputStream in=getServletContext().getResourceAsStream("/NoData/null2.jpg");
			byte[] b=new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}