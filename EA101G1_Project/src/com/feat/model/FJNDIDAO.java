package com.feat.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FJNDIDAO implements FDAO_interface {
	
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
			"INSERT INTO features_table (f_no,f_type) VALUES ('f'||LPAD(to_char(features_seq.NEXTVAL),6,'0'), ?)";
	private static final String UPDATE = 
			"UPDATE features_table set f_type=? where f_no = ?";
	private static final String DELETE = 
			"DELETE FROM features_table where f_no = ?";
	private static final String GET_ONE = 
			"SELECT f_no,f_type FROM features_table where f_no = ?";
	private static final String GET_ALL = 
			"SELECT f_no,f_type FROM features_table order by f_no";
	@Override
	public void insert(FVO fVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, fVO.getF_type());

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
	public void update(FVO fVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, fVO.getF_type());
			pstmt.setString(2, fVO.getF_no());

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
	public void delete(String f_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, f_no);

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
	public FVO findByPrimaryKey(String f_no) {
		
		FVO fVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setString(1, f_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				fVO = new FVO();
				fVO.setF_no(rs.getString("f_no"));
				fVO.setF_type(rs.getString("f_type"));
				
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
		return fVO;
	}
	@Override
	public List<FVO> getAll() {
		
		List<FVO> list = new ArrayList<FVO>();
		FVO fVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				fVO = new FVO();
				fVO.setF_no(rs.getString("f_no"));
				fVO.setF_type(rs.getString("f_type"));
				list.add(fVO); 
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
