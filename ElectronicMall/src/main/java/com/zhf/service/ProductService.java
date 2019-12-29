package com.zhf.service;

import com.zhf.entity.Page;
import com.zhf.entity.Product;

import java.util.List;

/**
 * Created on 2019/12/23 0023.
 */
public interface ProductService {
    public List<Product> queryAllProduct(Page<Product> page);

    List<Product> queryProductByKey(String key);

    Product getProductById(int id);
}
