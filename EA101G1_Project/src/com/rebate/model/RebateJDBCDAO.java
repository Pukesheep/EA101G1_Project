package com.rebate.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.rebate.model.*;

public class RebateJDBCDAO implements RebateDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO REBATE(REB_NO,DISCOUNT,PEOPLE) VALUES ('R'||LPAD(REBATE_seq.NEXTVAL,9,'0'),?,?)";
	private static final String GET_ALL_STMT = "SELECT REB_NO,DISCOUNT,PEOPLE FROM REBATE order by REB_NO";
	private static final String GET_ONE_STMT = "SELECT REB_NO,DISCOUNT,PEOPLE FROM REBATE where REB_NO = ?";
	private static final String DELETE = "DELETE FROM REBATE where REB_NO = ?";
	private static final String UPDATE = "UPDATE REBATE set DISCOUNT=?, PEOPLE=? where REB_NO = ?";

	// "SELECT GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO, GROTIME_DATE, START_DATE,
	// END_DATE,MONEY,PEOPLE,STATUS FROM GROUPBUY order by GRO_ID";
	@Override
	public void insert(RebateVO rebateVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

//			pstmt.setString(1, rebateVO.getReb_No());
			pstmt.setInt(1, rebateVO.getDiscount());
			pstmt.setString(2, rebateVO.getPeople());

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
	public void update(RebateVO rebateVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, rebateVO.getReb_No());
			pstmt.setInt(2, rebateVO.getDiscount());
			pstmt.setString(3, rebateVO.getPeople());

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
	public void delete(String reb_No) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, reb_No);

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
	public RebateVO findByPrimaryKey(String reb_No) {

		RebateVO rebateVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, reb_No);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rebateVO = new RebateVO();
				rebateVO.setReb_No(rs.getString("reb_No"));
				rebateVO.setDiscount(rs.getInt("discount"));
				rebateVO.setPeople(rs.getString("people"));

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
		return rebateVO;
	}

	@Override
	public List<RebateVO> getAll() {
		List<RebateVO> list = new ArrayList<RebateVO>();
		RebateVO rebateVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				rebateVO = new RebateVO();
				rebateVO.setReb_No(rs.getString("reb_no"));
				rebateVO.setDiscount(rs.getInt("discount"));
				rebateVO.setPeople(rs.getString("people"));

				list.add(rebateVO); // Store the row in the list
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
		RebateJDBCDAO dao = new RebateJDBCDAO();
// 查詢全部    
//		List<RebateVO> list = dao.getAll();
//	for (RebateVO rebate : list) {
//		System.out.print(rebate.getReb_No() + ",");
//		System.out.print(rebate.getDiscount() + ",");
//		System.out.print(rebate.getPeople());		
//		System.out.println();

		// insert
//    RebateVO reb1 = new RebateVO();
////    reb1.setReb_No("R00000009");
//    reb1.setDiscount(5); 
//    reb1.setPeople("15");
//	dao.insert(reb1);
//	System.err.println("新增成功");

		// update
//	RebateVO reb1 = new RebateVO();
//	reb1.setReb_No("R000000009");
//  reb1.setDiscount(7); 
//  reb1.setPeople("10");
//	System.err.println("修改成功");

		// 刪除
//	dao.delete("R000000009");
//	System.err.println("刪除成功");

		RebateVO reb = dao.findByPrimaryKey("R000000001");
		System.out.print(reb.getReb_No() + ",");
		System.out.print(reb.getDiscount() + ",");
		System.out.print(reb.getPeople() + ",");
		System.err.println("成功");
		System.out.println("---------------------");

	}
}
