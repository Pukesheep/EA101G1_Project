package com.gro_order.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gro_order.model.*;

public class Gro_orderJDBCDAO implements Gro_orderDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO GRO_ORDER(ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE) VALUES ('O'||LPAD(GRO_ORDER_seq.NEXTVAL,9,'0'),?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE FROM GRO_ORDER order by ORD_ID";
	private static final String GET_ONE_STMT = "SELECT ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE FROM GRO_ORDER where ORD_ID = ?";
	private static final String DELETE = "DELETE FROM GRO_ORDER where ORD_ID = ?";
	private static final String UPDATE = "UPDATE GRO_ORDER set MEM_ID=?, ORDSTAT_ID=?, GRO_ID=? where ORD_ID = ?";

	// "SELECT GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO, GROTIME_DATE, START_DATE,
	// END_DATE,MONEY,PEOPLE,STATUS FROM GROUPBUY order by GRO_ID";
	@Override
	public void insert(Gro_orderVO gro_orderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, gro_orderVO.getMem_Id());
			pstmt.setString(2, gro_orderVO.getOrdstat_Id());
			pstmt.setString(3, gro_orderVO.getGro_Id());
			pstmt.setTimestamp(4, gro_orderVO.getAdd_Date());

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
	public void update(Gro_orderVO gro_orderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			//UPDATE GRO_ORDER set MEM_ID=?, ORDSTAT_ID=?, GRO_ID=? where ORD_ID = ?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1,gro_orderVO.getMem_Id());
			pstmt.setString(2, gro_orderVO.getOrdstat_Id());
			pstmt.setString(3, gro_orderVO.getGro_Id());
			pstmt.setString(4, gro_orderVO.getOrd_Id());
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
	public void delete(String ord_Id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, ord_Id);

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
	public Gro_orderVO findByPrimaryKey(String ord_Id) {

		Gro_orderVO gro_orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, ord_Id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				gro_orderVO = new Gro_orderVO();
				gro_orderVO.setOrd_Id(rs.getString("ord_id"));
				gro_orderVO.setMem_Id(rs.getString("mem_id"));
				gro_orderVO.setOrdstat_Id(rs.getString("ordstat_id"));
				gro_orderVO.setGro_Id(rs.getString("gro_id"));
				gro_orderVO.setAdd_Date(rs.getTimestamp("add_date"));

			}

//GET_ONE_STMT = "SELECT ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE FROM GRO_ORDER where GRO_ID = ?";
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
		return gro_orderVO;
	}

	@Override
	public List<Gro_orderVO> getAll() {
		List<Gro_orderVO> list = new ArrayList<Gro_orderVO>();
		Gro_orderVO gro_orderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				gro_orderVO = new Gro_orderVO();
				gro_orderVO.setOrd_Id(rs.getString("ord_id"));
				gro_orderVO.setMem_Id(rs.getString("mem_id"));
				gro_orderVO.setOrdstat_Id(rs.getString("ordstat_id"));
				gro_orderVO.setGro_Id(rs.getString("gro_id"));
				gro_orderVO.setAdd_Date(rs.getTimestamp("add_date"));

				list.add(gro_orderVO); // Store the row in the list
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
		Gro_orderJDBCDAO dao = new Gro_orderJDBCDAO();

//		List<Gro_orderVO> list = dao.getAll();
//	for (Gro_orderVO gro_order : list) {
//		System.out.print(gro_order.getOrd_Id() + ",");
//		System.out.print(gro_order.getMem_Id() + ",");
//		System.out.print(gro_order.getOrdstat_Id());
//		System.out.print(gro_order.getGro_Id());
//		System.out.print(gro_order.getAdd_Date());	
//		System.out.println();
//	}
		// 刪除
//		dao.delete("O000000002");
		
//		INSERT INTO GRO_ORDER(ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE) VALUES ('O'||LPAD(GRO_ORDER_seq.NEXTVAL,9,'0'),?,?,?,?)
//		Timestamp timestamp = new Timestamp(new Date().getTime());
		// insert
//		Gro_orderVO ord = new Gro_orderVO();
//		// ord.setOrd_Id("O000000005");
//		ord.setMem_Id("M000003");
//		ord.setOrdstat_Id("003");
//		ord.setGro_Id("G000000002");
//		ord.setAdd_Date(new Timestamp(System.currentTimeMillis()));
//		dao.insert(ord);
//		System.err.println("新增成功");

		// update
//		Gro_orderVO ord = new Gro_orderVO();
//		
//		ord.setMem_Id("M000005");
//		ord.setOrdstat_Id("001");
//		ord.setGro_Id("G000000001");
//		ord.setOrd_Id("O000000004");
//		dao.update(ord);
//		System.err.println("更新成功");
	}
}
