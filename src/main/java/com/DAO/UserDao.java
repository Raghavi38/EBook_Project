package com.DAO;

import com.entity.Address;
import com.entity.User;

public interface UserDao {
public boolean UserRegister(User us);

public User login(String email,String password);

public boolean checkPassword(int id,String pass);

public boolean updateProfile(User us); 

public boolean checkUser(String email);

public boolean addAddress(String name,Address a);
}
