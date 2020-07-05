package com.auth.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthJDBCDAO implements AuthDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "EA101G1";
	String password = "123456";

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

			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(INSERT);

			pstmt.setString(1, authVO.getAdm_no());
			pstmt.setString(2, authVO.getF_no());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, adm_no);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(GET_ONE);

			pstmt.setString(1, adm_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				authVO = new AuthVO();
				authVO.setAdm_no(rs.getString("adm_no"));
				authVO.setF_no(rs.getString("f_no"));
				
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				authVO = new AuthVO();
				authVO.setAdm_no(rs.getString("adm_no"));
				authVO.setF_no(rs.getString("f_no"));
				list.add(authVO); 
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

	
	public static void main(String[] args) {

		AuthJDBCDAO dao = new AuthJDBCDAO();

		// 新增
//		AuthVO authVO1 = new AuthVO();
//		authVO1.setAdm_no("ad000003");
//		authVO1.setF_no("f000004");
//		dao.insert(authVO1);


		// 刪除
//		dao.delete("ad000006");

		// 查詢
//		AuthVO admVO3 = dao.findByPrimaryKey("ad000001");
//		System.out.print(admVO3.getAdm_no() + ",");
//		System.out.print(admVO3.getF_no());

		// 查詢
		List<AuthVO> list = dao.getAll();
		for (AuthVO aAuth : list) {
			System.out.print(aAuth.getAdm_no() + ",");
			System.out.print(aAuth.getF_no() + ",");
			System.out.println();
		}
	}

}
