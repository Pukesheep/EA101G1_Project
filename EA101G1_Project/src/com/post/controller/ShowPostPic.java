package com.post.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;
import com.post.model.*;

//@WebServlet("/ShowPostPic")
public class ShowPostPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	java.sql.Connection con;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("image/gif");
		javax.servlet.ServletOutputStream out = res.getOutputStream();
		
		try {
			String post_id = req.getParameter("post_id");
			PostService postSvc = new PostService();
			PostVO postVO = postSvc.getOnePost(post_id);
			byte[] image = postVO.getImage();
			out.write(image);
			
		} catch (Exception e) {
			java.io.InputStream in = getServletContext().getResourceAsStream("/NoData/null2.jpg");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
		
	}

	public void init() throws ServletException {
		try {
			javax.naming.Context ctx = new javax.naming.InitialContext();
			javax.sql.DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
			con = ds.getConnection();
		} catch (javax.naming.NamingException ne) {
			ne.printStackTrace(System.err);
		} catch (java.sql.SQLException se) {
			se.printStackTrace(System.err);
		}
	}
	
	public void destroy() {
		try {
			if (con != null) {
				con.close();
			}
		} catch (java.sql.SQLException se) {
			se.printStackTrace(System.err);
		}
	}
}
