package com.favpost.model;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class FavpostDAO implements FavpostDAO_interface {

	private static javax.sql.DataSource ds = null;
	
	static {
		try {
			javax.naming.Context ctx = new javax.naming.InitialContext();
			ds = (javax.sql.DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (javax.naming.NamingException e) {
			e.printStackTrace(System.err);
		}
	}
	
	
	private static final String INSERT_STMT = "INSERT INTO favorite_post (mem_id, post_id) values (?, ?)";
	private static final String DELETE = "DELETE FROM favorite_post WHERE mem_id = ? and post_id = ?";
	private static final String GET_ONE_STMT = "SELECT * FROM favorite_post WHERE mem_id = ? and post_id = ?";
	// (join)
	private static final String GET_ALL_BY_M = "SELECT * FROM favorite_post WHERE mem_id = ?";
	private static final String GET_ALL_BY_P = "SELECT * FROM favorite_post WHERE post_id = ?";
	// (count)
	private static final String GET_ALL = "SELECT * FROM favorite_post ORDER BY post_id";
	
	@Override
	public void insert(FavpostVO favpostVO) {
		
		java.sql.Connection con = null;
		java.sql.PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, favpostVO.getMem_id());
			pstmt.setString(2, favpostVO.getPost_id());;
			
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
	public void delete(String mem_id, String post_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, mem_id);
			pstmt.setString(2, post_id);
			
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
	public FavpostVO findByPrimaryKey(String mem_id, String post_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FavpostVO favpostVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			favpostVO = new FavpostVO();
			
			pstmt.setString(1, mem_id);
			pstmt.setString(2, post_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				favpostVO.setMem_id(rs.getString("mem_id"));
				favpostVO.setPost_id(rs.getString("post_id"));
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
		return favpostVO;
	}

	@Override
	public List<FavpostVO> findByMem_id(String mem_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FavpostVO> list = null;
		FavpostVO favpostVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_M);
			list = new ArrayList<FavpostVO>();
			
			pstmt.setString(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				favpostVO = new FavpostVO();
				favpostVO.setMem_id(rs.getString("mem_id"));
				favpostVO.setPost_id(rs.getString("post_id"));
				list.add(favpostVO);
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
	public List<FavpostVO> findByPost_id(String post_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FavpostVO> list = null;
		FavpostVO favpostVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_P);
			list = new ArrayList<FavpostVO>();
			
			pstmt.setString(1, post_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				favpostVO = new FavpostVO();
				favpostVO.setMem_id(rs.getString("mem_id"));
				favpostVO.setPost_id(rs.getString("post_id"));
				list.add(favpostVO);
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
	public List<FavpostVO> getAll() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FavpostVO> list = null;
		FavpostVO favpostVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			list = new ArrayList<FavpostVO>();
			
			while (rs.next()) {
				favpostVO = new FavpostVO();
				favpostVO.setMem_id(rs.getString("mem_id"));
				favpostVO.setPost_id(rs.getString("post_id"));
				list.add(favpostVO);
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
