package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = "/ads/search")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Is this working POST");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Is this working GET");

//        if (request.getMethod().equalsIgnoreCase("get")) {
            String entry = request.getParameter("searchInput");
        System.out.println("entry = " + entry);
            List<Ad> ads = DaoFactory.getAdsDao().searchedAds(entry);
        for (Ad ad: ads
             ) {
            System.out.println("ad.getTitle() = " + ad.getTitle());
            
        }
            request.setAttribute("search", ads);
            request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
//        }
    }
}
