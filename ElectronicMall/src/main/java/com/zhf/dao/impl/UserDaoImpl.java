package com.zhf.dao.impl;

import com.zhf.dao.UserDao;
import com.zhf.entity.User;
import com.zhf.utils.ConnectionUtil;
import com.zhf.utils.DoResultSetValue;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2019/12/24 0024.
        */
public class UserDaoImpl implements UserDao {

    @Override
    public User getLoginUser(String loginName, String password) {
        String sql = "select id,loginName,password,email,mobile from user where loginName=? and password=?";
        User user = new User();
        ConnectionUtil.DQL(sql,new Object[]{loginName,password},(rs)->{
            userTableToPojo(rs, user);
        });
        if(user == null || user.getId()<1){
            return null;
        }
        return user;
    }

    public static void userTableToPojo(ResultSet rs, User user) {
        try {
            if (rs.next()) {
                user.setId(rs.getInt(1));
                user.setLoginName(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setMobile(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean queryName(String loginName) {
        String sql = "SELECT id FROM user WHERE loginName=?";
        List<Boolean> bs = new ArrayList<>();
        bs.add(0,false);
        ConnectionUtil.DQL(sql,new Object[]{loginName},(rs)->{
            try {
                if (rs.next()) {
                    bs.set(0,true);
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        });
        return bs.get(0);
    }

    @Override
    public int insertUser(String loginName, String password) {
        String sql = "INSERT INTO user(loginName,password) VALUES(?,?)";
        int dml = ConnectionUtil.DML(sql, new Object[]{loginName, password});
        return dml;
    }

    @Override
    public User queryUserById(int id) {
        String sql = "SELECT id,loginName,password,email,mobile from user where id = ?";
        User user = new User();
        ConnectionUtil.DQL(sql,new Object[]{id},(rs)->{
            userTableToPojo(rs, user);
        });
        if(user == null || user.getId()<1){
            return null;
        }
        return user;
    }
}
