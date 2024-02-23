package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Address;
import com.entity.User;

public class UserDaoImpl implements UserDao{
	private Connection conn;
	

	public UserDaoImpl(Connection conn) {
		super();
		this.conn=conn;
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean UserRegister(User us) {
		boolean f=false;
		try {
			//System.out.println("connected");
			String sql="insert into user (name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			//System.out.println("executed");
			ps.setString(1,us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3,us.getPhno());
			ps.setString(4,us.getPassword());
			int i=ps.executeUpdate();
			//System.out.println("updated");
			if(i==1) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			}
			return f;
	}

	@Override
	public User login(String email, String password) {
		User us = null;
	try {
		
		String sql="select * from user where email=? and password=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			us=new User();
			us.setId(rs.getInt(1));
			us.setName(rs.getString(2));
			us.setEmail(rs.getString(3));
			us.setPhno(rs.getString(4));
			us.setPassword(rs.getString(5));
			us.setAddress(rs.getString(6));
			us.setLandmark(rs.getString(7));
			us.setCity(rs.getString(8));
			us.setState(rs.getString(9));
			us.setPincode(rs.getString(10));
			System.out.println("query done");
		}
	}
		catch(Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id, String pass) {
		boolean f=false;
		try {
			String sql="select * from user where id=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2,pass);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		boolean f=false;
		try {
			//System.out.println("connected");
			String sql="update user set name=?,email=?,phno=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			System.out.println("executed");
			ps.setString(1,us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3,us.getPhno());
			ps.setInt(4, us.getId());
			int i=ps.executeUpdate();
			System.out.println("updated");
			if(i==1) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			}
			return f;
	}

	@Override
	public boolean checkUser(String email) {
		boolean f=true;
		try {
			//System.out.println("connected");
			String sql="select * from user where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			//System.out.println("executed");
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			System.out.println("updated");
			while(rs.next())
				f=false;
		}
		catch(Exception e) {
			e.printStackTrace();
			}
			return f;
	}

	@Override
	public boolean addAddress(String name,Address a) {
		boolean f=false;
		try {
			//System.out.println("connected");
			String sql="insert into address_details (address,landmark,city,state,pin) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			//System.out.println("executed");
			ps.setString(1,a.getAddress());
			ps.setString(2, a.getLandmark());
			ps.setString(3,a.getCity());
			ps.setString(4,a.getState());
			ps.setString(5,a.getPincode());
			
			String sql1="update user set address=?,landmark=?,city=?,state=?,pincode=? where name=?";
			PreparedStatement ps1=conn.prepareStatement(sql1);
			//System.out.println(name);
			ps1.setString(1,a.getAddress());
			ps1.setString(2, a.getLandmark());
			ps1.setString(3,a.getCity());
			ps1.setString(4,a.getState());
			ps1.setString(5,a.getPincode());
			ps1.setString(6,name);
			
			int i=ps.executeUpdate();
			int j=ps1.executeUpdate();
			//System.out.println("updated");
			if(i==1 && j==1) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			}
			return f;
	}
	
	}
