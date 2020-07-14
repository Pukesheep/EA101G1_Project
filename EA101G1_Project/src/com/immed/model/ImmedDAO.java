package com.immed.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ImmedDAO implements ImmedDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO IMMED (IMMED_ID, SALE_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN) "
			+ "VALUES ('IMMED'||LPAD(to_char(IMMED_SEQ.NEXTVAL), 6, '0'), ?, ?, ?, SYSTIMESTAMP, ?, ?, ?, 0, 0)";
	private static final String DELETE = "DELETE FROM IMMED WHERE IMMED_ID = ?";
	private static final String UPDATE = "UPDATE IMMED SET BUY_ID= ?, PT_ID= ?, IMMED_NAME= ?, IMMED_PRC= ?, IMMED_PIC= ?, IMMED_DESC= ?, IMMED_SOLD= ?, IMMED_DOWN= ?, ORD_TIME= ?, ORDSTAT_ID= ?, RCPT_NAME= ?, RCPT_CELL= ?, RCPT_ADD= ? WHERE IMMED_ID = ?";
	
	private static final String UPDATE_UP = "UPDATE IMMED SET IMMED_DOWN= 0 WHERE IMMED_ID = ?";
	private static final String UPDATE_DOWN = "UPDATE IMMED SET IMMED_DOWN= 1 WHERE IMMED_ID = ?";
	private static final String UPDATE_ONE_BUY = "UPDATE IMMED SET BUY_ID= ?, IMMED_SOLD= 1, IMMED_down= 1, ORD_TIME= SYSTIMESTAMP, ORDSTAT_ID= '003', RCPT_NAME= ?, RCPT_CELL= ?, RCPT_ADD= ? WHERE IMMED_ID = ?";
	private static final String UPDATE_SHIPPING = "UPDATE IMMED SET ORDSTAT_ID='005' WHERE IMMED_ID = ?";
	private static final String UPDATE_DISABLE = "UPDATE IMMED SET BUY_ID= NULL, IMMED_SOLD= 0, IMMED_down= 0, ORD_TIME= NULL, ORDSTAT_ID= NULL, RCPT_NAME= NULL, RCPT_CELL= NULL, RCPT_ADD= NULL WHERE IMMED_ID = ?";

	
	private static final String GET_ALL_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED ORDER BY IMMED_ID DESC";
	private static final String GET_ALLONSALE_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 0 AND IMMED_DOWN = 0 ORDER BY IMMED_ID DESC";
	
	private static final String GET_ALLBUYERIMMED_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE BUY_ID = ? ORDER BY IMMED_ID";
	private static final String GET_ALLSALERIMMED_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE SALE_ID = ? ORDER BY IMMED_ID";
	private static final String GET_ALLSALED_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 1 AND IMMED_DOWN = 1 AND SALE_ID = ? ORDER BY IMMED_ID DESC";
	private static final String GET_ALLSALEING_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 0 AND IMMED_DOWN = 0 AND SALE_ID = ? ORDER BY IMMED_ID DESC";

	private static final String GET_ONE_STMT = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_ID = ?";
	
	private static final String GET_FROM_NAME = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 0 AND IMMED_DOWN = 0 AND UPPER(IMMED_NAME) LIKE UPPER(?) ORDER BY IMMED_PRC";
	private static final String GET_FROM_TYPE = "SELECT IMMED_ID, SALE_ID, BUY_ID, PT_ID, IMMED_NAME, IMMED_START, IMMED_PRC, IMMED_PIC, IMMED_DESC, IMMED_SOLD, IMMED_DOWN, ORD_TIME, ORDSTAT_ID, RCPT_NAME, RCPT_CELL, RCPT_ADD FROM IMMED WHERE IMMED_SOLD = 0 AND IMMED_DOWN = 0 AND PT_ID = ? ORDER BY IMMED_PRC";

	@Override
	public void insert(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, immedVO.getSale_id());
			pstmt.setString(2, immedVO.getPt_id());
			pstmt.setString(3, immedVO.getImmed_name());
			pstmt.setInt(4, immedVO.getImmed_prc());
			pstmt.setBytes(5, immedVO.getImmed_pic());
			pstmt.setString(6, immedVO.getImmed_desc());

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
	public void update(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_UP);

			pstmt.setString(1, immedVO.getImmed_id());

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
	public void update_down(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_DOWN);

			pstmt.setString(1, immedVO.getImmed_id());

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
	public void update_one_buy(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_DISABLE);

			pstmt.setString(1, immedVO.getImmed_id());

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
	public void delete(String immed_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, immed_id);
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

	public static String readString(Reader reader) throws IOException   {
		StringBuilder sb = new StringBuilder();
		BufferedReader br = new BufferedReader(reader);
		String str;
		while((str = br.readLine()) != null) {
			sb.append("<p>").append(str).append("</p>");
			sb.append("\n");
		}
		br.close();
		return sb.toString();
	}
	
	@Override
	public ImmedVO findByPrimaryKey(String immed_id) {
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
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
				
				Reader reader = rs.getCharacterStream("immed_desc");
				immedVO.setImmed_desc(readString(reader));
				
				immedVO.setImmed_sold(rs.getInt("immed_sold"));
				immedVO.setImmed_down(rs.getInt("immed_down"));
				immedVO.setOrd_time(rs.getTimestamp("ord_time"));
				immedVO.setOrdstat_id(rs.getString("ordstat_id"));
				immedVO.setRcpt_name(rs.getString("rcpt_name"));
				immedVO.setRcpt_cell(rs.getString("rcpt_cell"));
				immedVO.setRcpt_add(rs.getString("rcpt_add"));
			}
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
			con = ds.getConnection();
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
			con = ds.getConnection();
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
	public List<ImmedVO> findByImmedName(String search_str) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			System.out.println(search_str);
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
		} catch (SQLException se) {
			throw new RuntimeException("Couldn't load database driver. " + se.getMessage());
			// Handle any SQL errors
		} catch (Exception se) { // SQLException se
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
			con = ds.getConnection();
//			System.out.println(pt_id);
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
		} catch (SQLException se) {
			throw new RuntimeException("Couldn't load database driver. " + se.getMessage());
			// Handle any SQL errors
		} catch (Exception se) { // SQLException se
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
	public List<ImmedVO> getAllBuyerImmed(String buy_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			System.out.println(search_str);
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
		} catch (SQLException se) {
			throw new RuntimeException("Couldn't load database driver. " + se.getMessage());
			// Handle any SQL errors
		} catch (Exception se) { // SQLException se
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
	public List<ImmedVO> getAllSalerImmed(String buy_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			System.out.println(search_str);
			pstmt = con.prepareStatement(GET_ALLSALERIMMED_STMT);
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
		} catch (SQLException se) {
			throw new RuntimeException("Couldn't load database driver. " + se.getMessage());
			// Handle any SQL errors
		} catch (Exception se) { // SQLException se
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
	public List<ImmedVO> getAllSaled(String buy_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			System.out.println(search_str);
			pstmt = con.prepareStatement(GET_ALLSALED_STMT);
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
		} catch (SQLException se) {
			throw new RuntimeException("Couldn't load database driver. " + se.getMessage());
			// Handle any SQL errors
		} catch (Exception se) { // SQLException se
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
	public List<ImmedVO> getAllSaleIng(String buy_id) {
		List<ImmedVO> list = new ArrayList<ImmedVO>();
		ImmedVO immedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
//			System.out.println(search_str);
			pstmt = con.prepareStatement(GET_ALLSALEING_STMT);
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
		} catch (SQLException se) {
			throw new RuntimeException("Couldn't load database driver. " + se.getMessage());
			// Handle any SQL errors
		} catch (Exception se) { // SQLException se
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

	public void update_shipping(ImmedVO immedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_SHIPPING);

			pstmt.setString(1, immedVO.getImmed_id());

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


}
