package com.favImmed.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavImmedDAO implements com.favImmed.model.FavImmedDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";
	
	private static final String INSERT_STMT = "INSERT INTO FAV_IMMED(IMMED_ID,MEM_ID) VALUES (?,?)";
	private static final String GET_FAVIMMED_BY_MEM_STMT = "SELECT IMMED_ID , MEM_ID FROM FAV_IMMED WHERE MEM_ID = ?";
	private static final String GET_ONE_FAVIMMED_STMT = "SELECT IMMED_ID , MEM_ID FROM FAV_IMMED WHERE IMMED_ID=? AND MEM_ID=?";
	private static final String DELETE = "DELETE FROM FAV_IMMED WHERE IMMED_ID = ? AND MEM_ID = ?";
	@Override
	public void insert(FavImmedVO favImmedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);		
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,favImmedVO.getImmed_id());
			pstmt.setString(2,favImmedVO.getMem_id());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public void delete(String immed_id, String mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, immed_id);
			pstmt.setString(2, mem_id);
			
			pstmt.executeQuery();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public List<FavImmedVO> getFavImmedByMem(String mem_id) {
		List<FavImmedVO> list = new ArrayList<FavImmedVO>();
		FavImmedVO favImmedVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_FAVIMMED_BY_MEM_STMT);
			pstmt.setString(1,mem_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				favImmedVO = new FavImmedVO();
				
				favImmedVO.setMem_id(rs.getString("mem_id"));
				favImmedVO.setImmed_id(rs.getString("immed_id"));
				
				list.add(favImmedVO);
			}
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public FavImmedVO getOneFavImmed(String immed_id, String mem_id) {
		FavImmedVO favImmedVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_FAVIMMED_STMT);
			pstmt.setString(1,immed_id);
			pstmt.setString(2,mem_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				favImmedVO = new FavImmedVO();
				
				favImmedVO.setMem_id(mem_id);
				favImmedVO.setImmed_id(immed_id);
			}
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
		return favImmedVO;
	}
	
	
}
