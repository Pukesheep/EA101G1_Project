package com.groupBuy.model;

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

public class GroupBuyDAO implements GroupBuyDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO GROUPBUY(GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO,START_DATE,END_DATE,GROTIME_DATE,STATUS,PEOPLE,MONEY) VALUES ('G'||LPAD(GROUPBUY_seq.NEXTVAL,9,'0'),?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO,GROTIME_DATE,START_DATE,END_DATE,MONEY,PEOPLE,STATUS FROM GROUPBUY order by GRO_ID";
	private static final String GET_ONE_STMT = "SELECT GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO,START_DATE,END_DATE,GROTIME_DATE,STATUS,PEOPLE,MONEY FROM GROUPBUY where GRO_ID = ?";
	private static final String DELETE = "DELETE FROM GROUPBUY where GRO_ID = ?";
	private static final String UPDATE = "UPDATE GROUPBUY set P_ID=? , REB1_NO=? , REB2_NO=? , REB3_NO=? , START_DATE=? , END_DATE=? , GROTIME_DATE=? , STATUS=? , PEOPLE=? , MONEY=? where GRO_ID = ?";
	private static final String UPDATE_STATUS = "UPDATE GROUPBUY set status=? WHERE gro_id=?";
	private static final String GET_ALL_OPEN_GROUPBUY = "SELECT GRO_ID , START_DATE , END_DATE,PEOPLE FROM GROUPBUY WHERE STATUS ='0' ";

	@Override
	public void insert(GroupBuyVO groupBuyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, groupBuyVO.getP_Id());
			pstmt.setString(2, groupBuyVO.getReb1_No());
			pstmt.setString(3, groupBuyVO.getReb2_No());
			pstmt.setString(4, groupBuyVO.getReb3_No());
			pstmt.setTimestamp(5, groupBuyVO.getStart_Date());
			pstmt.setTimestamp(6, groupBuyVO.getEnd_Date());
			pstmt.setInt(7, groupBuyVO.getGrotime_Date());
			pstmt.setInt(8, groupBuyVO.getStatus());
			pstmt.setString(9, groupBuyVO.getPeople());
			pstmt.setInt(10, groupBuyVO.getMoney());

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
	public void update(GroupBuyVO groupBuyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, groupBuyVO.getP_Id());
			pstmt.setString(2, groupBuyVO.getReb1_No());
			pstmt.setString(3, groupBuyVO.getReb2_No());
			pstmt.setString(4, groupBuyVO.getReb3_No());
			pstmt.setTimestamp(5, groupBuyVO.getStart_Date());
			pstmt.setTimestamp(6, groupBuyVO.getEnd_Date());
			pstmt.setInt(7, groupBuyVO.getGrotime_Date());
			pstmt.setInt(8, groupBuyVO.getStatus());
			pstmt.setString(9, groupBuyVO.getPeople());
			pstmt.setInt(10, groupBuyVO.getMoney());
			pstmt.setString(11, groupBuyVO.getGro_Id());
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
	public void delete(String gro_Id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, gro_Id);

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
	public GroupBuyVO findByPrimaryKey(String gro_Id) {

		GroupBuyVO groupBuyVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, gro_Id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				groupBuyVO = new GroupBuyVO();
				groupBuyVO.setGro_Id(rs.getString("gro_Id"));
				groupBuyVO.setP_Id(rs.getString("p_Id"));
				groupBuyVO.setReb1_No(rs.getString("reb1_No"));
				groupBuyVO.setReb2_No(rs.getString("reb2_No"));
				groupBuyVO.setReb3_No(rs.getString("reb3_No"));
				groupBuyVO.setStart_Date(rs.getTimestamp("start_Date"));
				groupBuyVO.setEnd_Date(rs.getTimestamp("end_Date"));
				groupBuyVO.setGrotime_Date(rs.getInt("grotime_Date"));
				groupBuyVO.setStatus(rs.getInt("status"));
				groupBuyVO.setPeople(rs.getString("people"));
				groupBuyVO.setMoney(rs.getInt("money"));

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
		return groupBuyVO;
	}

	@Override
	public List<GroupBuyVO> getAll() {
		List<GroupBuyVO> list = new ArrayList<GroupBuyVO>();
		GroupBuyVO groupBuyVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				groupBuyVO = new GroupBuyVO();
				groupBuyVO.setGro_Id(rs.getString("gro_id"));
				groupBuyVO.setP_Id(rs.getString("p_id"));
				groupBuyVO.setReb1_No(rs.getString("reb1_no"));
				groupBuyVO.setReb2_No(rs.getString("reb2_no"));
				groupBuyVO.setReb3_No(rs.getString("reb3_no"));
				groupBuyVO.setGrotime_Date(rs.getInt("grotime_date"));
				groupBuyVO.setStart_Date(rs.getTimestamp("start_date"));
				groupBuyVO.setEnd_Date(rs.getTimestamp("end_date"));
				groupBuyVO.setMoney(rs.getInt("money"));
				groupBuyVO.setPeople(rs.getString("people"));
				groupBuyVO.setStatus(rs.getInt("status"));

				list.add(groupBuyVO); // Store the row in the list
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

	@Override
	public List<GroupBuyVO> getAllByOpen() {
		List<GroupBuyVO> list = new ArrayList<GroupBuyVO>();
		GroupBuyVO groupBuyVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_OPEN_GROUPBUY);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				groupBuyVO = new GroupBuyVO();
				groupBuyVO.setGro_Id(rs.getString("gro_id"));
				groupBuyVO.setStart_Date(rs.getTimestamp("start_date"));
				groupBuyVO.setEnd_Date(rs.getTimestamp("end_date"));
				groupBuyVO.setPeople(rs.getString("people"));

				list.add(groupBuyVO); // Store the row in the list
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

		GroupBuyJDBCDAO dao = new GroupBuyJDBCDAO();
//		
//	List<GroupBuyVO> list = dao.getAll();
//for (GroupBuyVO grobuy : list) {
//	System.out.print(grobuy.getGro_Id() + ",");
//	System.out.print(grobuy.getP_Id() + ",");
//	System.out.print(grobuy.getReb1_No());
//	System.out.print(grobuy.getReb2_No());
//	System.out.print(grobuy.getReb3_No());
//	System.out.print(grobuy.getGrotime_Date());
//	System.out.print(grobuy.getStart_Date());
//	System.out.print(grobuy.getEnd_Date());	
//	System.out.print(grobuy.getMoney());
//	System.out.print(grobuy.getPeople());
//	System.out.print(grobuy.getStatus());			
//	System.out.println();
//	

		List<GroupBuyVO> list = dao.getAllByOpen();
		for (GroupBuyVO groupBuyVO : list) {
			System.out.println(groupBuyVO.getGro_Id());
			System.out.println(groupBuyVO.getStart_Date());
			System.out.println(groupBuyVO.getEnd_Date());
		}
	}
	//
	// dao.delete("G000000007");

	// insert
//		GroupBuyVO g1 = new GroupBuyVO();
//		g1.setP_Id("P001");
//		g1.setReb1_No("R000000003");
//		g1.setReb2_No("R000000004");
//		g1.setReb3_No("R000000005");
//		g1.setStart_Date(null);
//		g1.setEnd_Date(null);
//		g1.setGrotime_Date(7);
//		g1.setStatus(0);
//		g1.setPeople("7");
//		g1.setMoney(0);
//		dao.insert(g1);
//		System.err.println("");
//	}

	@Override
	public void closeGroupBuy(String gro_id, Integer status) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);

			pstmt.setInt(1, status);
			pstmt.setString(2, gro_id);
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
	public void gropeo(GroupBuyVO groupBuyVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void gromon(GroupBuyVO groupBuyVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GroupBuyVO> getAllByGroId(String gro_Id) {
		// TODO Auto-generated method stub
		return null;
	}
}
