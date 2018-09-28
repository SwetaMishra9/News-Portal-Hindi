/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mybean;
import java.io.PrintStream;
import java.sql.*;
public class Dbcon 
{
    Connection con;
    Statement st;
    ResultSet rs;
    int i;
    String connectionURL;
    
    public Dbcon()
    {
    
        con = null;
        st = null;
        rs = null;
        i = 0;
        
        connectionURL = "jdbc:mysql://localhost:3306/birth_day_db";
        
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(connectionURL, "root", "admin");
    }
    catch(Exception e){
        System.out.println(e);
         
    }
   }
    public void mkcon()
    {
        try
        {
            if(con == null)
        {
            con=DriverManager.getConnection(connectionURL, "root", "admin");
        }
         st=con.createStatement();
         System.out.println(con);
    }
     catch(Exception e){
        System.out.println(e);
    }
}
   
     public int dbupdate(String s)
     {
        try{
        
        if(st == null)
        {
           st = con.createStatement();         
            
        }
        i = st.executeUpdate(s);
        
        }
        catch(Exception e)
        {
            System.out.println(e);
        }   
      return i;
    }
    
    public ResultSet fetch(String s)
    {
        try
        {
        if(st  == null)
        {
             st = con.createStatement();
        }
        rs = st.executeQuery(s);
    }
     catch (Exception e)
     {
         System.out.println(e);
     }
        return rs;
    }
    public Connection getcon()
    {
        try
        {
            con = DriverManager.getConnection(connectionURL, "root", "admin");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    return con;
        
    }
}