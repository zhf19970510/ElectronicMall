package com.zhf.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2019/12/24 0024.
 */
public class Page<T> {

    private int currentPage; //当前处于第几页
    private int pageSize = 10;	//每页展示几条数据
    private int totalPage; 	//总页数
    private int totalCount; //总条数

    private List<T> data = new ArrayList<>();//当页需要展示的数据

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;

        this.totalPage = totalCount%pageSize==0 ? totalCount/pageSize : totalCount/pageSize+1;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }


}
