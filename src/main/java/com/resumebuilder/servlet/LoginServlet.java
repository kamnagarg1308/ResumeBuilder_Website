package com.resumebuilder.servlet;

import java.io.IOException;

import com.resumebuilder.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        int userId = dao.getUserId(email, password);

        if (userId != -1) {

            request.getSession().setAttribute("userId", userId);

            response.sendRedirect("home.jsp");

        } else {

            response.getWriter().println("Invalid Email or Password!");
        }
    }
}