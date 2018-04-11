package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user=null;

//        String priceTest = request.getParameter("price");

        if(session != null){
            user = (User) session.getAttribute("user");
        }

        if(user != null){
            Ad ad = new Ad(
                    user.getId(), // for now we'll hardcode the user id
                    request.getParameter("title"),
                    request.getParameter("description"),
                    request.getParameter("price"),
                    request.getParameter("category")

            );
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/ads");
        }
    }
}
