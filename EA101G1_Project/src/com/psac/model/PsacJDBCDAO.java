package com.psac.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;



public class PsacJDBCDAO implements PsacDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";

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
	private static final String GET_StateEq_STMT = 
			"SELECT psac_no,mem_id,post_id,adm_no,psac_content,psac_state FROM postaccuse where psac_state=3 ";
	@Override
	public void insert(PsacVO psacVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, psacVO.getMem_id());
			pstmt.setString(2, psacVO.getPost_id());
			pstmt.setString(3, psacVO.getAdm_no());
			pstmt.setString(4, psacVO.getPsac_content());
			pstmt.setInt(5, psacVO.getPsac_state());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, psacVO.getMem_id());
			pstmt.setString(2, psacVO.getPost_id());
			pstmt.setString(3, psacVO.getAdm_no());
			pstmt.setString(4, psacVO.getPsac_content());
			pstmt.setInt(5, psacVO.getPsac_state());
			pstmt.setString(6, psacVO.getPsac_no());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, psac_no);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
			e.getMessage());
			
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

	
	public static void main(String[] args) {

		PsacJDBCDAO dao = new PsacJDBCDAO();

		// �憓�
//		PsacVO psacVO1 = new PsacVO();
//		psacVO1.setMem_id("M000001");
//		psacVO1.setPost_id("POST000001");
//		psacVO1.setAdm_no("ad000006");
//		psacVO1.setPsac_content("����泵");
//		psacVO1.setPsac_state(1);
//		dao.insert(psacVO1);
//
//		// 靽格
		PsacVO psacVO2 = new PsacVO();
		psacVO2.setPsac_no("p000006");
		psacVO2.setMem_id("M000002");
		psacVO2.setPost_id("POST000001");
		psacVO2.setAdm_no("ad000001");
		psacVO2.setPsac_content("������");
		psacVO2.setPsac_state(0);
		dao.update(psacVO2);

		// ��
//		dao.delete("p000007");

		// �閰�
//		PsacVO psacVO3 = dao.findByPrimaryKey("p000001");
//		System.out.print(psacVO3.getPsac_no() + ",");
//		System.out.print(psacVO3.getMem_id() + ",");
//		System.out.print(psacVO3.getPost_id() + ",");
//		System.out.print(psacVO3.getAdm_no() + ",");
//		System.out.print(psacVO3.getPsac_content() + ",");
//		System.out.print(psacVO3.getPsac_state() + ",");
//
//		// �閰�
//		List<PsacVO> list = dao.getAll();
//		for (PsacVO pPsac : list) {
//			System.out.print(pPsac.getPsac_no() + ",");
//			System.out.print(pPsac.getMem_id() + ",");
//			System.out.print(pPsac.getPost_id() + ",");
//			System.out.print(pPsac.getAdm_no() + ",");
//			System.out.print(pPsac.getPsac_content() + ",");
//			System.out.print(pPsac.getPsac_state() + ",");
//			System.out.println();
//		}
	}
	@Override
	public List<PsacVO> getStateEq() {
		List<PsacVO> list = null;
		PsacVO psacVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

//			con = ds.getConnection();
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_StateEq_STMT);
			list = new ArrayList<PsacVO>();
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
	
}




	


