/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.items;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import nguyenps.util.DBHelpers;

/**
 *
 * @author Admin
 */
public class ItemDAO implements Serializable{
    private int[] id;
    Map<String, Float> item = new HashMap<>();

    public Map<String, Float> getItem() {
        return item;
    }
    
    public void loadListItem() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            
            conn = DBHelpers.makeConnection();
            if(conn != null) {
                String sql = "Select ItemName, ItemPrice From Items";
                
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()) {
                    item.put(rs.getString("ItemName"), rs.getFloat("ItemPrice"));
                }
            }
        } finally {
            if(conn != null) {
                conn.close();
            }
            if(stm != null) {
                stm.close();
            }
            if(rs != null) {
                rs.close();
            } 
        }
        
    }
}
