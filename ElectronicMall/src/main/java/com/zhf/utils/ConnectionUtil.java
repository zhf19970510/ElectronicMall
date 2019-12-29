package com.zhf.utils;

import java.sql.*;


//所有工具类   功能方法都作为静态方法  方便调用
public class ConnectionUtil {
    private static String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static String URL = "jdbc:mysql://localhost:3306/shoppingstreet?useUnicode=false&amp&characterEncoding=utf-8";
    private static String USER_NAME = "root";
    private static String PASSWORD = "123456";

    //给连接四要素赋予数据信息
//    static {
//        InputStream ins = null;
//        Properties pp = null;
//        try {
//            String configFile = "jdbc.properties";
//            ins = DataSourceUtil.class.getClassLoader().getResourceAsStream(configFile);
//            pp = new Properties();
//            pp.load(ins);
//            DRIVER_NAME = pp.getProperty("driver");
//            URL = pp.getProperty("url");
//            USER_NAME = pp.getProperty("username");
//            PASSWORD = pp.getProperty("password");
//        } catch (FileNotFoundException e) {
//            System.out.println("文件未找到！");
//        } catch (IOException e) {
//            System.out.println("文件未找到！");
//        } finally {
//            try {
//                if(ins!=null) {
//                    ins.close();
//                }
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//
//    }

    //1.获取连接
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(DRIVER_NAME);
            conn = DriverManager.getConnection(URL, USER_NAME, PASSWORD);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    //所有的查询工具方法
    public static void DQL(String sql, Object[] objs, DoResultSetValue doRS) {
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            pst = conn.prepareStatement(sql);
            //设置占位符
            DQLSettle(pst,objs,rs,doRS);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pst, rs);
        }
    }


    public static void DQL(Connection conn,String sql, Object[] objs, DoResultSetValue doRS) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = conn.prepareStatement(sql);
            DQLSettle(pst,objs,rs,doRS);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if(rs!=null){
                    rs.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    public static void DQLSettle(PreparedStatement pst, Object[] objs,ResultSet rs,DoResultSetValue doRS) throws Exception{

        //设置占位符
        for (int i = 0; i < objs.length; i++) {

            pst.setObject(i + 1, objs[i]);
        }
        //获得结果集
        rs = pst.executeQuery();
        //处理结果集 不同的查询语句，字段不一样
        if (rs != null) {
            doRS.doResultSet(rs);
        }
    }


    //2.封装DML  (删除，修改，插入  3个操作称之为 DML操作)
    public static int DML(String sql, Object[] objs) {//objs用来保存传进来的参数 替换占位符的
        Connection conn = null;
        PreparedStatement pst = null;
        int rows = -1;
        try {
            conn = getConnection();
            pst = conn.prepareStatement(sql);
            rows = mytest(pst,objs);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pst, null);
        }
        return rows;
    }



    public static int DML(Connection conn, String sql, Object[] objs) throws SQLException {//objs用来保存传进来的参数 替换占位符的
        int rows = -1;
        PreparedStatement pst = null;
        try {
            pst = conn.prepareStatement(sql);
            rows = mytest(pst,objs);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(pst!=null) {
                pst.close();
            }
        }
        return rows;
    }


    public static boolean transaction(String[] sqls, Object[] objects) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean flag = true;
        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            for (String sql : sqls) {
                pstmt = conn.prepareStatement(sql);
                for (int i = 0; i < objects.length; i++) {
                    pstmt.setObject((i + 1), objects[i]);
                }
                pstmt.executeUpdate();
            }
            conn.commit();
        } catch (SQLException e) {
            try {
                conn.rollback();
                flag = false;
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        } finally {
            close(conn, pstmt, null);
        }
        return flag;
    }

    //3.关闭资源的功能方法
    public static void close(Connection conn, PreparedStatement pst, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection conn, PreparedStatement pst) {
        try {
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int mytest(PreparedStatement pst,Object[]objs)throws SQLException{

        //设置占位符号
        for (int i = 0; i < objs.length; i++) {
            //多态的写法
            pst.setObject((i + 1), objs[i]);
        }
        int rows = pst.executeUpdate();
        return rows;
    }
}
