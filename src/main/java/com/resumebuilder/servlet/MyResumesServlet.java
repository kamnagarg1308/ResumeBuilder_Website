package com.resumebuilder.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import com.resumebuilder.dao.ResumeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myresumes")
public class MyResumesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int userId = ((Number) session.getAttribute("userId")).intValue();

            ResumeDAO dao = new ResumeDAO();

            ResultSet rs = dao.getResumesByUserId(userId);

            if (rs != null) {
                request.setAttribute("resumes", rs);
            } else {
                request.setAttribute("error",
                        "Unable to load resumes.");
            }

            request.getRequestDispatcher("myresumes.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error",
                    "Unable to load resumes.");

            request.getRequestDispatcher("myresumes.jsp")
                   .forward(request, response);
        }
    }
}