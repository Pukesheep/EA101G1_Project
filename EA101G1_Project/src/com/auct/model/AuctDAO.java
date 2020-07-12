package com.auct.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.bid.model.BidVO;

public class AuctDAO implements AuctDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "EA101G1";
	String passwd = "123456";
	
	private static final String INSERT_PRO_STMT = "INSERT INTO auct (auct_id, sale_id, pt_id, auct_name, auct_start," + 
			"			             auct_end,marketPrice, initPrice, auct_inc, auct_desc, auct_pic, auct_sold, auct_down,pay_end)"
			+ "VALUES('AUCT'||LPAD(to_char(AUCT_SEQ.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	private static final String UPDATE_PRO_STMT = "UPDATE auct set pt_id=?, auct_name=?, auct_start=?," + 
			"		auct_end=?,marketPrice=?, initPrice=?, auct_inc=?, auct_desc=?, auct_pic=?,pay_end=?,auct_down=?"
			+ "WHERE auct_id=?";
	
	private static final String GET_ONE_STMT = "SELECT auct_id, sale_id, pt_id, auct_name, auct_start," + 
			"auct_end,marketPrice, initPrice, auct_inc, auct_desc, auct_pic, auct_sold, auct_down,pay_end FROM auct WHERE auct_id =?";
	
	private static final String GET_ALL_STMT = "SELECT auct_id, sale_id, pt_id, auct_name, auct_start," + 
			"auct_end,marketPrice, initPrice, auct_inc, auct_desc, auct_pic, auct_sold, auct_down,pay_end FROM auct order by auct_id desc";
	
	private static final String GET_ALL_BY_MEM = "SELECT auct_id, sale_id, pt_id, auct_name, auct_start," + 
			"auct_end,marketPrice, initPrice, auct_inc, auct_desc, auct_pic, auct_sold, auct_down,pay_end FROM auct WHERE sale_id=? order by auct_id desc";
	
	private static final String GET_Bids_ByAuctId_STMT = "SELECT * FROM bid WHERE auct_id=?";
	
	private static final String UPDATE_Auct_down = "UPDATE auct set auct_down=? WHERE auct_id=?";
	
	private static final String UPDATE_Auct_sold = "UPDATE auct set auct_sold=? WHERE auct_id=?";
	
	private static final String UPDATE_WINNER = "UPDATE auct SET auct_sold=?,auct_down=?,buy_id=?,maxPrice=?,ord_time=?,ordstat_id=? WHERE auct_id=?";
	private static final String UPDATE_ORDSTAT = "UPDATE auct SET ordstat_id=? WHERE auct_id=?";//沒有買家就沒有訂單
	private static final String GET_ONE_ORDSTATID = "SELECT buy_id,maxPrice,ordstat_id FROM auct WHERE auct_id=?";
	
	private static final String UPDATE_ORD = "UPDATE auct SET ordstat_id=?,ord_time=?,rcpt_name=?,rcpt_cel=?,rcpt_add=? WHERE auct_id=?";
	private static final String GET_ONE_ORD = "SELECT buy_id,maxPrice,ordstat_id,ord_time,rcpt_name,rcpt_cel,rcpt_add FROM auct WHERE auct_id=?";
	
	private static final String GET_ALL_ALL_STMT = "SELECT auct_id, sale_id,buy_id, pt_id, auct_name, auct_start," + 
			"auct_end,marketPrice, initPrice, auct_inc,maxPrice, auct_desc, auct_pic, auct_sold, auct_down,ordstat_id,ord_time,pay_end,rcpt_name,rcpt_cel,rcpt_add FROM auct order by auct_id desc";
	
	//新增 (拍賣商品)
	@Override
	public void insert_auct(AuctVO auctVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT_PRO_STMT);
			
			pstmt.setString(1,auctVO.getSale_id());
			pstmt.setString(2,auctVO.getPt_id());
			pstmt.setString(3,auctVO.getAuct_name());
			pstmt.setTimestamp(4,auctVO.getAuct_start());
			pstmt.setTimestamp(5,auctVO.getAuct_end());
			
			pstmt.setInt(6,auctVO.getMarketPrice());
			pstmt.setInt(7,auctVO.getInitPrice());
			pstmt.setInt(8,auctVO.getAuct_inc());
			pstmt.setString(9,auctVO.getAuct_desc());
			
			pstmt.setBytes(10,auctVO.getAuct_pic());
			pstmt.setInt(11,auctVO.getAuct_sold());
			pstmt.setInt(12,auctVO.getAuct_down());
			pstmt.setTimestamp(13,auctVO.getPay_end());
			
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
	}

	//修改商品內容
	@Override
	public void update_auct(AuctVO auctVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE_PRO_STMT);
			
			pstmt.setString(1,auctVO.getPt_id());
			pstmt.setString(2,auctVO.getAuct_name());
			pstmt.setTimestamp(3,auctVO.getAuct_start());
			pstmt.setTimestamp(4,auctVO.getAuct_end());
			
			pstmt.setInt(5,auctVO.getMarketPrice());
			pstmt.setInt(6,auctVO.getInitPrice());
			pstmt.setInt(7,auctVO.getAuct_inc());
			pstmt.setString(8,auctVO.getAuct_desc());
			
			pstmt.setBytes(9,auctVO.getAuct_pic());
			pstmt.setTimestamp(10,auctVO.getPay_end());
			pstmt.setInt(11,auctVO.getAuct_down());
			pstmt.setString(12,auctVO.getAuct_id());
			
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
	}


	//查詢單一商品
	@Override
	public AuctVO listOneAuct(String auct_id) {
		
		AuctVO auctVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
	try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url,userid,passwd);
		pstmt = con.prepareStatement(GET_ONE_STMT);
		
		pstmt.setString(1, auct_id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			auctVO = new AuctVO();
			auctVO.setAuct_id(rs.getString("auct_id"));
			auctVO.setSale_id(rs.getString("sale_id"));
//			
			auctVO.setPt_id(rs.getString("pt_id"));
			auctVO.setAuct_name(rs.getString("auct_name"));
			
			auctVO.setAuct_start(rs.getTimestamp("auct_start"));
			auctVO.setAuct_end(rs.getTimestamp("auct_end"));
			
			auctVO.setMarketPrice(rs.getInt("marketPrice"));
			auctVO.setInitPrice(rs.getInt("initPrice"));
			auctVO.setAuct_inc(rs.getInt("auct_inc"));
//			
			auctVO.setAuct_desc(rs.getString("auct_desc"));
			auctVO.setAuct_pic(rs.getBytes("auct_pic"));			
			auctVO.setAuct_sold(rs.getInt("auct_sold"));
			auctVO.setAuct_down(rs.getInt("auct_down"));

			auctVO.setPay_end(rs.getTimestamp("pay_end"));

			
		}//while迴圈
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		return auctVO;
	}

	//查詢全部商品
	@Override
	public List<AuctVO> getAll() {
		List<AuctVO> list = new ArrayList<AuctVO>();
		AuctVO auctVO =null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
	try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url,userid,passwd);
		pstmt = con.prepareStatement(GET_ALL_STMT);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			auctVO = new AuctVO();
			auctVO.setAuct_id(rs.getString("auct_id"));
			auctVO.setSale_id(rs.getString("sale_id"));
			auctVO.setPt_id(rs.getString("pt_id"));
			auctVO.setAuct_name(rs.getString("auct_name"));
			
			auctVO.setAuct_start(rs.getTimestamp("auct_start"));
			auctVO.setAuct_end(rs.getTimestamp("auct_end"));
			
			auctVO.setMarketPrice(rs.getInt("marketPrice"));
			auctVO.setInitPrice(rs.getInt("initPrice"));
			auctVO.setAuct_inc(rs.getInt("auct_inc"));
			auctVO.setAuct_desc(rs.getString("auct_desc"));
			auctVO.setAuct_pic(rs.getBytes("auct_pic"));			
			auctVO.setAuct_sold(rs.getInt("auct_sold"));
			auctVO.setAuct_down(rs.getInt("auct_down"));			
			
			auctVO.setPay_end(rs.getTimestamp("pay_end"));
			
			list.add(auctVO);
		}//while迴圈
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	//賣家查詢自己上架的商品
		@Override
		public List<AuctVO> getAllByMem(String sale_id) {
			List<AuctVO> list = new ArrayList<AuctVO>();
			AuctVO auctVO =null;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
		try {	
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ALL_BY_MEM);
			
			pstmt.setString(1, sale_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				auctVO = new AuctVO();
				
				auctVO.setAuct_id(rs.getString("auct_id"));
				auctVO.setSale_id(rs.getString("sale_id"));
				auctVO.setPt_id(rs.getString("pt_id"));
				auctVO.setAuct_name(rs.getString("auct_name"));
				
				auctVO.setAuct_start(rs.getTimestamp("auct_start"));
				auctVO.setAuct_end(rs.getTimestamp("auct_end"));
				
				auctVO.setMarketPrice(rs.getInt("marketPrice"));
				auctVO.setInitPrice(rs.getInt("initPrice"));
				auctVO.setAuct_inc(rs.getInt("auct_inc"));
				auctVO.setAuct_desc(rs.getString("auct_desc"));
				auctVO.setAuct_pic(rs.getBytes("auct_pic"));			
				auctVO.setAuct_sold(rs.getInt("auct_sold"));
				auctVO.setAuct_down(rs.getInt("auct_down"));			
				
				auctVO.setPay_end(rs.getTimestamp("pay_end"));
				
				list.add(auctVO);
			}//while迴圈
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			return list;
		}
	
	//查詢該商品，對應的出價
	@Override
	public Set<BidVO> getBidsBy_auctId(String auct_id){
		Set<BidVO> set = new LinkedHashSet<BidVO>();
		BidVO bidVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
	try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url,userid,passwd);
		pstmt = con.prepareStatement(GET_Bids_ByAuctId_STMT);
		pstmt.setString(1, auct_id);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			bidVO = new BidVO();
			bidVO.setBid_id(rs.getString("bid_id"));
			bidVO.setAuct_id(rs.getString("auct_id"));
			bidVO.setBuy_id(rs.getString("buy_id"));
			bidVO.setBid_prc(rs.getInt("bid_prc"));
			bidVO.setBid_time(rs.getTimestamp("bid_time"));
			bidVO.setBid_win(rs.getInt("bid_win"));
			
			set.add(bidVO);
		}//while迴圈
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return set;
		
	}
	
	//修改上下架狀態
	@Override
	public void update_auct_down(AuctVO auctVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE_Auct_down);
			
			pstmt.setInt(1,auctVO.getAuct_down());
			pstmt.setString(2,auctVO.getAuct_id());

			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
	}
	
	//修改售出狀態
		@Override
		public void update_auct_sold(AuctVO auctVO) {
			Connection con =null;
			PreparedStatement pstmt = null;
			
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url,userid,passwd);
				pstmt = con.prepareStatement(UPDATE_Auct_sold);
				
				pstmt.setInt(1,auctVO.getAuct_sold());
				pstmt.setString(2,auctVO.getAuct_id());

				pstmt.executeUpdate();				
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}		
			
		}
		
	
	//更新得標者
	@Override
	public void update_winner(AuctVO auctVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE_WINNER);
			
			pstmt.setInt(1,auctVO.getAuct_sold());
			pstmt.setInt(2,auctVO.getAuct_down());
			pstmt.setString(3,auctVO.getBuy_id());
			pstmt.setInt(4,auctVO.getMaxPrice());
			pstmt.setTimestamp(5,auctVO.getOrd_time());
			pstmt.setString(6,auctVO.getOrdstat_id());
			pstmt.setString(7,auctVO.getAuct_id());
			
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}
	
	
	//更新訂單狀態
	@Override
	public void update_ordstat_id(AuctVO auctVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE_ORDSTAT);
			
			pstmt.setString(1,auctVO.getOrdstat_id());
			pstmt.setString(2, auctVO.getAuct_id());
			
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
	}

	//查詢得標訂單狀況
	@Override
	public AuctVO listOneWinStat(String auct_id) {
		
		AuctVO auctVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
	try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url,userid,passwd);
		pstmt = con.prepareStatement(GET_ONE_ORDSTATID);
		
		pstmt.setString(1, auct_id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			auctVO = new AuctVO();
			auctVO.setBuy_id(rs.getString("buy_id"));
			auctVO.setMaxPrice(rs.getInt("maxPrice"));
			auctVO.setOrdstat_id(rs.getString("ordstat_id"));
		}//while迴圈
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return auctVO;
	}

	//更新訂單資訊
	@Override
	public void update_ord(AuctVO auctVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE_ORD);
			
			pstmt.setString(1,auctVO.getOrdstat_id());
			pstmt.setTimestamp(2,auctVO.getOrd_time());
			pstmt.setString(3,auctVO.getRcpt_name());
			pstmt.setString(4,auctVO.getRcpt_cel());
			pstmt.setString(5,auctVO.getRcpt_add());		
			pstmt.setString(6, auctVO.getAuct_id());
			
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
	}

	//查詢訂單資訊
	@Override
	public AuctVO listOneOrd(String auct_id) {
		AuctVO auctVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
	try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url,userid,passwd);
		pstmt = con.prepareStatement(GET_ONE_ORD);
		
		pstmt.setString(1, auct_id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			auctVO = new AuctVO();
			auctVO.setBuy_id(rs.getString("buy_id"));
			auctVO.setMaxPrice(rs.getInt("maxPrice"));
			auctVO.setOrdstat_id(rs.getString("ordstat_id"));
			auctVO.setOrd_time(rs.getTimestamp("ord_time"));
			auctVO.setRcpt_name(rs.getString("rcpt_name"));
			auctVO.setRcpt_cel(rs.getString("rcpt_cel"));
			auctVO.setRcpt_add(rs.getString("rcpt_add"));		
		}//while迴圈
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return auctVO;
	}

	//前台上架(陳列)
	@Override
	public List<AuctVO> getAllFront() {
		List<AuctVO> list = new ArrayList<AuctVO>();
		AuctVO auctVO =null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
	try {	
		Class.forName(driver);
		con = DriverManager.getConnection(url,userid,passwd);
		pstmt = con.prepareStatement(GET_ALL_STMT);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			auctVO = new AuctVO();
			
			java.util.GregorianCalendar time = new java.util.GregorianCalendar();
			long now_ms = time.getTimeInMillis();
			
			long b = (rs.getTimestamp("auct_end") ).getTime();			
			
			if(rs.getInt("auct_down")==0 && rs.getInt("auct_sold")==0 && now_ms<=b ){ //if （上架=0）&& (未售出=1)&& 必須在 結束前 
			auctVO.setAuct_id(rs.getString("auct_id"));
			auctVO.setSale_id(rs.getString("sale_id"));
			auctVO.setPt_id(rs.getString("pt_id"));
			auctVO.setAuct_name(rs.getString("auct_name"));
			
			auctVO.setAuct_start(rs.getTimestamp("auct_start"));
			auctVO.setAuct_end(rs.getTimestamp("auct_end"));
			
			auctVO.setMarketPrice(rs.getInt("marketPrice"));
			auctVO.setInitPrice(rs.getInt("initPrice"));
			auctVO.setAuct_inc(rs.getInt("auct_inc"));
			auctVO.setAuct_desc(rs.getString("auct_desc"));
			auctVO.setAuct_pic(rs.getBytes("auct_pic"));			
			auctVO.setAuct_sold(rs.getInt("auct_sold"));
			auctVO.setAuct_down(rs.getInt("auct_down"));			
			
			auctVO.setPay_end(rs.getTimestamp("pay_end"));
			
			list.add(auctVO);
			}//if （上架=0）
			
		}//while迴圈
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}
	
	//前台結標（陳列）
		@Override
		public List<AuctVO> getAllResult() {
			List<AuctVO> list = new ArrayList<AuctVO>();
			AuctVO auctVO =null;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
		try {	
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				auctVO = new AuctVO();
				
				if(rs.getInt("auct_down")==1 && rs.getInt("auct_sold")==1 ){ //if （下架=1）&& (售出=1)
					auctVO.setAuct_id(rs.getString("auct_id"));
					auctVO.setSale_id(rs.getString("sale_id"));
					auctVO.setPt_id(rs.getString("pt_id"));
					auctVO.setAuct_name(rs.getString("auct_name"));
					
					auctVO.setAuct_start(rs.getTimestamp("auct_start"));
					auctVO.setAuct_end(rs.getTimestamp("auct_end"));
					
					auctVO.setMarketPrice(rs.getInt("marketPrice"));
					auctVO.setInitPrice(rs.getInt("initPrice"));
					auctVO.setAuct_inc(rs.getInt("auct_inc"));
					auctVO.setAuct_desc(rs.getString("auct_desc"));
					auctVO.setAuct_pic(rs.getBytes("auct_pic"));			
					auctVO.setAuct_sold(rs.getInt("auct_sold"));
					auctVO.setAuct_down(rs.getInt("auct_down"));			
					
					auctVO.setPay_end(rs.getTimestamp("pay_end"));
					
					list.add(auctVO);
					} //if （下架=1）&& (售出=1)
				
			}//while迴圈
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
			return list;
		}

		@Override
		public List<AuctVO> getAll_all() {
			List<AuctVO> list = new ArrayList<AuctVO>();
			AuctVO auctVO =null;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
		try {	
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ALL_ALL_STMT);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				auctVO = new AuctVO();
			if(rs.getString("buy_id")!=null ){ //如果有買家
				auctVO.setAuct_id(rs.getString("auct_id"));
				auctVO.setSale_id(rs.getString("sale_id"));
				auctVO.setBuy_id(rs.getString("buy_id"));
				auctVO.setPt_id(rs.getString("pt_id"));
				auctVO.setAuct_name(rs.getString("auct_name"));
				
				auctVO.setAuct_start(rs.getTimestamp("auct_start"));
				auctVO.setAuct_end(rs.getTimestamp("auct_end"));
				
				auctVO.setMarketPrice(rs.getInt("marketPrice"));
				auctVO.setInitPrice(rs.getInt("initPrice"));
				auctVO.setAuct_inc(rs.getInt("auct_inc"));
				auctVO.setMaxPrice(rs.getInt("maxPrice"));
				auctVO.setAuct_desc(rs.getString("auct_desc"));
				auctVO.setAuct_pic(rs.getBytes("auct_pic"));			
				auctVO.setAuct_sold(rs.getInt("auct_sold"));
				auctVO.setAuct_down(rs.getInt("auct_down"));
				auctVO.setOrdstat_id(rs.getString("ordstat_id"));
				auctVO.setOrd_time(rs.getTimestamp("ord_time"));
				
				auctVO.setPay_end(rs.getTimestamp("pay_end"));
				
				auctVO.setRcpt_name(rs.getString("rcpt_name"));
				auctVO.setRcpt_cel(rs.getString("rcpt_cel"));
				auctVO.setRcpt_add(rs.getString("rcpt_add"));
				
				list.add(auctVO);
				
				}// if--end
			}//while迴圈
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (con != null) {
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
