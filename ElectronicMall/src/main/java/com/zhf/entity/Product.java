package com.zhf.entity;

/**
 * Created on 2019/12/4 0004.
 * @author Administrator
 */
public class Product {
    private Integer id;//ID
    private String name;//商品名
    private String description;//描述
    private Float price;//单价
    private Integer stock;//数量
    private ProductCategory categoryLevel1;//一级分类
    private ProductCategory categoryLevel2;//二级分类
    private ProductCategory categoryLevel3;//三级分类
    private String fileName;//图片名称
    private Integer isDelete; //是否逻辑删除

    public Product() {
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }
    @Override
    public boolean equals(Object obj){
        if(this == obj){
            return true;
        }
        if(obj == null){
            return false;
        }
        if(getClass() != obj.getClass()){
            return false;
        }
        Product other = (Product) obj;
        if(id == null){
            if(other.id != null){
                return false;
            }
        }else if(!id.equals(other.id)){
            return false;
        }
        return true;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }



    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public ProductCategory getCategoryLevel1() {
        return categoryLevel1;
    }

    public void setCategoryLevel1(ProductCategory categoryLevel1) {
        this.categoryLevel1 = categoryLevel1;
    }

    public ProductCategory getCategoryLevel2() {
        return categoryLevel2;
    }

    public void setCategoryLevel2(ProductCategory categoryLevel2) {
        this.categoryLevel2 = categoryLevel2;
    }

    public ProductCategory getCategoryLevel3() {
        return categoryLevel3;
    }

    public void setCategoryLevel3(ProductCategory categoryLevel3) {
        this.categoryLevel3 = categoryLevel3;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}
