package com.ptype.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.post.model.PostVO;

import oracle.sql.BLOB;
import oracle.sql.CLOB;

public class PtypeJDBCDAO implements PtypeDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";
	
	private static final String INSERT_STMT = "INSERT INTO ptype (ptype_id, type) VALUES (ptype_seq.NEXTVAL, ?)";
	private static final String GET_ALL_STMT = "SELECT ptype_id, type FROM ptype ORDER BY ptype_id";
	private static final String GET_ONE_STMT = "SELECT ptype_id, type FROM ptype WHERE ptype_id = ?";
	private static final String DELETE = "DELETE FROM ptype WHERE ptype_id = ?";
	private static final String UPDATE = "UPDATE ptype SET type = ? WHERE ptype_id = ?";
	
	@Override
	public void insert(PtypeVO ptypeVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, ptypeVO.getType());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	}
	
	@Override
	public void update(PtypeVO ptypeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, ptypeVO.getType());
			pstmt.setInt(2, ptypeVO.getPtype_id());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	}
	
	@Override
	public void delete(Integer ptype_id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, ptype_id);
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	}
	
	@Override
	public PtypeVO findByPrimaryKey(Integer ptype_id) {

		PtypeVO ptypeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, ptype_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				ptypeVO = new PtypeVO();
				ptypeVO.setPtype_id(rs.getInt("ptype_id"));
				ptypeVO.setType(rs.getString("type"));
				
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
		return ptypeVO;
	}
	
	@Override
	public List<PtypeVO> getAll() {

		List<PtypeVO> list = new ArrayList<PtypeVO>();
		PtypeVO ptypeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				ptypeVO = new PtypeVO();
				ptypeVO.setPtype_id(rs.getInt("ptype_id"));
				ptypeVO.setType(rs.getString("type"));
				list.add(ptypeVO);
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
		return list;
	}
	
	public static void main(String[] args) {
		
		PtypeJDBCDAO dao = new PtypeJDBCDAO();
		
		// 新增
		PtypeVO ptypeVO1 = new PtypeVO();
		ptypeVO1.setType("比賽流程");
		dao.insert(ptypeVO1);
		
		// 修改
		PtypeVO ptypeVO2 = new PtypeVO();
		ptypeVO2.setPtype_id(1);
		ptypeVO2.setType("123123");
		dao.update(ptypeVO2);
		
		// 刪除
		dao.delete(4);
		
		// 查詢
		PtypeVO ptypeVO3 = dao.findByPrimaryKey(1);
		System.out.println(ptypeVO3.getPtype_id() + ",");
		System.out.println(ptypeVO3.getType());
		System.out.println("===========================");
		
		// 查詢所有
		List<PtypeVO> list = dao.getAll();
		for (PtypeVO aptype : list) {
			System.out.println(aptype.getPtype_id() + ",");
			System.out.println(aptype.getType());
			System.out.println("===========================");
		}
		
	}
}
