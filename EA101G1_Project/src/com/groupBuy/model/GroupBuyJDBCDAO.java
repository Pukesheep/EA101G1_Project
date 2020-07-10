package com.groupBuy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import com.gro_mem.model.Gro_memJDBCDAO;
import com.rebate.model.RebateJDBCDAO;
import com.rebate.model.RebateVO;

public class GroupBuyJDBCDAO implements GroupBuyDAO_interface {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO GROUPBUY(GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO,START_DATE,END_DATE,GROTIME_DATE,STATUS,PEOPLE,MONEY) VALUES ('G'||LPAD(GROUPBUY_seq.NEXTVAL,9,'0'),?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO,GROTIME_DATE,START_DATE,END_DATE,MONEY,PEOPLE,STATUS FROM GROUPBUY order by GRO_ID";
	private static final String GET_ONE_STMT = "SELECT GRO_ID,P_ID,REB1_NO,REB2_NO,REB3_NO,START_DATE,END_DATE,GROTIME_DATE,STATUS,PEOPLE,MONEY FROM GROUPBUY where GRO_ID = ?";
	private static final String DELETE = "DELETE FROM GROUPBUY where GRO_ID = ?";
	private static final String UPDATE = "UPDATE GROUPBUY set P_ID=? , REB1_NO=? , REB2_NO=? , REB3_NO=? , START_DATE=? , END_DATE=? , GROTIME_DATE=? , STATUS=? , PEOPLE=? , MONEY=? where GRO_ID = ?";
	private static final String UPDATE_STATUS = "UPDATE GROUPBUY set status=? WHEREgri_id=?";
	private static final String GET_ALL_OPEN_GROUPBUY = "SELECT GRO_ID , START_DATE , END_DATE FROM GROUPBUY WHERE STATUS ='0' ";
	private static final String UPDATEPEO = "UPDATE GROUPBUY set PEOPLE=? WHERE GRO_ID=?";
	private static final String UPDATEMON = "UPDATE GROUPBUY set MONEY = ? WHERE GRO_ID=?";

	@Override
	public void insert(GroupBuyVO groupBuyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
//
	@Override
	public void update(GroupBuyVO groupBuyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
	public void gropeo(GroupBuyVO groupBuyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATEPEO);

			pstmt.setString(1, groupBuyVO.getPeople());
			pstmt.setString(2, groupBuyVO.getGro_Id());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	public void gromon(GroupBuyVO groupBuyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			System.err.println(groupBuyVO.getMoney());
			pstmt = con.prepareStatement(UPDATEMON);
			pstmt.setInt(1, groupBuyVO.getMoney());
			pstmt.setString(2, groupBuyVO.getGro_Id());
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
	public void delete(String gro_Id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, gro_Id);

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
	public GroupBuyVO findByPrimaryKey(String gro_Id) {

		GroupBuyVO groupBuyVO = null;
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		GroupBuyJDBCDAO groDao = new GroupBuyJDBCDAO();


//		List<GroupBuyVO> list = dao.getAll();
//	for (GroupBuyVO grobuy : list) {
//		System.out.print(grobuy.getGro_Id() + ",");
//		System.out.print(grobuy.getP_Id() + ",");
//		System.out.print(grobuy.getReb1_No());
//		System.out.print(grobuy.getReb2_No());
//		System.out.print(grobuy.getReb3_No());
//		System.out.print(grobuy.getGrotime_Date());
//		System.out.print(grobuy.getStart_Date());
//		System.out.print(grobuy.getEnd_Date());	
//		System.out.print(grobuy.getMoney());
//		System.out.print(grobuy.getPeople());
//		System.out.print(grobuy.getStatus());			
//		System.out.println();
//	}
//		

//		List<GroupBuyVO> list = dao.getAllByOpen();
//		for (GroupBuyVO groupBuyVO : list) {
//			Timestamp starDate = groupBuyVO.getStart_Date();
//			Timestamp endDate = groupBuyVO.getEnd_Date();
//			if (starDate.before(endDate)) {
//				System.out.println(groupBuyVO.getGro_Id());
//			}
//		}

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
//		System.err.println("123");

		// 修改團購案人數 (PK,people)
		GroupBuyVO p = new GroupBuyVO();
		p.setGro_Id("G000000006");
		p.setPeople("50");
		groDao.gropeo(p);
		System.out.println("???????1");

//		GroupBuyVO groupBuyVO = groDao.findByPrimaryKey("G000000006");
//		if (groupBuyVO.getReb1_No() != null) {
//			Integer groBuyPeople = Integer.valueOf(groupBuyVO.getPeople());
//			String reb1 = groupBuyVO.getReb1_No();
//			RebateVO rebateVO = rebDao.findByPrimaryKey(reb1);
//			Integer reb1People = Integer.valueOf(rebateVO.getPeople());
//			Integer money = 0;
//			if (groBuyPeople >= reb1People) {
//				money = groupBuyVO.getMoney() * rebateVO.getDiscount();
//			String reb2 = groupBuyVO.getReb2_No();
//			RebateVO rebateVO2 = rebDao.findByPrimaryKey(reb2);
//			Integer reb2People = Integer.valueOf(rebateVO.getPeople());
//			if (groBuyPeople >= reb2People) {
//				money = groupBuyVO.getMoney() * rebateVO.getDiscount();
//			String reb3 = groupBuyVO.getReb3_No();
//			RebateVO rebateVO3 = rebDao.findByPrimaryKey(reb3);
//			Integer reb3People = Integer.valueOf(rebateVO.getPeople());
//			if (groBuyPeople >= reb3People) {
//				money = groupBuyVO.getMoney() * rebateVO.getDiscount();
//			}
//		}
//			}
//		}
//		//修改團購案價錢(pK,money)
		GroupBuyVO reb = new GroupBuyVO();
		reb.setGro_Id("G000000006");
		reb.setMoney(123456);
		groDao.gromon(reb);
		System.out.println("????");

		// update
//		GroupBuyVO g1=new GroupBuyVO();
//		g1.setGro_Id("G000000008");
//		g1.setP_Id("P002");
//		g1.setReb1_No("R000000008");
//		g1.setReb2_No("R000000001");
//		g1.setReb3_No("R000000006");
//		g1.setStart_Date(null);	
//		g1.setEnd_Date(null);
//		g1.setGrotime_Date(10);
//		g1.setStatus(1);
//		g1.setPeople("7");
//		g1.setMoney(4);	
//		groDao.update(g1);
//		System.err.println("123");
////	
//		GroupBuyVO gro2 = dao.findByPrimaryKey("G000000003");
//		System.out.print(gro2.getGro_Id() + ",");
//		System.out.print(gro2.getP_Id() + ",");
//		System.out.print(gro2.getReb1_No() + ",");
//		System.out.print(gro2.getReb2_No() + ",");
//		System.out.print(gro2.getReb3_No() + ",");
//		System.out.print(gro2.getStart_Date() + ",");
//		System.out.print(gro2.getEnd_Date() + ",");
//		System.out.print(gro2.getGrotime_Date() + ",");
//		System.out.print(gro2.getStatus() + ",");
//		System.out.print(gro2.getPeople() + ",");
//		System.out.print(gro2.getMoney() + ",");
//		System.out.println();
//		System.out.println("---------------------");

	}

	@Override
	public void closeGroupBuy(String gro_id, Integer status) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STATUS);

			pstmt.setInt(1, status);
			pstmt.setString(2, gro_id);
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
	public List<GroupBuyVO> getAllByOpen() {
		List<GroupBuyVO> list = new ArrayList<GroupBuyVO>();
		GroupBuyVO groupBuyVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_OPEN_GROUPBUY);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				groupBuyVO = new GroupBuyVO();
				groupBuyVO.setGro_Id(rs.getString("gro_id"));
				groupBuyVO.setStart_Date(rs.getTimestamp("start_date"));
				groupBuyVO.setEnd_Date(rs.getTimestamp("end_date"));

				list.add(groupBuyVO); // Store the row in the list
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	public List<GroupBuyVO> getAllByGroId(String gro_Id) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
