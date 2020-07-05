package com.CustomerMessage.model;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class CustomerMessageDAO implements CustomerMessage_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "insert into CUSTOMER_MESSAGE(CM_ID,CM_TIME,CM_WORD,CM_PIC,CM_STATUS,CM_CUSTOMERID) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),?,?,?,?,?)";

	private static final String UPDATE_STMT = "UPDATE CUSTOMER_MESSAGE SET CM_WORD=?,CM_PIC=?,CM_STATUS=? WHERE CM_ID=?";

	private static final String DELETE_STMT = "delete from CUSTOMER_MESSAGE where CM_ID=?";

	private static final String GET_ALL = "select cm_id,cm_Time,cm_word,cm_pic,cm_status,cm_customerid FROM CUSTOMER_MESSAGE";

	private static final String GET_ONE_PK = "select cm_id,cm_Time,cm_word,cm_pic,cm_status,cm_customerid FROM CUSTOMER_MESSAGE where cm_id=?";
	@Override
	public void insert(CustomerMessageVO cumVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setTimestamp(1, cumVO.getCm_time());
			pstmt.setString(2, cumVO.getCm_word());
			pstmt.setBytes(3, cumVO.getCm_pic());
			pstmt.setInt(4, cumVO.getCm_status());
			pstmt.setString(5, cumVO.getCm_customerid());

			pstmt.executeUpdate();

//			clob.setString(1, customerMessageVO.getCm_word()); // position
//			pstmt.setClob(3, clob);

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
	public void update(CustomerMessageVO cumVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, cumVO.getCm_word());
			pstmt.setBytes(2, cumVO.getCm_pic());
			pstmt.setInt(3, cumVO.getCm_status());
			pstmt.setString(4, cumVO.getCm_id());
			pstmt.executeUpdate();

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

			con=ds.getConnection();
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setString(1, cm_id);
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
		// TODO Auto-generated method stub

	}

	@Override
	public CustomerMessageVO findByPrimaryKey(String cm_id) {
		CustomerMessageVO cumVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con=ds.getConnection();
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
			con=ds.getConnection();
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
		}catch (SQLException se) {
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

}
