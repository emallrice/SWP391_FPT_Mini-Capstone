/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AccountDAO {

    //ham nay de lay tata ca cac accounts
    public static ArrayList<Account> printAllAccounts() throws Exception {
        ArrayList<Account> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "SELECT AccID, Name, Email, Password, RoleID, Phone, Address, Status FROM dbo.Account";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AccID = table.getInt("AccID");
                        String Name = table.getString("Name");
                        String Email = table.getString("Email");
                        String Password = table.getString("Password");
                        int RoleID = table.getInt("RoleID");
                        String Phone = table.getString("Phone");
                        String Address = table.getString("Address");
                        int Status = table.getInt("Status");
                        Account acc = new Account(AccID, Name, Email, Password, RoleID, Phone, Address, Status);
                        result.add(acc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    //ham nay de lay tat ca cac accounts voi roll = 0 or 1
    public static ArrayList<Account> getAccountsWithRole(int RoleID) throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT AccID, Name, Email, Password, RoleID, Phone, Address, Status FROM dbo.Account WHERE RoleID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, RoleID);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int AccID = table.getInt("AccID");
                        String Name = table.getString("Name");
                        String Email = table.getString("Email");
                        String Password = table.getString("Password");
                        String Phone = table.getString("Phone");
                        String Address = table.getString("Address");
                        int Status = table.getInt("Status");
                        Account acc = new Account(AccID, Name, Email, Password, RoleID, Phone, Address, Status);
                        list.add(acc);

                    }
                }
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    //ham nay de lay 1 account dua vao email, pass, status =1(active)
    public static Account getAccounts(String Email, String Password) throws Exception {
        Account acc = null;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT AccID, Name, Email, Password, RoleID, Phone, Address, Status FROM dbo.Account WHERE Status=1 and Email = ? and Password = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, Email);
                pst.setString(2, Password);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int AccID = table.getInt("AccID");
                        String Name = table.getString("Name");
                        int RoleID = table.getInt("RoleID");
                        String Phone = table.getString("Phone");
                        String Address = table.getString("Address");
                        int Status = table.getInt("Status");
                        acc = new Account(AccID, Name, Email, Password, RoleID, Phone, Address, Status);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    public static Account getAccountsByEmail(String Email) throws Exception {
        Account acc = null;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT AccID, Name, Email, Password, RoleID, Phone, Address, Status FROM dbo.Account WHERE Email = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, Email);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int AccID = table.getInt("AccID");
                        String Name = table.getString("Name");
                        String Password = table.getString("Password");
                        int RoleID = table.getInt("RoleID");
                        String Phone = table.getString("Phone");
                        String Address = table.getString("Address");
                        int Status = table.getInt("Status");
                        acc = new Account(AccID, Name, Email, Password, RoleID, Phone, Address, Status);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    //ham nay de chen mot account vao bang account
    public static boolean insertAccounts(String Name, String Email, String Password, int RoleID, String Phone, String Address, int Status) throws Exception {
        int rs = 0;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "INSERT INTO dbo.Account (Name, Email, Password, RoleID, Phone, Address, Status)\n" +
"                    VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, Name);
            pst.setString(2, Email);
            pst.setString(3, Password);
            pst.setInt(4, 1);
            pst.setString(5, Phone);
            pst.setString(6, "");
            pst.setInt(7, 1);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
    
    public static boolean updateAccountStatus(int accid, int status) {
        Connection cn=null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if(cn!=null) {
                String sql="update dbo.Account set Status=? where AccID=?";
                PreparedStatement pst=cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, accid);
                pst.executeUpdate();
                pst.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn!=null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }
}
