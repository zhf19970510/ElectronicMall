package com.zhf.service;

import com.zhf.entity.User;

/**
 * Created on 2019/12/24 0024.
 */
public interface UserService {
    User getLoginUser(String loginName, String password);

    boolean queryName(String loginName);

    boolean addUser(String loginName, String password);

    User queryUserById(int id);
}
