package com.post.model;

import java.io.*;
import java.sql.*;
import java.util.*;

public class PostJDBCDAO implements PostDAO_interface {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";
	
	private static final String INSERT_STMT = "INSERT INTO post (post_id, mem_id, ptype_id, p_status, p_title, text, image, last_edit) VALUES ('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), ?, ?, ?, ?, ?, ?, SYSDATE)";
	private static final String GET_ALL_STMT = "SELECT post_id, mem_id, ptype_id, p_status, p_title, text, image, last_edit, post_time FROM post ORDER BY post_id";
	private static final String GET_ONE_STMT = "SELECT post_id, mem_id, ptype_id, p_status, p_title, text, image, last_edit, post_time FROM post WHERE post_id = ?";
	private static final String DELETE = "DELETE FROM post WHERE post_id = ?";
	private static final String UPDATE = "UPDATE post SET ptype_id = ?, p_status = ?, p_title = ?, text = ?, image = ?, last_edit = SYSDATE WHERE post_id = ?";
	
	@Override
	public String insert(PostVO postVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String generatedKey = "";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			String[] cols = {"post_id"};
			pstmt = con.prepareStatement(INSERT_STMT, cols);
			
			pstmt.setString(1, postVO.getMem_id());
			pstmt.setInt(2, postVO.getPtype_id());
			pstmt.setInt(3, postVO.getP_status());
			pstmt.setString(4, postVO.getP_title());
			pstmt.setString(5, postVO.getText());
			pstmt.setBytes(6, postVO.getImage());
//			pstmt.setTimestamp(7, postVO.getLast_edit());
			
			pstmt.executeUpdate();
			
			rs = pstmt.getGeneratedKeys();
			rs.next();
			generatedKey = rs.getString(1);
			
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
		return generatedKey;
	}

	@Override
	public void update(PostVO postVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, postVO.getPtype_id());
			pstmt.setInt(2, postVO.getP_status());
			pstmt.setString(3, postVO.getP_title());
			pstmt.setString(4, postVO.getText());
			pstmt.setBytes(5, postVO.getImage());
			pstmt.setString(6, postVO.getPost_id());
			
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
	public void delete(String post_id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1, post_id);
			
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
	public PostVO findByPrimaryKey(String post_id) {
		
		PostVO postVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, post_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				postVO = new PostVO();
				postVO.setPost_id(rs.getString("post_id"));
				postVO.setMem_id(rs.getString("mem_id"));
				postVO.setPtype_id(rs.getInt("ptype_id"));
				postVO.setP_status(rs.getInt("p_status"));
				postVO.setP_title(rs.getString("p_title"));
				postVO.setText(rs.getString("text"));
				postVO.setImage(rs.getBytes("image"));
				postVO.setLast_edit(rs.getTimestamp("last_edit"));
				postVO.setPost_time(rs.getTimestamp("post_time"));
				
				
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
		return postVO;
	}

