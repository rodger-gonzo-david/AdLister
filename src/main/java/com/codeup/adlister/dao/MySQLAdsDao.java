package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, price) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setDouble(4, Double.parseDouble(ad.getPrice()));
            stmt.executeUpdate();
            Long holder = Long.parseLong(ad.getCategory());
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            insertCat(rs.getInt(1),holder);
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private void insertCat (int rs, Long cat) {
        try {
            String insertQuery = "INSERT INTO pivot_categories (ads_id, categories_id) VALUES (?,?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1,rs);
            stmt.setLong(2, cat);
            stmt.executeUpdate();
            ResultSet pr = stmt.getGeneratedKeys();
            pr.next();
        } catch (SQLException e){
            throw new RuntimeException("Error adding category", e);
        }
    }


    public List<Ad> profileAds(String s) {
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads JOIN users ON ads.user_id = users.id WHERE username = ?");
            stmt.setString(1, s);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all user ads.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    @Override
    public List<Ad> searchedAds(String searchInput, String searchCat) {
        System.out.println("searchInput = " + searchInput);
        System.out.println("searchCat = " + searchCat);
        PreparedStatement pst = null;
        try {
            pst = connection.prepareStatement("SELECT ads.* FROM ads\n" +
                    "  JOIN pivot_categories pc ON ads.id = pc.ads_id\n" +
                    "  JOIN categories c ON pc.categories_id = c.id\n" +
                    "WHERE ads.title LIKE  ?  AND c.category_name = ?");
            pst.setString(1,"%" + searchInput + "%");

            pst.setString(2, searchCat);
            ResultSet rs = pst.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving matching ads.", e);
        }
    }




    @Override
    public List<Ad> individualAd(String adID) {
        PreparedStatement pst = null;
        try {
            pst = connection.prepareStatement("SELECT * FROM ads WHERE id = ?");
            pst.setString(1, adID);
            ResultSet rs = pst.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving specific add", e);
        }
    }

    @Override
    public void titleChange(String title, String adId) {
        String query = "UPDATE ads SET title = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, title);
            stmt.setInt(2, Integer.parseInt(adId));
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error changing title.", e);
        }
    }


    @Override
    public void descriptionChange(String description, String adId) {
        String query = "UPDATE ads SET description = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, description);
            stmt.setInt(2, Integer.parseInt(adId));
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error changing email.", e);
        }
    }

    @Override
    public void deleteAd(String adId) {
        String query = "DELETE FROM ads WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, adId);
            System.out.println(stmt);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
            System.out.println("SQLState: " + e.getSQLState());
            System.out.println("VendorError: " + e.getErrorCode());
            throw new RuntimeException("Error deleting ad");
        }
    }
}
