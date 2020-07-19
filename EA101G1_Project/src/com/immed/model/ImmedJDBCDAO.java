package com.immed.model;

import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class ImmedJDBCDAO implements ImmedDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO IMMED (IMMED_ID, SALE_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN) "
			+ "VALUES ('IMMED'||LPAD(to_char(IMMED_SEQ.NEXTVAL), 6, '0'), ?, ?, ?, SYSTIMESTAMP, ?, ?, ?, 0, 0)";

	private static final String DELETE = "DELETE FROM IMMED WHERE IMMED_ID = ?";
	private static final String UPDATE = "UPDATE IMMED SET BUY_ID= ?, PT_ID= ?, IMMED_NAME= ?, IMMED_PRC= ?, IMMED_PIC= ?, IMMED_DESC= ?, IMMED_SOLD= ?, IMMED_DOWN= ?, ORD_TIME= ?, ORDSTAT_ID= ?, RCPT_NAME= ?, RCPT_CELL= ?, RCPT_ADD= ? WHERE IMMED_ID = ?";
	
	private static final String UPDATE_ONE_IMMED = "UPDATE IMMED SET PT_ID= ?, IMMED_NAME= ?, IMMED_PRC= ?, IMMED_PIC= ?, IMMED_DESC= ? WHERE IMMED_ID = ?";
	private static final String UPDATE_UP = "UPDATE IMMED SET IMMED_DOWN= 0 WHERE IMMED_ID = ?";
	private static final String UPDATE_DOWN = "UPDATE IMMED SET IMMED_DOWN= 1 WHERE IMMED_ID = ?";
	private static final String UPDATE_END = "UPDATE IMMED SET ORDSTAT_ID= '014' WHERE IMMED_ID = ?";
	private static final String UPDATE_ONE_BUY = "UPDATE IMMED SET BUY_ID= ?, IMMED_SOLD= 1, IMMED_down= 1, ORD_TIME= SYSTIMESTAMP, ORDSTAT_ID= '003', RCPT_NAME= ?, RCPT_CELL= ?, RCPT_ADD= ? WHERE IMMED_ID = ?";
	private static final String UPDATE_SHIPPING = "UPDATE IMMED SET ORDSTAT_ID='005' WHERE IMMED_ID = ?";
	private static final String UPDATE_DISABLE = "UPDATE IMMED SET BUY_ID= NULL, IMMED_SOLD= 0, IMMED_down= 0, ORD_TIME= NULL, ORDSTAT_ID= NULL, RCPT_NAME= NULL, RCPT_CELL= NULL, RCPT_ADD= NULL WHERE IMMED_ID = ?";

	private static final String GET_ALL_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED ORDER BY IMMED_ID";
	private static final String GET_ALLONSALE_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 0 AND IMMED_DOWN = 0 ORDER BY IMMED_ID DESC";

	private static final String GET_ALLBUYERIMMED_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE BUY_ID = ? ORDER BY IMMED_ID";
	private static final String GET_ALLSALERIMMED_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE SALE_ID = ? ORDER BY IMMED_ID";
	private static final String GET_ALLSALED_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 1 AND IMMED_DOWN = 1 AND SALE_ID = ? ORDER BY IMMED_ID DESC";
	private static final String GET_ALLSALEING_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 0 AND IMMED_DOWN = 0 SALE_ID = ? ORDER BY IMMED_ID DESC";

	private static final String GET_ONE_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_ID = ?";

	private static final String GET_FROM_NAME = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 0 AND IMMED_DOWN = 0 AND UPPER(IMMED_NAME) LIKE UPPER(?) ORDER BY IMMED_PRC";
	private static final String GET_FROM_TYPE = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 0 AND IMMED_DOWN = 0 AND PT_ID = ? ORDER BY IMMED_PRC";

	@Override
	public void insert(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, immedVO.getSale_id());
			pstmt.setString(2, immedVO.getPt_id());
			pstmt.setString(3, immedVO.getImmed_name());
			pstmt.setInt(4, immedVO.getImmed_prc());
			pstmt.setBytes(5, immedVO.getImmed_pic());
			pstmt.setString(6, immedVO.getImmed_desc());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void update(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, immedVO.getBuy_id());
			pstmt.setString(2, immedVO.getPt_id());
			pstmt.setString(3, immedVO.getImmed_name());
			pstmt.setInt(4, immedVO.getImmed_prc());
			pstmt.setBytes(5, immedVO.getImmed_pic());
			pstmt.setString(6, immedVO.getImmed_desc());
			pstmt.setInt(7, immedVO.getImmed_sold());
			pstmt.setInt(8, immedVO.getImmed_down());
			pstmt.setTimestamp(9, immedVO.getOrd_time());
			pstmt.setString(10, immedVO.getOrdstat_id());
			pstmt.setString(11, immedVO.getRcpt_name());
			pstmt.setString(12, immedVO.getRcpt_cell());
			pstmt.setString(13, immedVO.getRcpt_add());
			pstmt.setString(14, immedVO.getImmed_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void update_oneImmed(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, immedVO.getPt_id());
			pstmt.setString(2, immedVO.getImmed_name());
			pstmt.setInt(3, immedVO.getImmed_prc());
			pstmt.setBytes(4, immedVO.getImmed_pic());
			pstmt.setString(5, immedVO.getImmed_desc());
			pstmt.setString(6, immedVO.getImmed_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void update_end(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_END);

			pstmt.setString(1, immedVO.getImmed_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void update_up(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_UP);

			pstmt.setString(1, immedVO.getImmed_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void update_down(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_DOWN);

			pstmt.setString(1, immedVO.getImmed_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void update_shipping(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_SHIPPING);

			pstmt.setString(1, immedVO.getImmed_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void update_one_buy(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_ONE_BUY);

			pstmt.setString(1, immedVO.getBuy_id());
//			pstmt.setString(2, immedVO.getPt_id());
//			pstmt.setString(3, immedVO.getImmed_name());
//			pstmt.setInt(4, immedVO.getImmed_prc());
//			pstmt.setBytes(5, immedVO.getImmed_pic());
//			pstmt.setString(6, immedVO.getImmed_desc());
//			pstmt.setInt(2, immedVO.getImmed_sold());
//			pstmt.setInt(8, immedVO.getImmed_down());
//			pstmt.setTimestamp(9, immedVO.getOrd_time());
//			pstmt.setString(3, immedVO.getOrdstat_id());
			pstmt.setString(2, immedVO.getRcpt_name());
			pstmt.setString(3, immedVO.getRcpt_cell());
			pstmt.setString(4, immedVO.getRcpt_add());
			pstmt.setString(5, immedVO.getImmed_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void update_disable(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_DISABLE);

			pstmt.setString(1, immedVO.getImmed_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void delete(String immed_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, immed_id);
			pstmt.executeUpdate();

			// Handle any driver errors
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
	public ImmedVO findByPrimaryKey(String immed_id) {
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, immed_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));
			}
			// Handle any driver errors
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
		return immedVO;
	}

	@Override
	public List<ImmedVO> getAll() {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));

				list.add(immedVO); // Store the row in the list
			}

			// Handle any driver errors
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
		return list;
	}

	@Override
	public List<ImmedVO> getAllOnSale() {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALLONSALE_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));

				list.add(immedVO); // Store the row in the list
			}

			// Handle any driver errors
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
		return list;
	}

	@Override
	public List<ImmedVO> getAllSaled(String sale_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_ALLSALED_STMT);
			pstmt.setString(1, sale_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));

				list.add(immedVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) { // SQLException se
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
	public List<ImmedVO> getAllSaleIng(String sale_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_ALLSALEING_STMT);
			pstmt.setString(1, sale_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));

				list.add(immedVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) { // SQLException se
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
	public List<ImmedVO> findByImmedName(String search_str) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			System.out.println(search_str);
			pstmt = con.prepareStatement(GET_FROM_NAME);
			pstmt.setString(1, "%" + search_str + "%");

			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));

				list.add(immedVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) { // SQLException se
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
	public List<ImmedVO> findByImmedType(String pt_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			System.out.println(pt_id);
			pstmt = con.prepareStatement(GET_FROM_TYPE);
			pstmt.setString(1, pt_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));

				list.add(immedVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) { // SQLException se
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

	/** ================= Get DB image (Save to local) ===================== **/
	public static void readPicture(byte[] bytes, String imgId) throws IOException {
		FileOutputStream fos = new FileOutputStream("src/dbData/image/Auc/" + imgId + ".jpg");
		fos.write(bytes);
		fos.flush();
		fos.close();
	}

	/** ========= Get local image Byte[] (toUpload oracle) ==================== **/
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}

	/**
	 * ============= main方法 (insert update delete getOne getALL) ===================
	 **/
	public static void main(String[] args) {
		ImmedJDBCDAO dao = new ImmedJDBCDAO();
		SimpleDateFormat tsFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 去除print timestamp nano(毫秒)

		/** ===================== INSERT 新增一筆IMMED =============================== **/
//		ImmedVO immedVO1 = new ImmedVO();
//
//		immedVO1.setSale_id("M000003");
//		immedVO1.setPt_id("PT002");
//		immedVO1.setImmed_name("買豹吃手手");
//		immedVO1.setImmed_prc(8888);
//
//		byte[] picInsert = null;
//		try {
//			picInsert = getPictureByteArray("src/dbData/image/Auc/IMMED000002.jpg"); // insert a test Immed_pic
//																						// 圖片在專案路徑下
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		immedVO1.setImmed_pic(picInsert);
//		immedVO1.setImmed_desc("再買就要沒手啦");

//		dao.insert(immedVO1);

		/** ===================== UPDATE 修改一筆 IMMED =============================== **/
//		ImmedVO immedVO2 = new ImmedVO();
//
//		immedVO2.setBuy_id("M000007");
//		immedVO2.setPt_id("PT005");
//		immedVO2.setImmed_name("隻狼 暗影雙死");
//		immedVO2.setImmed_prc(1111);
//
//		byte[] picUpdate = null;
//		try {
//			picUpdate = getPictureByteArray("src/dbData/image/Auc/IMMED000001.jpg"); // insert a test Immed_pic
//																						// 圖片在專案路徑下
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		immedVO2.setImmed_pic(picUpdate);
//
//		immedVO2.setImmed_desc("修改商品為隻狼");
//		immedVO2.setImmed_sold(1);
//		immedVO2.setImmed_down(1);
//		immedVO2.setOrd_time(Timestamp.valueOf("2020-07-22 10:21:56"));
//		immedVO2.setOrdstat_id("006");
//		immedVO2.setRcpt_name("草泥馬");
//		immedVO2.setRcpt_cell("0988886811");
//		immedVO2.setRcpt_add("天堂門爆肝路");
//
//		immedVO2.setImmed_id("IMMED000010");

//		dao.update(immedVO2);

		/**
		 * ===================== UPDATE_UP 修改一筆 IMMED 上架 ===============================
		 **/
//		ImmedVO immedVO2 = new ImmedVO();
//
//		immedVO2.setImmed_id("IMMED000002");
//
//		dao.update_up(immedVO2);

		/**
		 * ===================== UPDATE_DOWN 修改一筆 IMMED 下架
		 * ===============================
		 **/
//		ImmedVO immedVO2 = new ImmedVO();
//
//		immedVO2.setImmed_id("IMMED000001");
//
//		dao.update_down(immedVO2);

		/**
		 * ===================== UPDATE_SHIPPING 修改一筆 IMMED 已出貨
		 * ===============================
		 **/
//		ImmedVO immedVO2 = new ImmedVO();
//
//		immedVO2.setImmed_id("IMMED000032");
//
//		dao.update_shipping(immedVO2);

		/**
		 * 
		 * /**
		 * ===================== UPDATE_DISABLE 修改一筆 IMMED 取消交易
		 * ===============================
		 **/
		ImmedVO immedVO2 = new ImmedVO();

		immedVO2.setImmed_id("IMMED000032");

		dao.update_disable(immedVO2);

		/**
		 * ===================== UPDATE_BUY 立即購買修改 IMMED ===============================
		 **/
//		ImmedVO immedVO2 = new ImmedVO();
//
//		immedVO2.setBuy_id("M000007");
//		immedVO2.setPt_id("PT005");
//		immedVO2.setImmed_name("隻狼 暗影雙死");
//		immedVO2.setImmed_prc(1111);
//
//		byte[] picUpdate = null;
//		try {
//			picUpdate = getPictureByteArray("src/dbData/image/Auc/IMMED000001.jpg"); // insert a test Immed_pic
//																						// 圖片在專案路徑下
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		immedVO2.setImmed_pic(picUpdate);

//		immedVO2.setImmed_desc("修改商品為隻狼");
//		immedVO2.setImmed_sold(1);
//		immedVO2.setImmed_down(1);
//		immedVO2.setOrd_time(Timestamp.valueOf("2020-07-22 10:21:56"));
//		immedVO2.setOrdstat_id("014");
//		immedVO2.setRcpt_name("草泥馬");
//		immedVO2.setRcpt_cell("0988886811");
//		immedVO2.setRcpt_add("天堂門爆肝路");
//
//		immedVO2.setImmed_id("IMMED000011");
//
//		dao.update_one_buy(immedVO2);

		/**
		 * ===================== DELETE G0 刪除一筆IMMED ===============================
		 **/
//		dao.delete("IMMED000012");

		/** ===================== GET_ONE 查詢一筆IMMED =============================== **/
//		ImmedVO immedVO3 = dao.findByPrimaryKey("IMMED000010");

//		System.out.print(immedVO3.getImmed_id() + ", ");
//		System.out.print(immedVO3.getSale_id() + ", ");
//		System.out.print(immedVO3.getBuy_id() + ", ");
//		System.out.print(immedVO3.getPt_id() + ", ");
//		System.out.print(immedVO3.getImmed_name() + ", ");
//		System.out.print(tsFormat.format(immedVO3.getImmed_start()) + ", ");
//		System.out.print(immedVO3.getImmed_prc() + ", ");
//
//		byte[] picOne = immedVO3.getImmed_pic(); // IMMED圖片從DB DOWNLOAD 到Auc資料夾
//		try {
//			if (picOne != null)
//				readPicture(picOne, immedVO3.getImmed_id());
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		System.out.print(immedVO3.getImmed_pic() + ", ");
//
//		System.out.print(immedVO3.getImmed_desc() + ", ");
//		System.out.print(immedVO3.getImmed_sold() + ", ");
//		System.out.print(immedVO3.getImmed_down() + ", ");
//
//		if (immedVO3.getOrd_time() != null)
//			System.out.print(tsFormat.format(immedVO3.getOrd_time()) + ", ");
//		else
//			System.out.print("null, ");
//
//		System.out.print(immedVO3.getOrdstat_id() + ", ");
//		System.out.print(immedVO3.getRcpt_name() + ", ");
//		System.out.print(immedVO3.getRcpt_cell() + ", ");
//		System.out.print(immedVO3.getRcpt_add());
//		System.out.println();
//		System.out.println("=======================================================");

		/** ===================== GET_ALL 查詢全部IMMED =============================== **/
//		List<ImmedVO> list_all = dao.getAll();
//		for (ImmedVO aImmed : list_all) {
//
//			System.out.print(aImmed.getImmed_id() + ", ");
//			System.out.print(aImmed.getSale_id() + ", ");
//			System.out.print(aImmed.getBuy_id() + ", ");
//			System.out.print(aImmed.getPt_id() + ", ");
//			System.out.print(aImmed.getImmed_name() + ", ");
//			System.out.print(tsFormat.format(aImmed.getImmed_start()) + ", ");
//			System.out.print(aImmed.getImmed_prc() + ", ");
//
//			byte[] picAll = aImmed.getImmed_pic(); // IMMED圖片從DB DOWNLOAD 到Auc資料夾
//			try {
//				if (picAll != null)
//					readPicture(picAll, aImmed.getImmed_id());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			System.out.print(aImmed.getImmed_pic() + ", ");
//
//			System.out.print(aImmed.getImmed_desc() + ", ");
//			System.out.print(aImmed.getImmed_sold() + ", ");
//			System.out.print(aImmed.getImmed_down() + ", ");
//
//			if (aImmed.getOrd_time() != null)
//				System.out.print(tsFormat.format(aImmed.getOrd_time()) + ", ");
//			else
//				System.out.print("null, ");
//
//			System.out.print(aImmed.getOrdstat_id() + ", ");
//			System.out.print(aImmed.getRcpt_name() + ", ");
//			System.out.print(aImmed.getRcpt_cell() + ", ");
//			System.out.print(aImmed.getRcpt_add());
//			System.out.println();

		/**
		 * ===================== findByImmedName 關鍵字搜尋全部IMMED
		 * ===============================
		 **/
//		List<ImmedVO> list_searchName = dao.findByImmedName("太空");
//		for (ImmedVO aImmed : list_searchName) {
//			System.out.print(aImmed.getImmed_id() + ", ");
//			System.out.print(aImmed.getSale_id() + ", ");
//			System.out.print(aImmed.getBuy_id() + ", ");
//			System.out.print(aImmed.getPt_id() + ", ");
//			System.out.print(aImmed.getImmed_name() + ", ");
//			System.out.print(tsFormat.format(aImmed.getImmed_start()) + ", ");
//			System.out.print(aImmed.getImmed_prc() + ", ");

//			byte[] picAll = aImmed.getImmed_pic(); // IMMED圖片從DB DOWNLOAD 到Auc資料夾
//			try {
//				if (picAll != null)
//					readPicture(picAll, aImmed.getImmed_id());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			System.out.print(aImmed.getImmed_pic() + ", ");
//
//			System.out.print(aImmed.getImmed_desc() + ", ");
//			System.out.print(aImmed.getImmed_sold() + ", ");
//			System.out.print(aImmed.getImmed_down() + ", ");
//
//			if (aImmed.getOrd_time() != null)
//				System.out.print(tsFormat.format(aImmed.getOrd_time()) + ", ");
//			else
//				System.out.print("null, ");
//
//			System.out.print(aImmed.getOrdstat_id() + ", ");
//			System.out.print(aImmed.getRcpt_name() + ", ");
//			System.out.print(aImmed.getRcpt_cell() + ", ");
//			System.out.print(aImmed.getRcpt_add());
//			System.out.println();
//		}
		/**
		 * ===================== findByImmedType 關鍵字搜尋全部IMMED
		 * ===============================
		 **/
//		List<ImmedVO> list_searchName = dao.findByImmedType("PT005");
//		for (ImmedVO aImmed : list_searchName) {
//			System.out.print(aImmed.getImmed_id() + ", ");
//			System.out.print(aImmed.getSale_id() + ", ");
//			System.out.print(aImmed.getBuy_id() + ", ");
//			System.out.print(aImmed.getPt_id() + ", ");
//			System.out.print(aImmed.getImmed_name() + ", ");
//			System.out.print(tsFormat.format(aImmed.getImmed_start()) + ", ");
//			System.out.print(aImmed.getImmed_prc() + ", ");
//
////			byte[] picAll = aImmed.getImmed_pic(); // IMMED圖片從DB DOWNLOAD 到Auc資料夾
////			try {
////				if (picAll != null)
////					readPicture(picAll, aImmed.getImmed_id());
////			} catch (IOException e) {
////				e.printStackTrace();
////			}
////			System.out.print(aImmed.getImmed_pic() + ", ");
//
//			System.out.print(aImmed.getImmed_desc() + ", ");
//			System.out.print(aImmed.getImmed_sold() + ", ");
//			System.out.print(aImmed.getImmed_down() + ", ");
//
//			if (aImmed.getOrd_time() != null)
//				System.out.print(tsFormat.format(aImmed.getOrd_time()) + ", ");
//			else
//				System.out.print("null, ");
//
//			System.out.print(aImmed.getOrdstat_id() + ", ");
//			System.out.print(aImmed.getRcpt_name() + ", ");
//			System.out.print(aImmed.getRcpt_cell() + ", ");
//			System.out.print(aImmed.getRcpt_add());
//			System.out.println();
//		}
		// ===================== getAllBuyerImmed 搜尋全部BUY_IMMED
		// ===============================
//		List<ImmedVO> list_buyImmed = dao.getAllBuyerImmed("M000012");
//		for (ImmedVO aImmed : list_buyImmed) {
//			System.out.print(aImmed.getImmed_id() + ", ");
//			System.out.print(aImmed.getSale_id() + ", ");
//			System.out.print(aImmed.getBuy_id() + ", ");
//			System.out.print(aImmed.getPt_id() + ", ");
//			System.out.print(aImmed.getImmed_name() + ", ");
//			System.out.print(tsFormat.format(aImmed.getImmed_start()) + ", ");
//			System.out.print(aImmed.getImmed_prc() + ", ");

//			byte[] picAll = aImmed.getImmed_pic(); // IMMED圖片從DB DOWNLOAD 到Auc資料夾
//			try {
//				if (picAll != null)
//					readPicture(picAll, aImmed.getImmed_id());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			System.out.print(aImmed.getImmed_pic() + ", ");
//
//			System.out.print(aImmed.getImmed_desc() + ", ");
//			System.out.print(aImmed.getImmed_sold() + ", ");
//			System.out.print(aImmed.getImmed_down() + ", ");
//
//			if (aImmed.getOrd_time() != null)
//				System.out.print(tsFormat.format(aImmed.getOrd_time()) + ", ");
//			else
//				System.out.print("null, ");
//
//			System.out.print(aImmed.getOrdstat_id() + ", ");
//			System.out.print(aImmed.getRcpt_name() + ", ");
//			System.out.print(aImmed.getRcpt_cell() + ", ");
//			System.out.print(aImmed.getRcpt_add());
//			System.out.println();
//		}

		// ===================== getAllSalerImmed 搜尋全部Sale_IMMED
		// ===============================
//		List<ImmedVO> list_buyImmed = dao.getAllSalerImmed("M000012");
//		for (ImmedVO aImmed : list_buyImmed) {
//			System.out.print(aImmed.getImmed_id() + ", ");
//			System.out.print(aImmed.getSale_id() + ", ");
//			System.out.print(aImmed.getBuy_id() + ", ");
//			System.out.print(aImmed.getPt_id() + ", ");
//			System.out.print(aImmed.getImmed_name() + ", ");
//			System.out.print(tsFormat.format(aImmed.getImmed_start()) + ", ");
//			System.out.print(aImmed.getImmed_prc() + ", ");

//			byte[] picAll = aImmed.getImmed_pic(); // IMMED圖片從DB DOWNLOAD 到Auc資料夾
//			try {
//				if (picAll != null)
//					readPicture(picAll, aImmed.getImmed_id());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			System.out.print(aImmed.getImmed_pic() + ", ");
//
//			System.out.print(aImmed.getImmed_desc() + ", ");
//			System.out.print(aImmed.getImmed_sold() + ", ");
//			System.out.print(aImmed.getImmed_down() + ", ");
//
//			if (aImmed.getOrd_time() != null)
//				System.out.print(tsFormat.format(aImmed.getOrd_time()) + ", ");
//			else
//				System.out.print("null, ");
//
//			System.out.print(aImmed.getOrdstat_id() + ", ");
//			System.out.print(aImmed.getRcpt_name() + ", ");
//			System.out.print(aImmed.getRcpt_cell() + ", ");
//			System.out.print(aImmed.getRcpt_add());
//			System.out.println();
//		}

		// ===================== getAllSaled 搜尋全部Sale_IMMED
		// ===============================
//		List<ImmedVO> list_buyImmed = dao.getAllSaled("M000012");
//		for (ImmedVO aImmed : list_buyImmed) {
//			System.out.print(aImmed.getImmed_id() + ", ");
//			System.out.print(aImmed.getSale_id() + ", ");
//			System.out.print(aImmed.getBuy_id() + ", ");
//			System.out.print(aImmed.getPt_id() + ", ");
//			System.out.print(aImmed.getImmed_name() + ", ");
//			System.out.print(tsFormat.format(aImmed.getImmed_start()) + ", ");
//			System.out.print(aImmed.getImmed_prc() + ", ");

//			byte[] picAll = aImmed.getImmed_pic(); // IMMED圖片從DB DOWNLOAD 到Auc資料夾
//			try {
//				if (picAll != null)
//					readPicture(picAll, aImmed.getImmed_id());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			System.out.print(aImmed.getImmed_pic() + ", ");
//
//			System.out.print(aImmed.getImmed_desc() + ", ");
//			System.out.print(aImmed.getImmed_sold() + ", ");
//			System.out.print(aImmed.getImmed_down() + ", ");

//			if (aImmed.getOrd_time() != null)
//				System.out.print(tsFormat.format(aImmed.getOrd_time()) + ", ");
//			else
//				System.out.print("null, ");
//
//			System.out.print(aImmed.getOrdstat_id() + ", ");
//			System.out.print(aImmed.getRcpt_name() + ", ");
//			System.out.print(aImmed.getRcpt_cell() + ", ");
//			System.out.print(aImmed.getRcpt_add());
//			System.out.println();
//		}

		// ===================== getAllSaleIng 搜尋全部Sale_IMMED
		// ===============================
//				List<ImmedVO> list_buyImmed = dao.getAllSaleIng("M000012");
//				for (ImmedVO aImmed : list_buyImmed) {
//					System.out.print(aImmed.getImmed_id() + ", ");
//					System.out.print(aImmed.getSale_id() + ", ");
//					System.out.print(aImmed.getBuy_id() + ", ");
//					System.out.print(aImmed.getPt_id() + ", ");
//					System.out.print(aImmed.getImmed_name() + ", ");
//					System.out.print(tsFormat.format(aImmed.getImmed_start()) + ", ");
//					System.out.print(aImmed.getImmed_prc() + ", ");

//					byte[] picAll = aImmed.getImmed_pic(); // IMMED圖片從DB DOWNLOAD 到Auc資料夾
//					try {
//						if (picAll != null)
//							readPicture(picAll, aImmed.getImmed_id());
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//					System.out.print(aImmed.getImmed_pic() + ", ");
		//
//					System.out.print(aImmed.getImmed_desc() + ", ");
//					System.out.print(aImmed.getImmed_sold() + ", ");
//					System.out.print(aImmed.getImmed_down() + ", ");

//					if (aImmed.getOrd_time() != null)
//						System.out.print(tsFormat.format(aImmed.getOrd_time()) + ", ");
//					else
//						System.out.print("null, ");
//
//					System.out.print(aImmed.getOrdstat_id() + ", ");
//					System.out.print(aImmed.getRcpt_name() + ", ");
//					System.out.print(aImmed.getRcpt_cell() + ", ");
//					System.out.print(aImmed.getRcpt_add());
//					System.out.println();
//				}
	}

	@Override
	public List<ImmedVO> getAllBuyerImmed(String buy_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_ALLBUYERIMMED_STMT);
			pstmt.setString(1, buy_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));

				list.add(immedVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) { // SQLException se
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
	public List<ImmedVO> getAllSalerImmed(String sale_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(GET_ALLSALERIMMED_STMT);
			pstmt.setString(1, sale_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				immedVO = new ImmedVO();

				immedVO.setImmed_id(rs.getString("immed_id"));
				immedVO.setSale_id(rs.getString("sale_id"));
				immedVO.setBuy_id(rs.getString("buy_id"));
				immedVO.setPt_id(rs.getString("pt_id"));
				immedVO.setImmed_name(rs.getString("immed_name"));
				immedVO.setImmed_start(rs.getTimestamp("immed_start"));
				immedVO.setImmed_prc(rs.getInt("immed_prc"));
				immedVO.setImmed_pic(rs.getBytes("immed_pic"));
				immedVO.setImmed_desc(rs.getString("immed_desc"));
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));

				list.add(immedVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) { // SQLException se
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
