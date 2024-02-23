package com.DAO;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDao {
	public int getOrderNo();
	public boolean saveOrder(List<BookOrder> blist);
	public List<BookOrder> getOrderBooks(String email);
	public List<BookOrder> getAllOrderBooks();
}
