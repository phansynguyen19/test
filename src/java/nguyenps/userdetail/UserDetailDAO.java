/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyenps.userdetail;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyenps.util.DBHelpers;

/**
 *
 * @author Admin
 */
public class UserDetailDAO implements Serializable {
    
    private List<UserDetailDTO> listAccount;

    public List<UserDetailDTO> getListAccount() {
        return listAccount;
    }

    public UserDetailDTO checkLogin(String username, String password) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select lastname, isAdmin From UserDetail Where Username = ? And Password = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Query Data
                rs = stm.executeQuery();
                //5. Process
                if (rs.next()) {
                    String lastname = rs.getString("lastname");
                    boolean role = rs.getBoolean("isAdmin");
                    return new UserDetailDTO(username, password, lastname, role);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }

        return null;
    }

    

    public void searchLastname(String searchValue) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. make Connection
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select username, password, lastname, isAdmin From UserDetail Where lastname Like ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullname = rs.getString("lastname");
                    boolean role = rs.getBoolean("isAdmin");
                    UserDetailDTO dto = new UserDetailDTO(username, password, fullname, role);
                    if (this.listAccount == null) {
                        this.listAccount = new ArrayList<>();

                    }
                    this.listAccount.add(dto);
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
    }

    public boolean deleteAccount(String username) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            //1. make Connection
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Delete From UserDetail Where username = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4. Query Data
                int row = stm.executeUpdate();
                if (row > 0) {
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

    public boolean update(String username, String password, boolean isAdmin, String fullname) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        System.out.println(username + password + isAdmin + fullname);
        try {
            con = nguyenps.util.DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Update UserDetail Set Password = ?, isAdmin = ?, lastname = ? Where Username = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, password);
                pst.setBoolean(2, isAdmin);
                pst.setString(4, username);
                pst.setString(3, fullname);
                boolean row = pst.executeUpdate() > 0;
                System.out.println(row);
                if (row) {
                    return true;
                }
            }

        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean createAccount(UserDetailDTO dto) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            //1. make Connection
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Insert into UserDetail (Username, Password, lastname, isAdmin) Values (?,?,?,?)";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getPassword());
                stm.setString(3, dto.getFullname());
                stm.setBoolean(4, dto.isRole());
                
                //4. Query Data
                int row = stm.executeUpdate();
                if (row > 0) {
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
    
}
