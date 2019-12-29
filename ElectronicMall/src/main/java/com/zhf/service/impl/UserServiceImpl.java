package com.zhf.service.impl;

import com.zhf.dao.UserDao;
import com.zhf.dao.impl.UserDaoImpl;
import com.zhf.entity.User;
import com.zhf.service.UserService;

/**
 * Created on 2019/12/24 0024.
 */
public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();
    @Override
    public User getLoginUser(String loginName, String password) {
        User user = null;
        try {
            user = userDao.getLoginUser(loginName, password);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean queryName(String loginName) {
        boolean exist = false;
        exist = userDao.queryName(loginName);
        return exist;
    }

    @Override
    public boolean addUser(String loginName, String password) {
        int i = userDao.insertUser(loginName, password);
        return i > 0;
    }

    @Override
    public User queryUserById(int id) {
        User user = userDao.queryUserById(id);
        return user;
    }
}
