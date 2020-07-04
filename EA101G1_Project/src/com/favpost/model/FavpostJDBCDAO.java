package com.favpost.model;

import java.sql.*;
import java.util.*;

public class FavpostJDBCDAO implements FavpostDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";
	
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
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, favpostVO.getMem_id());
			pstmt.setString(2, favpostVO.getPost_id());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database drive. " + e.getMessage());
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
	public void delete(String mem_id, String post_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, mem_id);
			pstmt.setString(2, post_id);
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			favpostVO = new FavpostVO();
			
			pstmt.setString(1, mem_id);
			pstmt.setString(2, post_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				favpostVO.setMem_id(rs.getString("mem_id"));
				favpostVO.setPost_id(rs.getString("post_id"));
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
		java.util.List<FavpostVO> list = null;
		FavpostVO favpostVO = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_BY_M);
			list = new java.util.ArrayList<FavpostVO>();
			
			pstmt.setString(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				favpostVO = new FavpostVO();
				favpostVO.setMem_id(rs.getString("mem_id"));
				favpostVO.setPost_id(rs.getString("post_id"));
				list.add(favpostVO);
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
		java.util.List<FavpostVO> list = null;
		FavpostVO favpostVO = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_BY_P);
			list = new java.util.ArrayList<FavpostVO>();
			
			pstmt.setString(1, post_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				favpostVO = new FavpostVO();
				favpostVO.setMem_id(rs.getString("mem_id"));
				favpostVO.setPost_id(rs.getString("post_id"));
				list.add(favpostVO);
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
				} catch (SQLException e) {
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
		java.util.List<FavpostVO> list = null;
		FavpostVO favpostVO = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			list = new java.util.ArrayList<FavpostVO>();
			
			while (rs.next()) {
				favpostVO = new FavpostVO();
				favpostVO.setMem_id(rs.getString("mem_id"));
				favpostVO.setPost_id(rs.getString("post_id"));
				list.add(favpostVO);
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	
	public static void main(String[] args) {
		
		FavpostJDBCDAO dao = new FavpostJDBCDAO();
		
		// 新增
		FavpostVO favpostVO1 = new FavpostVO();
		favpostVO1.setMem_id("M000011");
		favpostVO1.setPost_id("POST000001");
		dao.insert(favpostVO1);
//		
		favpostVO1.setMem_id("M000009");
		favpostVO1.setPost_id("POST000006");
		dao.insert(favpostVO1);
		
		// 刪除
		dao.delete("M000005", "POST000002");
		
		// 查詢單筆
		FavpostVO favpostVO2 = dao.findByPrimaryKey("M000011", "POST000001");
		System.out.println("MEM_ID = " + favpostVO2.getMem_id());
		System.out.println("POST_ID = " + favpostVO2.getPost_id());
		
		// 查會員全部收藏文章
		java.util.List<FavpostVO> list1 = dao.findByMem_id("M000008");
		for (FavpostVO favpost : list1) {
			System.out.println("MEM_ID = " + favpost.getMem_id());
			System.out.println("POST_ID = " + favpost.getPost_id());
			System.out.println("================================");
		}
		
		// 查文章所有收藏者
		List<FavpostVO> list2 = dao.findByPost_id("POST000001");
		for (FavpostVO favpost : list2) {
			System.out.println("MEM_ID = " + favpost.getMem_id());
			System.out.println("POST_ID = " + favpost.getPost_id());
			System.out.println("================================");
		}
		
		// 查所有收藏文章
		List<FavpostVO> list3 = dao.getAll();
		for (FavpostVO favpost : list3) {
			System.out.println("MEM_ID = " + favpost.getMem_id());
			System.out.println("POST_ID = " + favpost.getPost_id());
			System.out.println("================================");
		}
		
		
		
		
		
	}
	
	
	
}
