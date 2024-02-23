package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.BookDetails;

public class BookDaoImpl implements BookDao {
	private Connection conn;

	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDetails b) {
		boolean f = false;
		try {
			String sql = "insert into book_details(bookname,author,price,bookcategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getUserEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDetails getBookById(int id) {
		BookDetails b=null;
		try {
			String sql="select * from book_details where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
		
	}

	@Override
	public boolean updateEditBooks(BookDetails b) {
		boolean f=false;
		try {
			String sql="update book_details set bookname=?,author=?,price=?,status=? where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			int i=ps.executeUpdate();
			if(i==1)
				f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deletBooks(int id) {
		boolean f=false;
		try {
			String sql="delete from book_details where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
				f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getNewBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next()&& i<=4) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next()&& i<=4) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next()&& i<=4) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDetails> getBookByOld(String bookCategory, String userEmail) {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where bookcategory=? and email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,bookCategory);
			ps.setString(2, userEmail);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteOldBook(String bookCategory, String userEmail, int bid) {
		boolean f=false;
		try {
			String sql="delete from book_details where bookid=? and bookcategory=? and email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setString(2, bookCategory);
			ps.setString(3, userEmail);
			int i=ps.executeUpdate();
			if(i==1)
				f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where bookname like ? or author like ? or bookcategory like ? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3,"%"+ch+"%");
			ps.setString(4,"Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				System.out.println("done");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
