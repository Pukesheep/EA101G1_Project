package com.gro_order.model;

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

import com.groupBuy.model.GroupBuyVO;

public class Gro_orderDAO implements Gro_orderDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO GRO_ORDER(ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE) VALUES ('O'||LPAD(GRO_ORDER_seq.NEXTVAL,9,'0'),?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE FROM GRO_ORDER order by ORD_ID";
	private static final String GET_ONE_STMT = "SELECT ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE FROM GRO_ORDER where ORD_ID = ?";
	private static final String DELETE = "DELETE FROM GRO_ORDER where ORD_ID = ?";
	private static final String UPDATE = "UPDATE GRO_ORDER set MEM_ID=?, ORDSTAT_ID=?, GRO_ID=? where ORD_ID = ?";

	@Override
	public void insert(Gro_orderVO gro_orderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, gro_orderVO.getMem_Id());
			pstmt.setString(2, gro_orderVO.getOrdstat_Id());
			pstmt.setString(3, gro_orderVO.getGro_Id());
			pstmt.setTimestamp(4, gro_orderVO.getAdd_Date());

			pstmt.executeUpdate();

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1,gro_orderVO.getMem_Id());
			pstmt.setString(2, gro_orderVO.getOrdstat_Id());
			pstmt.setString(3, gro_orderVO.getGro_Id());
			pstmt.setString(4, gro_orderVO.getOrd_Id());
			pstmt.executeUpdate();

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, ord_Id);

			pstmt.executeUpdate();

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
//			SELECT ORD_ID,MEM_ID,ORDSTAT_ID,GRO_ID,ADD_DATE FROM GRO_ORDER where GRO_ID = ?
			con = ds.getConnection();
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

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				// empVO �]�٬� Domain objects
				gro_orderVO = new Gro_orderVO();
				gro_orderVO.setOrd_Id(rs.getString("ord_id"));
				gro_orderVO.setMem_Id(rs.getString("mem_id"));
				gro_orderVO.setOrdstat_Id(rs.getString("ordstat_id"));
				gro_orderVO.setGro_Id(rs.getString("gro_id"));
				gro_orderVO.setAdd_Date(rs.getTimestamp("add_date"));
				list.add(gro_orderVO); // Store the row in the list
			}

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
}
