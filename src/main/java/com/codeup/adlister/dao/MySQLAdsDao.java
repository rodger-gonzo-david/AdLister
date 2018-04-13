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
//            stmt = connection.prepareStatement("SELECT * FROM ads");
            stmt = connection.prepareStatement("SELECT * FROM ads JOIN pivot_media on ads.id = pivot_media.ad_id join media on pivot_media.media_id = media.id order by ad_id");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getString("location")
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
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, price) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setDouble(4, Double.parseDouble(ad.getPrice()));
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            System.out.println("rs.getLong(1) = " + rs.getLong(1));
            System.out.println("rs.getString(1) = " + rs.getString(1));
            insertCat(rs.getInt(1));
            insertMedia(ad.getLocation(),rs.getInt(1));
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private void insertCat (int rs) {
        try {
            String insertQuery = "INSERT INTO pivot_categories (ads_id, categories_id) VALUES (?,?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1,rs);
            stmt.setInt(2,1);
            stmt.executeUpdate();
        } catch (SQLException e){
            throw new RuntimeException("Error adding category", e);
        }
    }

    private void insertMedia (String location, int rs) {
        try{
            String insertQuery = "INSERT INTO media (location) VALUES (?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1,location);
            stmt.executeUpdate();
            ResultSet resultSet = stmt.getGeneratedKeys();
            resultSet.next();
            int media_id = resultSet.getInt(1);
            insertQuery = "INSERT INTO pivot_media(media_id, ad_id) VALUES (?,?)";
            stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1,media_id);
            stmt.setInt(2,rs);
            stmt.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException("Error adding file location", e);
        }
    }


    public List<Ad> profileAds(String s) {
        PreparedStatement stmt;
        try {
//            stmt = connection.prepareStatement("SELECT * FROM ads JOIN users ON ads.user_id = users.id WHERE username = ?");
            stmt = connection.prepareStatement("SELECT * FROM ads JOIN users ON ads.user_id = users.id JOIN pivot_media on ads.id = pivot_media.ad_id join media on pivot_media.media_id = media.id WHERE username = ?");
            stmt.setString(1, s);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all user ads.", e);
        }
    }



    @Override
    public List<Ad> searchedAds(String searchInput) {
        System.out.println("searchInput = " + searchInput);
        PreparedStatement pst = null;
        try {
            pst = connection.prepareStatement("SELECT * FROM ads WHERE title LIKE ?");
            pst.setString(1,"%" + searchInput + "%");
            ResultSet rs = pst.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving matching ads.", e);
        }
    }


    @Override
    public List<Ad> individualAd(String adID) {
        System.out.println("adID = " + adID);
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
 }