	@Override
	public List<PostVO> getAll() {
		
		List<PostVO> list = new ArrayList<PostVO>();
		PostVO postVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				postVO = new PostVO();
				postVO.setPost_id(rs.getString("post_id"));
				postVO.setMem_id(rs.getString("mem_id"));
				postVO.setPtype_id(rs.getInt("ptype_id"));
				postVO.setP_status(rs.getInt("p_status"));
				postVO.setP_title(rs.getString("p_title"));
				postVO.setText(rs.getString("text"));
				postVO.setImage(rs.getBytes("image"));
				postVO.setLast_edit(rs.getTimestamp("last_edit"));
				postVO.setPost_time(rs.getTimestamp("post_time"));
				list.add(postVO);
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
	
	public static void main(String[] args) {
		
		String post1, post2, post3, post4;
		byte[] image1, image2, image3, image4;
		try {
//			post1 = getLongString("WebContent/Forum/text/[問卦] 欸，白開水不是白色的啊？.txt");
//			post2 = getLongString("WebContent/Forum/text/[問卦] 8+9屁孩語錄有哪些？.txt");
//			post3 = getLongString("WebContent/Forum/text/[問卦] 只有台灣的牛排有麵嗎？.txt");
//			post4 = getLongString("WebContent/Forum/text/[問卦] 為什麼才剛上班就有人在刷牙？.txt");
////			
//			image1 = getPictureByteArray("WebContent/Forum/image/1.jpg");
//			image2 = getPictureByteArray("WebContent/Forum/image/2.png");
//			image3 = getPictureByteArray("WebContent/Forum/image/3.png");
			image4 = getPictureByteArray("WebContent/images/back1.gif");
			
			
			PostJDBCDAO dao = new PostJDBCDAO();
			
			// 新增文章
			PostVO postVO1 = new PostVO();
//			postVO1.setMem_id("M000001");
//			postVO1.setPtype_id(3);
//			postVO1.setP_status(1);
//			postVO1.setP_title("欸，白開水不是白色的啊？");
//			postVO1.setText(post1);
//			postVO1.setImage(image1);
//			dao.insert(postVO1);
//			
//			postVO1.setMem_id("M000002");
//			postVO1.setPtype_id(3);
//			postVO1.setP_status(1);
//			postVO1.setP_title("8+9屁孩語錄有哪些？");
//			postVO1.setText(post2);
//			postVO1.setImage(image2);
//			dao.insert(postVO1);
//			
//			postVO1.setMem_id("M000001");
//			postVO1.setPtype_id(3);
//			postVO1.setP_status(1);
//			postVO1.setP_title("只有台灣的牛排有麵嗎？");
//			postVO1.setText(post3);
//			postVO1.setImage(image3);
//			dao.insert(postVO1);
			
//			postVO1.setMem_id("M000001");
//			postVO1.setPtype_id(3);
//			postVO1.setP_status(1);
//			postVO1.setP_title("只有台灣的牛排有麵嗎？");
//			postVO1.setText("只有台灣的牛排有麵嗎？");
//			postVO1.setImage(image4);
//			java.sql.Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
//			postVO1.setLast_edit(ts);
//			dao.insert(postVO1);
//			
//			// 修改文章
//			PostVO postVO2 = new PostVO();
//			postVO2.setPtype_id(2);
//			postVO2.setP_status(1);
//			postVO2.setP_title("為什麼才剛上班就有人在刷牙？");
//			postVO2.setText(post4);
//			postVO2.setImage(image4);
//			postVO2.setPost_id("POST000001");
//			dao.update(postVO2);
			
			// 刪除文章
//			dao.delete("POST000002");
			
			// 查詢單筆
			PostVO postVO3 = dao.findByPrimaryKey("POST000003");
			System.out.println("POST_ID = " + postVO3.getPost_id() + ",");
			System.out.println("MEM_ID = " + postVO3.getMem_id() + ",");
			System.out.println("PTYPE_ID = " + postVO3.getPtype_id() + ",");
			System.out.println("P_STATUS = " + postVO3.getP_status() + ",");
			System.out.println("P_TITLE = " + postVO3.getP_title() + ",");
			System.out.println("TEXT = ");
			System.out.println(postVO3.getText() + ",");
//			readPicture(postVO3.getImage());
//			System.out.println("IMAGE writed to Output dictionary,");
			System.out.println("LAST_EDIT = " + postVO3.getLast_edit() + ",");
			System.out.println("POST_TIME = " + postVO3.getPost_time());
			System.out.println("========================");

			// 查詢全部
//			List<PostVO> list = dao.getAll();
//			for (PostVO aPost : list) {
//				System.out.println("POST_ID = " + aPost.getPost_id() + ",");
//				System.out.println("MEM_NO = " + aPost.getMem_id() + ",");
//				System.out.println("PTYPE_ID = " + aPost.getPtype_id() + ",");
//				System.out.println("P_STATUS = " + aPost.getP_status() + ",");
//				System.out.println("P_TITLE = " + aPost.getP_title() + ",");
//				System.out.println("TEXT = ");
//				System.out.println(aPost.getText() + ",");
//				System.out.println("IMAGE = " + aPost.getImage() + ",");
//				System.out.println("LAST_EDIT = " + aPost.getLast_edit() + ",");
//				System.out.println("POST_TIME = " + aPost.getPost_time());
//				System.out.println("========================");
//			}
			
		} catch (IOException ioe) {
			ioe.printStackTrace(System.err);
		}
	}
	
	public static String getLongString(String path) throws IOException {
		
		BufferedReader br = new BufferedReader(new FileReader(path));
		StringBuilder sb = new StringBuilder();
		String str;
		while ((str = br.readLine()) != null) {
			sb.append(str);
			sb.append("\n");
		}
		br.close();
		
		return sb.toString();
	}
	
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
	
	public static void readPicture(byte[] bytes) throws IOException {
		
		FileOutputStream fos = new FileOutputStream("Output/559.jpg");
		fos.write(bytes);
		fos.flush();
		fos.close();
	}



}
