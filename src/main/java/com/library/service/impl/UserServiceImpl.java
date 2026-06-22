package com.library.service.impl;

import com.library.entity.User;
import com.library.mapper.UserMapper;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional(readOnly = true)
    public User login(String username, String password) {
        User user = userMapper.findByUsername(username);
        if (user != null && password.equals(user.getPassword()) && Integer.valueOf(1).equals(user.getStatus())) {
            return user;
        }
        return null;
    }

    @Override
    public boolean register(User user) {
        if (existsUsername(user.getUsername())) {
            return false;
        }
        user.setRole(0);
        user.setStatus(1);
        return userMapper.insert(user) > 0;
    }

    @Override
    @Transactional(readOnly = true)
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public User findById(Integer id) {
        return userMapper.findById(id);
    }

    @Override
    public boolean add(User user) {
        if (existsUsername(user.getUsername())) {
            return false;
        }
        if (user.getRole() == null) user.setRole(0);
        if (user.getStatus() == null) user.setStatus(1);
        return userMapper.insert(user) > 0;
    }

    @Override
    public boolean update(User user) {
        return userMapper.update(user) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return userMapper.deleteById(id) > 0;
    }

    @Override
    public boolean updateStatus(Integer id, Integer status) {
        return userMapper.updateStatus(id, status) > 0;
    }

    @Override
    @Transactional(readOnly = true)
    public boolean existsUsername(String username) {
        return userMapper.findByUsername(username) != null;
    }
}
