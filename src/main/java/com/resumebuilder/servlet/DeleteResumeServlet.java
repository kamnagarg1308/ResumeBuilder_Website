package com.resumebuilder.servlet;

import java.io.IOException;

import com.resumebuilder.dao.ResumeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteResume")
public class DeleteResumeServlet extends HttpServlet {

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

            String resumeIdParam = request.getParameter("resumeId");

            if (resumeIdParam == null || resumeIdParam.isEmpty()) {
                response.sendRedirect("myresumes");
                return;
            }

            int resumeId = Integer.parseInt(resumeIdParam);

            ResumeDAO dao = new ResumeDAO();

            // Correct order: userId, resumeId
            boolean result = dao.deleteResume(userId, resumeId);

            if (result) {
                System.out.println("Resume Deleted Successfully!");
            } else {
                System.out.println("Resume Not Found!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("myresumes");
    }
}