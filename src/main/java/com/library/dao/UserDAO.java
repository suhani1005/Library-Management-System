package com.library.dao;

import com.library.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAO {

    // Register a new user
    public boolean registerUser(
            String firstName,
            String lastName,
            String email,
            String password,
            String phoneNo,
            String address) {

        String sql = "INSERT INTO users "
                + "(first_name, last_name, email, password, phone_no, address) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        // Hash password before saving it
        String hashedPassword = BCrypt.hashpw(
                password, BCrypt.gensalt());

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, hashedPassword);
            ps.setString(5, phoneNo);
            ps.setString(6, address);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException("Unable to register user.", e);
        }
    }
}
