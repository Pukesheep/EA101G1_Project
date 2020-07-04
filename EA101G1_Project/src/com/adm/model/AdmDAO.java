package com.adm.model;

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

public class AdmDAO implements AdmDAO_interface{
	
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
			"INSERT INTO administrator (adm_no,adm_acco,adm_pass,adm_name,adm_state) VALUES ('ad'||LPAD(to_char(administrator_seq.NEXTVAL),6,'0'), ?, ?, ?, ?)";
	private static final String UPDATE = 
			"UPDATE administrator set adm_acco=?, adm_pass=?, adm_name=?, adm_state=? where adm_no = ?";
	private static final String DELETE = 
			"DELETE FROM administrator where adm_no = ?";
	private static final String GET_ONE = 
			"SELECT adm_no,adm_acco,adm_pass,adm_name,adm_state FROM administrator where adm_no = ?";
	private static final String GET_ALL = 
			"SELECT adm_no,adm_acco,adm_pass,adm_name,adm_state FROM administrator order by adm_no";
	private static final String LOGIN = "SELECT adm_no FROM administrator WHERE adm_acco = ?";
	
	@Override
	public void insert(AdmVO admVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, admVO.getAdm_acco());
			pstmt.setString(2, admVO.getAdm_pass());
			pstmt.setString(3, admVO.getAdm_name());
			pstmt.setInt(4, admVO.getAdm_state());

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
	public void update(AdmVO admVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, admVO.getAdm_acco());
			pstmt.setString(2, admVO.getAdm_pass());
			pstmt.setString(3, admVO.getAdm_name());
			pstmt.setInt(4, admVO.getAdm_state());
			pstmt.setString(5, admVO.getAdm_no());

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
	public AdmVO findByPrimaryKey(String adm_no) {
		
		AdmVO admVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setString(1, adm_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				admVO = new AdmVO();
				admVO.setAdm_no(rs.getString("adm_no"));
				admVO.setAdm_acco(rs.getString("adm_acco"));
				admVO.setAdm_pass(rs.getString("adm_pass"));
				admVO.setAdm_name(rs.getString("adm_name"));
				admVO.setAdm_state(rs.getInt("adm_state"));
				
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
		return admVO;
	}
	@Override
	public List<AdmVO> getAll() {
		
		List<AdmVO> list = new ArrayList<AdmVO>();
		AdmVO admVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				admVO = new AdmVO();
				admVO.setAdm_no(rs.getString("adm_no"));
				admVO.setAdm_acco(rs.getString("adm_acco"));
				admVO.setAdm_pass(rs.getString("adm_pass"));
				admVO.setAdm_name(rs.getString("adm_name"));
				admVO.setAdm_state(rs.getInt("adm_state"));
				list.add(admVO); 
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
	
	@Override
	public String loginByAcco(String adm_acco) {
		
		java.sql.Connection con = null;
		java.sql.PreparedStatement pstmt = null;
		java.sql.ResultSet rs = null;
		String adm_no = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(LOGIN);
			pstmt.setString(1, adm_acco);
			rs = pstmt.executeQuery();
			rs.next();
			adm_no = rs.getString("adm_no");
			
		} catch (SQLException se) {
			return null;
//			throw new RuntimeException("A database error occurred. " + se.getMessage());
		}
		return adm_no;
	}
	
	

}
