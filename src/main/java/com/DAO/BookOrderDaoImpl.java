package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class BookOrderDaoImpl implements BookOrderDao {
	private Connection conn;

	public BookOrderDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {
		int i = 1;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next())
				i++;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean saveOrder(List<BookOrder> blist) {
		boolean f = false;
		try {
			String sql = "insert into bookorder(order_id,user_name,email,address,phno,bookname,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for (BookOrder b : blist) {
				ps.setString(1, b.getOrder_id());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladdress());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
			}
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookOrder> getOrderBooks(String email) {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder b = null;
		try {
			String sql = "select * from bookorder where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrder_id(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFulladdress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookOrder> getAllOrderBooks() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder b = null;
		try {
			String sql = "select * from bookorder";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookOrder();
				b.setId(rs.getInt(1));
				b.setOrder_id(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFulladdress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
