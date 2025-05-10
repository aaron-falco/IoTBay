
package uts.isd.model.dao;

import uts.isd.Product;
import java.sql.*;
import java.util.ArrayList;


  public class DBManager {
  private Statement st;

  public DBManager(Connection conn) throws SQLException {
  st = conn.createStatement();

  }
  public Product findProduct(String productId) throws SQLException{
  String fetch = "select * from ISDUSer.Products where PRODUCTID = '" + productId + "'";
  ResultSet rs = st.executeQuery(fetch);
  while (rs.next()){
  String ProductId = rs.getString(1);
  if (ProductId.equals(productId)){
  String productName = rs.getString(2);
  String productdes = rs.getString(3);
  int productquantity = rs.getInt(4);
  float productprice = rs.getFloat(5);
  return new Product(ProductId, productName, productdes, productquantity, productprice);
  }
  }
  return null;
  }
  public void addProduct(String id, String name, String desc, int quantity, float price) throws SQLException{
  st.executeUpdate("INSERT INTO ISDUSER.Products" + "VALUES ('" + id + "', '" + name + "','" + desc + "','" + quantity + "','" + price + "')");
  }
   public void updateProduct(String id, String name, String desc, int quantity, float price) throws SQLException { 
        st.executeUpdate("UPDATE ISDUSER.Products SET productName = '" + name + "', productDescription = '" + desc + "', quantity = " + quantity + ", price = " + price + " WHERE productId = '" + id + "'"); 
    }
   

  }
