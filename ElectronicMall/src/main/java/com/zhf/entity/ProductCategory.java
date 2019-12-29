package com.zhf.entity;

/**
 * Created on 2019/12/24 0024.
 */
public class ProductCategory {
    private int id;
    private String name;
    private int parentId;
    private int type;

    public ProductCategory(){

    }
    public ProductCategory(int id,String name){
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
