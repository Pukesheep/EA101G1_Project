package com.favourite_gro.model;

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


public class Favourite_groDAO implements Favourite_groDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = "INSERT INTO FAVOURITE_GRO(MEM_ID,GRO_ID) VALUES (?,?)";
	private static final String GET_ALL_STMT = "SELECT MEM_ID,GRO_ID FROM FAVOURITE_GRO order by MEM_ID";
	private static final String GET_ONE_STMT = "SELECT MEM_ID,GRO_ID FROM FAVOURITE_GRO where MEM_ID = ?";
	private static final String DELETE = "DELETE FROM FAVOURITE_GRO where MEM_ID = ?";
	private static final String UPDATE = "UPDATE FAVOURITE_GRO set MEM_ID=?,GRO_ID=? where MEM_ID = ?";

	@Override
	public void insert(Favourite_groVO favourite_groVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, favourite_groVO.getMem_Id());
			pstmt.setString(2, favourite_groVO.getGro_Id());

			pstmt.executeUpdate();

	
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
	public void update(Favourite_groVO favourite_groVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, favourite_groVO.getMem_Id());
			pstmt.setString(2, favourite_groVO.getGro_Id());
			pstmt.executeUpdate();

			pstmt.executeUpdate();
		
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
	public void delete(String mem_Id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setString(1, mem_Id);

			pstmt.executeUpdate();
		
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
	public Favourite_groVO findByPrimaryKey(String mem_Id) {

		Favourite_groVO favourite_groVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, mem_Id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				favourite_groVO = new Favourite_groVO();
				favourite_groVO.setMem_Id(rs.getString("mem_id"));
				favourite_groVO.setGro_Id(rs.getString("gro_id"));

			}
		
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
		return favourite_groVO;
	}

	@Override
	public List<Favourite_groVO> getAll() {
		List<Favourite_groVO> list = new ArrayList<Favourite_groVO>();
		Favourite_groVO favourite_groVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				favourite_groVO = new Favourite_groVO();
				favourite_groVO.setMem_Id(rs.getString("mem_id"));
				favourite_groVO.setGro_Id(rs.getString("gro_id"));

				list.add(favourite_groVO); // Store the row in the list
			}
	
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

	public static void main(String[] args) {
		Favourite_groJDBCDAO dao = new Favourite_groJDBCDAO();
		List<Favourite_groVO> list = dao.getAll();
//查詢全部
//	for (Favourite_groVO favourite_gro : list) {
//		System.out.print(favourite_gro.getMem_Id() + ",");
//		System.out.print(favourite_gro.getGro_Id());
//		System.out.println();
		// 刪除
//		dao.delete("M000002");
//		System.out.println("成功");

		// insert
		Favourite_groVO f1 = new Favourite_groVO();
		f1.setMem_Id("M000003");
		f1.setGro_Id("G000000002");
		dao.insert(f1);
		System.err.println("新增成功");

		// update
//		Favourite_groVO f1=new Favourite_groVO();
//		f1.setGro_Id("G000000004");
//		f1.setMem_Id("M000004");
//		System.err.println("更新成功");
	}
}
