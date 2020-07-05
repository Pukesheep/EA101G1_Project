package com.CustomerMessage.model;

import java.io.*;
import java.sql.*;
import java.util.*;


public class CustomerMessageJDBC implements CustomerMessage_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";

	private static final String INSERT_STMT = "insert into CUSTOMER_MESSAGE(CM_ID,CM_TIME,CM_WORD,CM_PIC,CM_STATUS,CM_CUSTOMERID) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),?,?,?,?,?)";

	private static final String UPDATE_STMT = "update CUSTOMER_MESSAGE set CM_WORD=?,cm_PiC=?,CM_STATUS=? where CM_ID=?";

	private static final String DELETE_STMT = "delete from CUSTOMER_MESSAGE where CM_ID=?";

	private static final String GET_ALL = "select cm_id,cm_Time,cm_word,cm_pic,cm_status,cm_customerid FROM CUSTOMER_MESSAGE";

	private static final String GET_ONE_PK = "select cm_id,cm_Time,cm_word,cm_pic,cm_status,cm_customerid FROM CUSTOMER_MESSAGE where cm_id=?";
	@Override
	public void insert(CustomerMessageVO customerMessageVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setTimestamp(1, customerMessageVO.getCm_time());
			pstmt.setString(2, customerMessageVO.getCm_word());
			pstmt.setBytes(3, customerMessageVO.getCm_pic());
			pstmt.setInt(4, customerMessageVO.getCm_status());
			pstmt.setString(5, customerMessageVO.getCm_customerid());

			pstmt.executeUpdate();

//			clob.setString(1, customerMessageVO.getCm_word()); // position
//			pstmt.setClob(3, clob);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace(System.err);
					// TODO: handle exception
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace(System.err);
					// TODO: handle exception
				}
			}
		}

	}

	public static String clobToString(Clob clob) {
		StringBuilder sb = new StringBuilder();
		BufferedReader br = null;
		String str;
		try {
			br = new BufferedReader(clob.getCharacterStream());
			while ((str = br.readLine()) != null) {
				sb.append(str);
				sb.append("\n");
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return sb.toString();
	}

	@Override
	public void update(CustomerMessageVO customerMessageVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, customerMessageVO.getCm_word());
			pstmt.setBytes(2, customerMessageVO.getCm_pic());
			pstmt.setInt(3, customerMessageVO.getCm_status());
			pstmt.setString(4, customerMessageVO.getCm_id());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace(System.err);
					// TODO: handle exception
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace(System.err);
					// TODO: handle exception
				}
			}
		}

	}

	@Override
	public void delete(String cm_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setString(1, cm_id);
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
		// TODO Auto-generated method stub

	}

	@Override
	public CustomerMessageVO findByPrimaryKey(String cm_id) {
		CustomerMessageVO cumVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_PK);
			
			pstmt.setString(1, cm_id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				cumVO = new CustomerMessageVO();
				cumVO.setCm_id(rs.getString("cm_id"));
				cumVO.setCm_time(rs.getTimestamp("cm_time"));
				cumVO.setCm_word(rs.getString("cm_word"));
				cumVO.setCm_pic(rs.getBytes("cm_pic"));
				cumVO.setCm_status(rs.getInt("cm_status"));
				cumVO.setCm_customerid(rs.getString("cm_customerid"));
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
		// TODO Auto-generated method stub
		return cumVO;
	}

	@Override
	public List<CustomerMessageVO> getAll() {
		List<CustomerMessageVO> list = new ArrayList<CustomerMessageVO>();
		CustomerMessageVO cumVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				cumVO = new CustomerMessageVO();
				cumVO.setCm_id(rs.getString("cm_id"));
				cumVO.setCm_time(rs.getTimestamp("cm_time"));
				cumVO.setCm_word(rs.getString("cm_word"));
				cumVO.setCm_pic(rs.getBytes("cm_pic"));
				cumVO.setCm_status(rs.getInt("cm_status"));
				cumVO.setCm_customerid(rs.getString("cm_customerid"));
				list.add(cumVO);
			}
		} catch (ClassNotFoundException e) {
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
		// TODO Auto-generated method stub
		return list;
	}

	public static void main(String[] args) {
		CustomerMessageJDBC dao = new CustomerMessageJDBC();
		CustomerMessageVO c1 = new CustomerMessageVO();
		//新增
//		c1.setCm_time(java.sql.Timestamp.valueOf("2005-01-01 11:12:50"));
//		c1.setCm_word("LLLLLLLLLLLLLLLLLLLLLLL");
//		c1.setCm_pic(null);
//		c1.setCm_status(1);
//		c1.setCm_customerid("M000003");
//		dao.insert(c1);

		// 修改
		c1.setCm_word("AAAAAAAAAAAAA");
		c1.setCm_pic(null);
		c1.setCm_status(0);
		c1.setCm_id("CM000015");
		dao.update(c1);

		// delete
//		dao.delete("CM000001");
		
//		CustomerMessageVO c2=dao.findByPrimaryKey("CM000003");
//		System.out.print(c2.getCm_id() + ",");
//		System.out.print(c2.getCm_time() + ",");
//		System.out.print(c2.getCm_word() + ",");
//		System.out.print(c2.getCm_pic() + ",");
//		System.out.print(c2.getCm_status() + ",");
//		System.out.print(c2.getCm_customerid() );
//		System.out.println();

		//查詢
//		List<CustomerMessageVO> list = dao.getAll();
//		for (CustomerMessageVO cumVO : list) {
//			System.out.print(cumVO.getCm_id() + ",");
//			System.out.print(cumVO.getCm_time() + ",");
//			System.out.print(cumVO.getCm_word() + ",");
//			System.out.print(cumVO.getCm_pic() + ",");
//			System.out.print(cumVO.getCm_status() + ",");
//			System.out.print(cumVO.getCm_customerid() + ",");
//			System.out.println();
//		}
	}

}
