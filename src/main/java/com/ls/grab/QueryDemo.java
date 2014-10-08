package com.ls.grab;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.Statement;  
  
public class QueryDemo {  
  
    /** 
     * @param args 
     */  
    //�����������֮ǰ��classpath�����õ�JDBC�����������JAR ����  
    public static final String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  
    //���ӵ�ַ���ɸ������ݿ������̵����ṩ�ģ�������Ҫ������ס  
    public static final String DBURL = "jdbc:microsoft:sqlserver://10.28.71.158:1433;DatabaseName=HRIdentity";  
    //�������ݿ���û���  
    public static final String DBUSER = "nscape";  
    //�������ݿ������  
    public static final String DBPASS = "DRpepper";  
      
      
    public static void main(String[] args) throws Exception {  
        Connection con = null; //��ʾ���ݿ�����Ӷ���  
        Statement stmt = null;  //��ʾ���ݿ�ĸ��²���  
        ResultSet result = null; //��ʾ�������ݿ�Ĳ�ѯ���  
        Class.forName(DBDRIVER); //1��ʹ��CLASS �������������  
        con = DriverManager.getConnection(DBURL,DBUSER,DBPASS); //2���������ݿ�  
        stmt = con.createStatement(); //3��Statement �ӿ���Ҫͨ��Connection �ӿڽ���ʵ��������  
        result = stmt.executeQuery("select b.FirstName, b.LastName from identity_tbl a, Person b where  a.IdentityID = b.PersonID "); //ִ��SQL ��䣬��ѯ���ݿ�  
        while (result.next()){  
            String name = result.getString("FirstName");  
            String address = result.getString("LastName");  
            System.out.println(name+address);  
        }  
                result.close();  
                con.close(); // 4���ر����ݿ�  
    }  
  
}  