package com.zhf.service.impl;

import com.zhf.dao.ProductDao;
import com.zhf.dao.impl.ProductDaoImpl;
import com.zhf.entity.Page;
import com.zhf.entity.Product;
import com.zhf.service.ProductService;

import java.util.List;

/**
 * Created on 2019/12/23 0023.
 */
public class ProductServiceImpl implements ProductService {
    private ProductDao productDao = new ProductDaoImpl();
    @Override
    public List<Product> queryAllProduct(Page<Product> page) {
        int count = productDao.queryCount();
        page.setTotalCount(count);
        int begin = (page.getCurrentPage()-1)*page.getPageSize();
        int size = page.getPageSize();
        List<Product> products = productDao.queryAllProduct(begin,size);
        return products;
    }

    @Override
    public List<Product> queryProductByKey(String key) {
        List<Product> products = productDao.queryProductByKey(key);
        return products;
    }

    @Override
    public Product getProductById(int id) {
        Product product = productDao.getProductById(id);
        return product;
    }
}
