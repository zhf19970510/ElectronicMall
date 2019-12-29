package com.zhf.dao.impl;

import com.zhf.dao.ProductDao;
import com.zhf.entity.Product;
import com.zhf.entity.ProductCategory;
import com.zhf.utils.ConnectionUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2019/12/23 0023.
 */
public class ProductDaoImpl implements ProductDao {
    @Override
    public List<Product> queryAllProduct(int begin,int size) {

        String sql = "SELECT id,`name`,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete," +
                "(SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel1Id) AS category1," +
                "(SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel2Id) AS category2," +
                "(SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel3Id) AS category3 " +
                "FROM product B WHERE isDelete=0 limit ?,?";
        List<Product> products = fromResultGetList(begin, size, sql);
        return products;
    }
    @Override
    public int queryCount(){
        int result = 0;
        List<Integer> list = new ArrayList<>();
        String sql = "select count(1) from product WHERE isDelete=0";
        ConnectionUtil.DQL(sql,new Object[]{},(rs)->{
            try {
                if (rs.next()) {
                    int res = rs.getInt(1);
                    list.add(res);
                }
            }catch(SQLException e){
                e.printStackTrace();
            }
        });
        if(list.size()==1){
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<Product> queryProductByKey(String key) {

        String sql ="SELECT * FROM " +
                "(SELECT id,`name`,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete, " +
                " (SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel1Id) AS category1, " +
                " (SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel2Id) AS category2, " +
                " (SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel3Id) AS category3 " +
                "FROM product B) C " +
                "WHERE name like ? or category1 like ?";
        key = "%"+key+"%";
        List<Product> products = fromResultGetList(key, key, sql);
        return products;
    }

    @Override
    public Product getProductById(int id) {
        String sql = "SELECT id,`name`,description,price,stock,categoryLevel1Id,categoryLevel2Id,categoryLevel3Id,fileName,isDelete,(SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel1Id) AS category1, (SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel2Id) AS category2, (SELECT A.`name` FROM product_category A WHERE A.id=B.categoryLevel3Id) AS category3 FROM product B WHERE id=?";
        Product product = new Product();
        ConnectionUtil.DQL(sql,new Object[]{id},(rs)->{
            try {
                if (rs.next()){
                    tableToPojo(product, rs,new Integer[]{1,2,3,4,5,6,7,8,9,10,11,12,13});
                }
            }catch (Exception e) {
                e.printStackTrace();
            }
        });

        return product;
    }

    public  static void tableToPojo(Product product, ResultSet rs,Integer[]resultIndex) throws SQLException {
        int productId =rs.getInt(resultIndex[0]);
        String productName = rs.getString(resultIndex[1]);
        String description = rs.getString(resultIndex[2]);
        double price = rs.getDouble(resultIndex[3]);
        int stock = rs.getInt(resultIndex[4]);
        int categoryLevel1Id = rs.getInt(resultIndex[5]);
        int categoryLevel2Id = rs.getInt(resultIndex[6]);
        int categoryLevel3Id = rs.getInt(resultIndex[7]);
        String fileName = rs.getString(resultIndex[8]);
        int isDelete = rs.getInt(resultIndex[9]);
        String categoryLevel1Name = rs.getString(resultIndex[10]);
        String categoryLevel2Name = rs.getString(resultIndex[11]);
        String categoryLevel3Name = rs.getString(resultIndex[12]);
        ProductCategory categoryLevel1 = new ProductCategory(categoryLevel1Id,categoryLevel1Name);
        ProductCategory categoryLevel2 = new ProductCategory(categoryLevel2Id,categoryLevel2Name);
        ProductCategory categoryLevel3 = new ProductCategory(categoryLevel3Id,categoryLevel3Name);
        product.setId(productId);
        product.setName(productName);
        product.setDescription(description);
        product.setPrice((float)price);
        product.setStock(stock);
        product.setFileName(fileName);
        product.setIsDelete(isDelete);
        product.setCategoryLevel1(categoryLevel1);
        product.setCategoryLevel2(categoryLevel2);
        product.setCategoryLevel3(categoryLevel3);
    }

    private List<Product> fromResultGetList(Object obj1,Object obj2,String sql){
        List<Product> products = new ArrayList<>();
        ConnectionUtil.DQL(sql,new Object[]{obj1,obj2},(rs)->{
            try {
                while (rs.next()){
                    Product product = new Product();
                    tableToPojo(product, rs,new Integer[]{1,2,3,4,5,6,7,8,9,10,11,12,13});
                    products.add(product);
                }
            }catch (Exception e) {
                e.printStackTrace();
            }
        });

        return products;
    }

}
