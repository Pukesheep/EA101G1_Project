package com.productOrderList.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.sql.DataSource;

public class PolDAO implements com.productOrderList.model.PolDAO_interface{
	
private static javax.sql.DataSource ds = null;
	
	static {
		try {
			javax.naming.Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT="INSERT INTO PRODUCT_ORDER_LIST(PO_ID,P_ID,ORDER_QUA,P_PRICE,BONUS) VALUES(?,?,?,?,?)";
	private static final String DELETE="DELETE FROM PRODUCT_ORDER_LIST WHERE PO_ID=? AND P_ID=?";
	private static final String GET_ALL_STMT="SELECT PO_ID,P_ID,ORDER_QUA,P_PRICE FROM PRODUCT_ORDER_LIST ORDER BY PO_ID";
	private static final String GET_ONE_STMT="SELECT PO_ID,P_ID,ORDER_QUA,P_PRICE FROM PRODUCT_ORDER_LIST WHERE PO_ID=? AND P_ID=?";
	@Override
	public void insert(PolVO polVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			
			pstmt.setString(1,polVO.getPo_id());
			pstmt.setString(2,polVO.getP_id());
			pstmt.setInt(3,polVO.getOrder_qua());
			pstmt.setDouble(4,polVO.getP_price());
			pstmt.setDouble(5,polVO.getBonus());
			
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
	
	public void insert2(PolVO polVO ,Connection con) {

		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = con.prepareStatement(INSERT);
			
			pstmt.setString(1,polVO.getPo_id());
			pstmt.setString(2,polVO.getP_id());
			pstmt.setInt(3,polVO.getOrder_qua());
			pstmt.setDouble(4,polVO.getP_price());
			pstmt.setDouble(5, polVO.getBonus());
			
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-emp");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}

	}
	
	@Override
	public void delete(String po_id, String p_id) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1,po_id);
			pstmt.setString(2,p_id);
			
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
	public PolVO findByPrimaryKey(String po_id, String p_id) {
		 PolVO polVO = null;
		 Connection con = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 try {
			 con = ds.getConnection();
			 pstmt = con.prepareStatement(GET_ONE_STMT);
			 
			 pstmt.setString(1,po_id);
			 pstmt.setString(2,p_id);
			 
			 rs = pstmt.executeQuery();
			 
			 while (rs.next()) {
				 
				 polVO = new PolVO();
				 
				 polVO.setPo_id(rs.getString("po_id"));
				 polVO.setP_id(rs.getString("p_id"));
				 polVO.setOrder_qua(rs.getInt("order_qua"));
				 polVO.setP_price(rs.getDouble("p_price"));
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
		return polVO;
	}
	@Override
	public List<PolVO> getAll() {
		 List<PolVO> list= new ArrayList<PolVO>();
		 PolVO polVO = null;
		 Connection con = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 try {
			 con = ds.getConnection();
			 pstmt = con.prepareStatement(GET_ALL_STMT);
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 polVO = new PolVO();
				 
				 polVO.setPo_id(rs.getString("po_id"));
				 polVO.setP_id(rs.getString("p_id"));
				 polVO.setOrder_qua(rs.getInt("order_qua"));
				 polVO.setP_price(rs.getDouble("p_price"));
				 polVO.setBonus(rs.getDouble("bonus"));
				 
				 list.add(polVO);
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
	
	
}


