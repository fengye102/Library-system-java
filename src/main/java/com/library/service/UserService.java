package com.library.service;

import com.library.entity.User;
import java.util.List;

public interface UserService {
    User login(String username, String password);
    boolean register(User user);
    List<User> findAll();
    User findById(Integer id);
    boolean add(User user);
    boolean update(User user);
    boolean delete(Integer id);
    boolean updateStatus(Integer id, Integer status);
    boolean existsUsername(String username);
}
