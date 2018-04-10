package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.net.ssl.HandshakeCompletedEvent;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String  username = request.getParameter("username"),
                email = request.getParameter("email"),
                password = request.getParameter("password"),
                password_confirm = request.getParameter("password_confirm");

        User userInput = DaoFactory.getUsersDao().findByUsername(username);
        User userEmail = DaoFactory.getUsersDao().findByEmail(email);
        HttpSession session = request.getSession();
        String userExist = String.format("<p style=\"color:red\">Sorry username '%s' already exists.</p", username);
        String emailExist = String.format("<p style=\"color:red\">Sorry email '%s' already exists.</p", email);

        if (password == null || password.trim() == ""){
            clearAttributes(request);
            session.setAttribute("password_error",  "<p style=\"color:red\">Sorry \"password\" error!</p>");
            response.sendRedirect("/register");
        } else if(!password.equals(password_confirm)){
            clearAttributes(request);
            session.setAttribute("password_mismatch",  "<p style=\"color:red\">Sorry \"passwords\" do not match!</p>");
            response.sendRedirect("/register");
        } else if (email == null || email.trim() == ""){
            clearAttributes(request);
            session.setAttribute("email_error",  "<p style=\"color:red\">Sorry \"email\" error!</p>");
            response.sendRedirect("/register");
        }
        else if (username == null || username.trim() == ""){
            clearAttributes(request);
            session.setAttribute("username_error",  "<p style=\"color:red\">Sorry \"username\" error!</p>");
            response.sendRedirect("/register");
        } else if (username.equals(userInput.getUsername())){
            clearAttributes(request);
            session.setAttribute("userExist_error", userExist);
            response.sendRedirect("/register");
        } else if (email.equals(userEmail.getEmail())){
            response.sendRedirect("/register");
            clearAttributes(request);
            session.setAttribute("emailExist_error", emailExist);
        } else if (userEmail.getEmail() == null){
        }
        else {
            clearAttributes(request);
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            session.setAttribute("email", email);
            User user = new User(
                    1,
                    request.getParameter("username"),
                    request.getParameter("email"),
                    request.getParameter("password")
            );
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/profile");
        }

    }

    public void clearAttributes(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("password_error");
        session.removeAttribute("email_error");
        session.removeAttribute("username_error");
        session.removeAttribute("password_mismatch");
        session.removeAttribute("userexist_error");
    }

}
