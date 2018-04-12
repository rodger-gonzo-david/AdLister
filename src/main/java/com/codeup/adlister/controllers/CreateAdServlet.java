package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Validate;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user=null;
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        Validate validate = new Validate();
        boolean validAttempt = validate.authenticate(title,description,price,request);

        if(session != null){
            user = (User) session.getAttribute("user");
        }

        if(user != null){
            if (validAttempt) {
                Ad ad = new Ad(user.getId(),
                        request.getParameter("title"), request.getParameter("description"), request.getParameter("price")
                );
                DaoFactory.getAdsDao().insert(ad);
                response.sendRedirect("/profile");
            } else {
                // setting this attributes in case the makes a mistake.  User won't loose his input.
                session.setAttribute("title", title);
                session.setAttribute("description", description);
                session.setAttribute("price", price);
                response.sendRedirect("/ads/create");
            }
        }
    }

}

