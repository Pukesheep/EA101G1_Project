package com.ptype.model;

import java.sql.*;
import java.util.*;
import javax.naming.*;

public class PtypeDAO implements PtypeDAO_interface {

	private static javax.sql.DataSource ds = null;
	
	static {
		try {
			javax.naming.Context ctx = new javax.naming.InitialContext();
			ds = (javax.sql.DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace(System.err);
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO ptype (ptype_id, type) VALUES (ptype_seq.NEXTVAL, ?)";
	private static final String GET_ALL_STMT = "SELECT ptype_id, type FROM ptype ORDER BY ptype_id";
	private static final String GET_ONE_STMT = "SELECT ptype_id, type FROM ptype WHERE ptype_id = ?";
	private static final String DELETE = "DELETE FROM ptype WHERE ptype_id = ?";
	private static final String UPDATE = "UPDATE ptype SET type = ? WHERE ptype_id = ?";

	@Override
	public void insert(PtypeVO ptypeVO) {
		
		java.sql.Connection con = null;
		java.sql.PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, ptypeVO.getType());
			
			pstmt.executeUpdate();
			
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
	}

	@Override
	public void update(PtypeVO ptypeVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, ptypeVO.getType());
			pstmt.setInt(2, ptypeVO.getPtype_id());
			
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
	public void delete(Integer ptype_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, ptype_id);
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occurred." + se.getMessage());
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
	public PtypeVO findByPrimaryKey(Integer ptype_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PtypeVO ptypeVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, ptype_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ptypeVO = new PtypeVO();
				ptypeVO.setPtype_id(rs.getInt("ptype_id"));
				ptypeVO.setType(rs.getString("type"));
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
		
		
		return ptypeVO;
	}

	@Override
	public List<PtypeVO> getAll() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		java.util.List<PtypeVO> list = null;
		PtypeVO ptypeVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			list = new java.util.ArrayList<PtypeVO>();
			
			while (rs.next()) {
				ptypeVO = new PtypeVO();
				ptypeVO.setPtype_id(rs.getInt("ptype_id"));
				ptypeVO.setType(rs.getString("type"));
				list.add(ptypeVO);
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
