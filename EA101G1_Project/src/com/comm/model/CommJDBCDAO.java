package com.comm.model;

import java.sql.*;
import java.util.*;

public class CommJDBCDAO implements CommDAO_interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";
	
	private static final String INSERT_STMT = "INSERT INTO comm (comm_id, post_id, mem_id, c_status, c_text, last_edit) VALUES ('COMM'||LPAD(to_char(comm_seq.NEXTVAL), 6, '0'), ?, ?, ?, ?, SYSDATE)";
	private static final String GET_ALL_STMT = "SELECT comm_id, post_id, mem_id, c_status, c_text, last_edit, post_time FROM comm ORDER BY comm_id";
	private static final String GET_ONE_STMT = "SELECT comm_id, post_id, mem_id, c_status, c_text, last_edit, post_time FROM comm WHERE comm_id = ?";
	private static final String DELETE = "DELETE FROM comm WHERE comm_id = ?";
	private static final String UPDATE = "UPDATE comm SET c_status = ?, c_text = ?, last_edit = SYSDATE WHERE comm_id = ?";
	private static final String GET_COMM = "SELECT comm_id FROM comm WHERE post_id = ?";

	
	@Override
	public String insert(CommVO commVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String generatedKey = "";
		
		try {
			Class.forName(driver);
			String[] cols = {"comm_id"};
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT, cols);
			
			pstmt.setString(1, commVO.getPost_id());
			pstmt.setString(2, commVO.getMem_id());
			pstmt.setInt(3, commVO.getC_status());
			pstmt.setString(4, commVO.getC_text());
			
			pstmt.executeUpdate();
			
			rs = pstmt.getGeneratedKeys();
			rs.next();
			generatedKey = rs.getString(1);
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return generatedKey;
	}

	@Override
	public void update(CommVO commVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, commVO.getC_status());
			pstmt.setString(2, commVO.getC_text());
			pstmt.setString(3, commVO.getComm_id());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(String comm_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, comm_id);
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public CommVO findByPrimaryKey(String comm_id) {
		
		CommVO commVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, comm_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				commVO = new CommVO();
				commVO.setComm_id(rs.getString("comm_id"));
				commVO.setPost_id(rs.getString("post_id"));
				commVO.setMem_id(rs.getString("mem_id"));
				commVO.setC_status(rs.getInt("c_status"));
				commVO.setC_text(rs.getString("c_text"));
				commVO.setLast_edit(rs.getTimestamp("last_edit"));
				commVO.setPost_time(rs.getTimestamp("post_time"));
				
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return commVO;
	}

	@Override
	public List<CommVO> getAll() {
		
		List<CommVO> list = null;
		CommVO commVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			list = new ArrayList<CommVO>();
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				commVO = new CommVO();
				commVO.setComm_id(rs.getString("comm_id"));
				commVO.setPost_id(rs.getString("post_id"));
				commVO.setMem_id(rs.getString("mem_id"));
				commVO.setC_status(rs.getInt("c_status"));
				commVO.setC_text(rs.getString("c_text"));
				commVO.setLast_edit(rs.getTimestamp("last_edit"));
				commVO.setPost_time(rs.getTimestamp("post_time"));
				list.add(commVO);
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return list;
	}
	
	@Override
	public CommVO findComm(String post_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommVO commVO = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_COMM);
			pstmt.setString(1, post_id);
			rs = pstmt.executeQuery();
			commVO = new CommVO();
			
			while (rs.next()) {
				commVO.setComm_id(rs.getString("comm_id"));
			}
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return commVO;
	}

	public static void main(String[] args) {
		
		CommJDBCDAO dao = new CommJDBCDAO();
		
		// 新增
		CommVO commVO1 = new CommVO();
//		commVO1.setPost_id("POST000001");
//		commVO1.setMem_id("M000002");
//		commVO1.setC_status(1);
//		commVO1.setC_text("對阿, 我也是這麼覺der");
//		dao.insert(commVO1);
		
		commVO1.setPost_id("POST000002");
		commVO1.setMem_id("M000001");
		commVO1.setC_status(1);
		commVO1.setC_text("吃葡萄不吐葡萄皮");
		dao.insert(commVO1);
		
//		commVO1.setPost_id("POST000003");
//		commVO1.setMem_id("M000002");
//		commVO1.setC_status(1);
//		commVO1.setC_text("5566不能亡");
//		dao.insert(commVO1);
		
		// 修改
//		CommVO commVO2 = new CommVO();
//		commVO2.setC_status(0);
//		commVO2.setC_text("喔天啊, 出門忘記帶鑰匙惹");
//		commVO2.setComm_id("COMM000002");
//		dao.update(commVO2);
		
		// 刪除
//		dao.delete("COMM000003");
		
		// 查詢單筆
		CommVO commVO3 = dao.findByPrimaryKey("COMM000005");
		System.out.println("COMM_ID = " + commVO3.getComm_id() + ",");
		System.out.println("POST_ID = " + commVO3.getPost_id() + ",");
		System.out.println("MEM_ID = " + commVO3.getMem_id() + ",");
		System.out.println("C_STATUS = " + commVO3.getC_status() + ",");
		System.out.println("C_TEXT = " + commVO3.getC_text() + ",");
		System.out.println("LAST_EDIT = " + commVO3.getLast_edit() + ",");
		System.out.println("POST_TIME = " + commVO3.getPost_time());
		System.out.println("=============================");
		
		// 查詢全部
		List<CommVO> list = dao.getAll();
		
		for (CommVO aComm : list) {
			System.out.println("COMM_ID = " + aComm.getComm_id() + ",");
			System.out.println("POST_ID = " + aComm.getPost_id() + ",");
			System.out.println("MEM_NO = " + aComm.getMem_id() + ",");
			System.out.println("C_STATUS = " + aComm.getC_status() + ",");
			System.out.println("C_TEXT = " + aComm.getC_text() + ",");
			System.out.println("LAST_EDIT = " + aComm.getLast_edit() + ",");
			System.out.println("POST_TIME = " + aComm.getPost_time());
			System.out.println("=============================");
		}
		
	}


}
