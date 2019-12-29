package com.zhf.dao;

import com.zhf.entity.User;

/**
 * Created on 2019/12/24 0024.
 */
public interface UserDao {
    User getLoginUser(String loginName,String password);

    boolean queryName(String loginName);

    int insertUser(String loginName, String password);

    User queryUserById(int id);
}
