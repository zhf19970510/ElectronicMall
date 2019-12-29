package com.zhf.dao;

import com.zhf.entity.Product;

import java.util.List;

/**
 * Created on 2019/12/23 0023.
 */
public interface ProductDao {
    public List<Product> queryAllProduct(int begin,int size);
    public int queryCount();

    List<Product> queryProductByKey(String key);

    Product getProductById(int id);
}
