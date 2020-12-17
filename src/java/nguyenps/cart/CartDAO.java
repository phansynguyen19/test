/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.cart;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.naming.NamingException;
import nguyenps.util.DBHelpers;

/**
 *
 * @author Admin
 */
public class CartDAO implements Serializable {

    public boolean saveCartItemToDatabase(String customerName, String customerAdd, Timestamp dateTime, float amount) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Insert into CartItem (CustomerName, CustomerAddress, Date, Amount) values (?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, customerName);
                stm.setString(2, customerAdd);
                stm.setTimestamp(3, dateTime);
                stm.setFloat(4, amount);
                int row = stm.executeUpdate();
                if(row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean saveBillToDatabase(String itemName, int id, int quantity) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Insert into Bill (ItemName, CartID, Quantity) values (?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, itemName);
                stm.setInt(2, id);
                stm.setInt(3, quantity);
                int row = stm.executeUpdate();
                if(row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    private int id;

    public int getId() {
        return id;
    }
    
    public boolean checkCustomer(String customerName, String customerAddress, float amount) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Select ID From CartItem Where Customername = ? And CustomerAddress = ? And Amount = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, customerName);
                stm.setString(2, customerAddress);
                stm.setFloat(3, amount);
                rs = stm.executeQuery();
                if(rs.next()) {
                    id = rs.getInt("ID");
                    return true;
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
