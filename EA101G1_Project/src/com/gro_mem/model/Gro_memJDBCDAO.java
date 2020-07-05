package com.gro_mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.favourite_gro.model.Favourite_groVO;
import com.gro_mem.model.*;
import com.rebate.model.RebateVO;

public class Gro_memJDBCDAO implements Gro_memDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO FAVOURITE_GRO(MEM_ID,GRO_ID) VALUES (?,?)";
	private static final String GET_ALL_STMT = "SELECT GRO_ID,MEM_ID FROM FAVOURITE_GRO order by GRO_ID";
	private static final String GET_ONE_STMT = "SELECT GRO_ID,MEM_ID FROM GRO_MEM where GRO_ID = ?";
	private static final String DELETE = "DELETE FROM GRO_MEM where GRO_ID = ?";
	private static final String UPDATE = "UPDATE GRO_MEM set GRO_ID=?, MEM_ID=? where GRO_ID = ?";

	// "SELECT GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO, GROTIME_DATE, START_DATE,
	// END_DATE,MONEY,PEOPLE,STATUS FROM GROUPBUY order by GRO_ID";
	@Override
	public void insert(Gro_memVO gro_memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, gro_memVO.getMem_Id());
			pstmt.setString(2, gro_memVO.getGro_Id());

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
	public void update(Gro_memVO gro_memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(2, gro_memVO.getGro_Id());
			pstmt.setString(1, gro_memVO.getMem_Id());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, mem_Id);

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
	public Gro_memVO findByPrimaryKey(String gro_Id) {

		Gro_memVO gro_memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, gro_Id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				gro_memVO = new Gro_memVO();
				gro_memVO.setMem_Id(rs.getString("mem_id"));
				gro_memVO.setGro_Id(rs.getString("gro_id"));
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
		return gro_memVO;
	}

	@Override
	public List<Gro_memVO> getAll() {
		List<Gro_memVO> list = new ArrayList<Gro_memVO>();
		Gro_memVO gro_memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				gro_memVO = new Gro_memVO();

				gro_memVO = new Gro_memVO();
				gro_memVO.setMem_Id(rs.getString("mem_id"));
				gro_memVO.setGro_Id(rs.getString("gro_id"));

				list.add(gro_memVO); // Store the row in the list
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any driver errors
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
		Gro_memJDBCDAO dao = new Gro_memJDBCDAO();

//查詢全部			
//		List<Gro_memVO> list = dao.getAll();
//	for (Gro_memVO gro_mem : list) {
//		System.out.print(gro_mem.getMem_Id() + ",");
//		System.out.print(gro_mem.getGro_Id());
//		System.out.println();

		// insert
		Gro_memVO gmem = new Gro_memVO();
		gmem.setMem_Id("M000004");
		gmem.setGro_Id("G000000006");
		dao.insert(gmem);
		System.err.println("新增成功");

		// update
//	RebateVO reb1 = new RebateVO();
//	reb1.setReb_No("R000000009");
//  reb1.setDiscount(7); 
//  reb1.setPeople("10");
//	System.err.println("更新成功");
	}

	// 刪除
//	dao.delete("R000000009");
//	System.err.println("刪除成功");
}