package com.bid.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BidDAO implements BidDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";
	
	private static final String INSERT_STMT ="INSERT INTO bid(bid_id, auct_id, buy_id, bid_prc, bid_time, bid_win)"
			+ "VALUES('BID'||LPAD(to_char(BID_SEQ.NEXTVAL), 6, '0'),?,?,?,?,?)";
	private static final String UPDATE_STMT ="UPDATE bid SET bid_id=?, auct_id=?, buy_id=?, bid_prc=?, bid_time=?, bid_win=? WHERE bid_id=?";
	private static final String DETELE_STMT ="DETELE FROM bid WHERE bid_id=?";
	private static final String GET_ONE_STMT ="SELECT bid_id, auct_id, buy_id, bid_prc, bid_time, bid_win FROM bid WHERE bid_id=?";
	private static final String GET_ALL_STMT ="SELECT * FROM bid order by bid_id";
	
	
	//新增出價
	@Override
	public void insert(BidVO bidVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, bidVO.getAuct_id());
			pstmt.setString(2, bidVO.getBuy_id());
			pstmt.setInt(3, bidVO.getBid_prc());
			pstmt.setTimestamp(4, bidVO.getBid_time());
			pstmt.setInt(5, bidVO.getBid_win());
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}
	

	@Override     //出價不能更新,直接新增一筆
	public void update(BidVO bidVO) {
		
	}
	
	@Override     //出價不能反悔,所以出價不能刪除
	public void delete(String bid_id) {
		
	}
	
	//查詢1筆出價
	@Override
	public BidVO findByPK(String bid_id) {
		BidVO bidVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1, bid_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bidVO = new BidVO();
				bidVO.setBid_id(rs.getString("bid_id"));
				bidVO.setAuct_id(rs.getString("auct_id"));
				bidVO.setBuy_id(rs.getString("buy_id"));
				bidVO.setBid_prc(rs.getInt("bid_prc"));
				bidVO.setBid_time(rs.getTimestamp("bid_time"));
				bidVO.setBid_win(rs.getInt("bid_win"));
			}//while迴圈
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
		
		return bidVO;
	}
	
	//查詢全部出價
	@Override
	public List<BidVO> getAll() {
		List<BidVO> list = new ArrayList<BidVO>();
		BidVO bidVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bidVO = new BidVO();
				bidVO.setBid_id(rs.getString("bid_id"));
				bidVO.setAuct_id(rs.getString("auct_id"));
				bidVO.setBuy_id(rs.getString("buy_id"));
				bidVO.setBid_prc(rs.getInt("bid_prc"));
				bidVO.setBid_time(rs.getTimestamp("bid_time"));
				bidVO.setBid_win(rs.getInt("bid_win"));
				
				list.add(bidVO);
			}//while迴圈
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
				
		return list;
	}
	

}
