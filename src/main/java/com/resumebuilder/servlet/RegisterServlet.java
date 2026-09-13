package com.resumebuilder.servlet;

import java.io.IOException;

import com.resumebuilder.dao.UserDAO;
import com.resumebuilder.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(name, email, password);

        UserDAO dao = new UserDAO();

        boolean result = dao.registerUser(user);

        if (result) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("register.jsp");
        }
    }
}