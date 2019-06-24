package com.service;

import java.util.List;

import com.model.User;

public interface IUserService {
   public void addUser(User user);
   public List<User> query();
}
