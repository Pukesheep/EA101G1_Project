package com.oto.model;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;





public class OtoDAO implements OtoDAO_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT="INSERT INTO one_to_one(CR_ID,CR_TIME,USER_ONE,USER_TWO,CR_WORD,CR_PIC,CR_STATUS) VALUES('CR'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),?,?,?,?,?,?)";
	
	private static final String UPDATE_STMT="update one_to_one set CR_word=?,CR_PIC=?,user_one=?,user_two=?,cr_status=? where CR_ID=?";
	
	private static final String GET_ALL="select * FROM one_to_one";
	
	private static final String GET_ONE_PK="select * from one_to_one where CR_ID=?";
	
	@Override
	public void insert(OtoVO otoVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			
			con = con=ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setTimestamp(1, otoVO.getCr_time());
			pstmt.setString(2,otoVO.getUser_one());
			pstmt.setString(3,otoVO.getUser_two());
			pstmt.setString(4, otoVO.getCr_word());
			pstmt.setBytes(5, otoVO.getCr_pic());
			pstmt.setInt(6, otoVO.getCr_status());
			
			pstmt.executeUpdate();
			
		}catch (SQLException e) {
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
	public void update(OtoVO otoVO) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = con=ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, otoVO.getCr_word());
			pstmt.setBytes(2, otoVO.getCr_pic());
			pstmt.setString(3, otoVO.getUser_one());
			pstmt.setString(4, otoVO.getUser_two());
			pstmt.setInt(5, otoVO.getCr_status());
			pstmt.setString(6, otoVO.getCr_id());
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
	public void delete(String cr_id) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public OtoVO findByPrimaryKey(String cr_id) {
		OtoVO otoVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = con=ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_PK);
			
			pstmt.setString(1, cr_id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				otoVO = new OtoVO();
				otoVO.setCr_id(rs.getString("cr_id"));
				otoVO.setUser_one(rs.getString("user_one"));
				otoVO.setUser_two(rs.getString("user_two"));
				otoVO.setCr_time(rs.getTimestamp("cr_time"));
				otoVO.setCr_word(rs.getString("cr_word"));
				otoVO.setCr_pic(rs.getBytes("cr_pic"));
				otoVO.setCr_status(rs.getInt("cr_status"));
				
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
		return otoVO;
	}
	@Override
	public List<OtoVO> getAll() {
		List<OtoVO> list = new ArrayList<OtoVO>();
		OtoVO otoVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			con = con=ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				otoVO = new OtoVO();
				otoVO.setCr_id(rs.getString("cr_id"));
				otoVO.setUser_one(rs.getString("user_one"));
				otoVO.setUser_two(rs.getString("user_two"));
				otoVO.setCr_time(rs.getTimestamp("cr_time"));
				otoVO.setCr_word(rs.getString("cr_word"));
				otoVO.setCr_pic(rs.getBytes("cr_pic"));
				otoVO.setCr_status(rs.getInt("cr_status"));
				list.add(otoVO);
			}
		}  catch (SQLException se) {
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
