package com.auth.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AuthDAO implements AuthDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT = 
			"INSERT INTO authority_table (adm_no,f_no) VALUES (?, ?)";
	private static final String DELETE = 
			"DELETE FROM authority_table where adm_no = ?";
	private static final String GET_ONE = 
			"SELECT adm_no,f_no FROM authority_table where adm_no = ?";
	private static final String GET_ALL = 
			"SELECT adm_no,f_no FROM authority_table order by adm_no";
	@Override
	public void insert(AuthVO authVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, authVO.getAdm_no());
			pstmt.setString(2, authVO.getF_no());

			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException(
			se.getMessage());
			
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
	public void delete(String adm_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, adm_no);

			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException(
			se.getMessage());
			
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
	public AuthVO findByPrimaryKey(String adm_no) {
		
		AuthVO authVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setString(1, adm_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				authVO = new AuthVO();
				authVO.setAdm_no(rs.getString("adm_no"));
				authVO.setF_no(rs.getString("f_no"));
				
			}
			
		} catch (SQLException se) {
			throw new RuntimeException(
			se.getMessage());
			
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
		return authVO;
	}
	@Override
	public List<AuthVO> getAll() {
		
		List<AuthVO> list = new ArrayList<AuthVO>();
		AuthVO authVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				authVO = new AuthVO();
				authVO.setAdm_no(rs.getString("adm_no"));
				authVO.setF_no(rs.getString("f_no"));
				list.add(authVO); 
			}
			
		} catch (SQLException se) {
			throw new RuntimeException(
			se.getMessage());
			
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
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
