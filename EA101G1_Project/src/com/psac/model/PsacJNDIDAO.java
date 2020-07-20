package com.psac.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class PsacJNDIDAO implements PsacDAO_interface {

	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	private static final String INSERT_STMT = 
			"INSERT INTO postaccuse (psac_no,mem_id,post_id,adm_no,psac_content,psac_state) VALUES ('p'||LPAD(to_char(postaccuse_seq.NEXTVAL),6,'0'), ?, ?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT psac_no,mem_id,post_id,adm_no,psac_content,psac_state FROM postaccuse order by psac_no";
		private static final String GET_ONE_STMT = 
			"SELECT psac_no,mem_id,post_id,adm_no,psac_content,psac_state FROM postaccuse where psac_no = ?";
		private static final String DELETE = 
			"DELETE FROM postaccuse where psac_no = ?";
		private static final String UPDATE = 
			"UPDATE postaccuse set mem_id=?, post_id=?, adm_no=?, psac_content=?, psac_state=? where psac_no = ?";
		@Override
		public void insert(PsacVO psacVO) {
			
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, psacVO.getMem_id());
				pstmt.setString(2, psacVO.getPost_id());
				pstmt.setString(3, psacVO.getAdm_no());
				pstmt.setString(4, psacVO.getPsac_content());
				pstmt.setInt(5, psacVO.getPsac_state());

				pstmt.executeUpdate();

			} catch (SQLException se) {
				throw new RuntimeException(
				se.getMessage());
				
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
		public void update(PsacVO psacVO) {
			
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);

				pstmt.setString(1, psacVO.getMem_id());
				pstmt.setString(2, psacVO.getPost_id());
				pstmt.setString(3, psacVO.getAdm_no());
				pstmt.setString(4, psacVO.getPsac_content());
				pstmt.setInt(5, psacVO.getPsac_state());
				pstmt.setString(6, psacVO.getPsac_no());

				pstmt.executeUpdate();

				} catch (SQLException se) {
				throw new RuntimeException(
				se.getMessage());
				
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
		public void delete(String psac_no) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, psac_no);

				pstmt.executeUpdate();
				
			} catch (SQLException se) {
				throw new RuntimeException(
				se.getMessage());
				
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
		public PsacVO findByPrimaryKey(String psac_no) {
			
			PsacVO psacVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, psac_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					psacVO = new PsacVO();
					psacVO.setPsac_no(rs.getString("psac_no"));
					psacVO.setMem_id(rs.getString("mem_id"));
					psacVO.setPost_id(rs.getString("post_id"));
					psacVO.setAdm_no(rs.getString("adm_no"));
					psacVO.setPsac_content(rs.getString("psac_content"));
					psacVO.setPsac_state(rs.getInt("psac_state"));
					
				}

				
			} catch (SQLException se) {
				throw new RuntimeException(
				se.getMessage());
				
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
			return psacVO;
		}
		@Override
		public List<PsacVO> getAll() {
			
			List<PsacVO> list = new ArrayList<PsacVO>();
			PsacVO psacVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					psacVO = new PsacVO();
					psacVO.setPsac_no(rs.getString("psac_no"));
					psacVO.setMem_id(rs.getString("mem_id"));
					psacVO.setPost_id(rs.getString("post_id"));
					psacVO.setAdm_no(rs.getString("adm_no"));
					psacVO.setPsac_content(rs.getString("psac_content"));
					psacVO.setPsac_state(rs.getInt("psac_state"));
					list.add(psacVO); 
				}

				
			} catch (SQLException se) {
				throw new RuntimeException(
				se.getMessage());
				
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
		public List<PsacVO> getStateEq() {
			// TODO Auto-generated method stub
			return null;
		}
	
}
