package com.comm.model;

import java.util.*;
import java.sql.*;
import javax.naming.*;

public class CommJNDIDAO implements CommDAO_interface {

	private static javax.sql.DataSource ds = null;
	
	static {
		try {
			javax.naming.Context ctx = new javax.naming.InitialContext();
			ds = (javax.sql.DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (javax.naming.NamingException e) {
			e.printStackTrace(System.err);
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO comm (comm_id, post_id, mem_id, c_status, c_text, last_edit) VALUES ('COMM'||LPAD(to_char(comm_seq.NEXTVAL), 6, '0'), ?, ?, ?, ?, SYSDATE)";
	private static final String GET_ALL_STMT = "SELECT comm_id, post_id, mem_id, c_status, c_text, last_edit, post_time FROM comm ORDER BY comm_id";
	private static final String GET_ONE_STMT = "SELECT comm_id, post_id, mem_id, c_status, c_text, last_edit, post_time FROM comm WHERE comm_id = ?";
	private static final String DELETE = "DELETE FROM comm WHERE comm_id = ?";
	private static final String UPDATE = "UPDATE comm SET c_status = ?, c_text = ?, last_edit = SYSDATE WHERE comm_id = ?";
	private static final String GET_COMM = "SELECT comm_id FROM comm WHERE post_id = ?";

	
	@Override
	public String insert(CommVO commVO) {
		
		java.sql.Connection con = null;
		java.sql.PreparedStatement pstmt = null;
		java.sql.ResultSet rs = null;
		String generatedKey = "";
		
		try {
			con = ds.getConnection();
			String[] cols = {"comm_id"};
			pstmt = con.prepareStatement(INSERT_STMT, cols);
			
			pstmt.setString(1, commVO.getPost_id());
			pstmt.setString(2, commVO.getMem_id());
			pstmt.setInt(3, commVO.getC_status());
			pstmt.setString(4, commVO.getC_text());
			
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
				} catch (java.sql.SQLException se) {
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
	public void update(CommVO commVO) {
		
		java.sql.Connection con = null;
		java.sql.PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, commVO.getC_status());
			pstmt.setString(2, commVO.getC_text());
			pstmt.setString(3, commVO.getComm_id());
			
			pstmt.executeUpdate();
			
		} catch (java.sql.SQLException se) {
			throw new RuntimeException("A database error occurred. " + se.getMessage());
		} finally {
			
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (java.sql.SQLException se) {
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
	public void delete(String comm_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, comm_id);
			
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
	public CommVO findByPrimaryKey(String comm_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommVO commVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			commVO = new CommVO();
			
			pstmt.setString(1, comm_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				commVO.setComm_id(rs.getString("comm_id"));
				commVO.setPost_id(rs.getString("post_id"));
				commVO.setMem_id(rs.getString("mem_id"));
				commVO.setC_status(rs.getInt("c_status"));
				commVO.setC_text(rs.getString("c_text"));
				commVO.setLast_edit(rs.getTimestamp("last_edit"));
				commVO.setPost_time(rs.getTimestamp("post_time"));
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
		return commVO;
	}

	@Override
	public List<CommVO> getAll() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		java.util.List<CommVO> list = null;
		CommVO commVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			list = new java.util.ArrayList<CommVO>();
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				commVO = new CommVO();
				commVO.setComm_id(rs.getString("comm_id"));
				commVO.setPost_id(rs.getString("post_id"));
				commVO.setMem_id(rs.getString("mem_id"));
				commVO.setC_status(rs.getInt("c_status"));
				commVO.setC_text(rs.getString("c_text"));
				commVO.setLast_edit(rs.getTimestamp("last_edit"));
				commVO.setPost_time(rs.getTimestamp("post_time"));
				list.add(commVO);
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

	@Override
	public CommVO findComm(String post_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommVO commVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_COMM);
			pstmt.setString(1, post_id);
			rs = pstmt.executeQuery();
			commVO = new CommVO();
			
			while (rs.next()) {
				commVO.setComm_id(rs.getString("comm_id"));
			}
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return commVO;
	}

}
