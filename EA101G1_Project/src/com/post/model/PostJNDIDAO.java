package com.post.model;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class PostJNDIDAO implements PostDAO_interface {

	private static javax.sql.DataSource ds = null;
	
	static {
		try {
			javax.naming.Context ctx = new javax.naming.InitialContext();
			ds = (javax.sql.DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (javax.naming.NamingException e) {
			e.printStackTrace(System.err);
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO post (post_id, mem_id, ptype_id, p_status, p_title, text, image, last_edit) VALUES ('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, SYSDATE)";
	private static final String GET_ALL_STMT = "SELECT post_id, mem_id, ptype_id, p_status, p_title, text, image, last_edit, post_time FROM post ORDER BY post_id";
	private static final String GET_ONE_STMT = "SELECT post_id, mem_id, ptype_id, p_status, p_title, text, image, last_edit, post_time FROM post WHERE post_id = ?";
	private static final String DELETE = "DELETE FROM post WHERE post_id = ?";
	private static final String UPDATE = "UPDATE post SET ptype_id = ?, p_status = ?, p_title = ?, text = ?, image = ?, last_edit = SYSDATE WHERE post_id = ?";

	
	@Override
	public String insert(PostVO postVO) {
		
		java.sql.Connection con = null;
		java.sql.PreparedStatement pstmt = null;
		java.sql.ResultSet rs = null;
		String generatedKey = "";
		
		try {
			con = ds.getConnection();
			String[] cols = {"post_id"};
			pstmt = con.prepareStatement(INSERT_STMT, cols);
			
			pstmt.setString(1, postVO.getMem_id());
			pstmt.setInt(2, postVO.getPtype_id());
			pstmt.setInt(3, postVO.getP_status());
			pstmt.setString(4, postVO.getP_title());
			pstmt.setString(5, postVO.getText());
			pstmt.setBytes(6, postVO.getImage());
			
			pstmt.executeUpdate();
			
			rs = pstmt.getGeneratedKeys();
			rs.next();
			generatedKey = rs.getString(1);
			
		} catch (java.sql.SQLException se) {
			throw new RuntimeException("A database error occurred. " + se.getMessage());
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return generatedKey;
	}

	@Override
	public void update(PostVO postVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, postVO.getPtype_id());
			pstmt.setInt(2, postVO.getP_status());
			pstmt.setString(3, postVO.getP_title());
			pstmt.setString(4, postVO.getText());
			pstmt.setBytes(5, postVO.getImage());
			pstmt.setString(6, postVO.getPost_id());
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occurred. " + se.getMessage());
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(String post_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, post_id);
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occurred. " + se.getMessage());
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public PostVO findByPrimaryKey(String post_id) {
		
		java.sql.Connection con = null;
		java.sql.PreparedStatement pstmt = null;
		java.sql.ResultSet rs = null;
		PostVO postVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, post_id);
			rs = pstmt.executeQuery();
			postVO = new PostVO();
			
			while (rs.next()) {
				postVO.setPost_id(rs.getString("post_id"));
				postVO.setMem_id(rs.getString("mem_id"));
				postVO.setPtype_id(rs.getInt("ptype_id"));
				postVO.setP_status(rs.getInt("p_status"));
				postVO.setP_title(rs.getString("p_title"));
				postVO.setText(rs.getString("text"));
				postVO.setImage(rs.getBytes("image"));
				postVO.setLast_edit(rs.getTimestamp("last_edit"));
				postVO.setPost_time(rs.getTimestamp("post_time"));
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occurred. " + se.getMessage());
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return postVO;
	}

	@Override
	public List<PostVO> getAll() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		java.util.List<PostVO> list = null;
		PostVO postVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			list = new java.util.ArrayList<PostVO>();
			
			while (rs.next()) {
				postVO = new PostVO();
				postVO.setPost_id(rs.getString("post_id"));
				postVO.setMem_id(rs.getString("mem_id"));
				postVO.setPtype_id(rs.getInt("ptype_id"));
				postVO.setP_status(rs.getInt("p_status"));
				postVO.setP_title(rs.getString("p_title"));
				postVO.setText(rs.getString("text"));
				postVO.setImage(rs.getBytes("image"));
				postVO.setLast_edit(rs.getTimestamp("last_edit"));
				postVO.setPost_time(rs.getTimestamp("post_time"));
				
				list.add(postVO);
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occurred. " + se.getMessage());
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

}
