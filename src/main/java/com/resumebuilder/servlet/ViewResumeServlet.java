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

@WebServlet("/viewResume")
public class ViewResumeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // =====================================================
        // CHECK LOGIN
        // =====================================================

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        try {

            // =================================================
            // GET LOGGED-IN USER
            // =================================================

            int userId =
                    ((Number) session.getAttribute("userId")).intValue();


            // =================================================
            // GET RESUME ID
            // =================================================

            String resumeIdParam =
                    request.getParameter("resumeId");

            if (resumeIdParam == null ||
                resumeIdParam.trim().isEmpty()) {

                response.sendRedirect("myresumes");
                return;
            }

            int resumeId =
                    Integer.parseInt(resumeIdParam);


            // =================================================
            // GET RESUME FROM DATABASE
            // =================================================

            ResumeDAO dao =
                    new ResumeDAO();

            ResultSet rs =
                    dao.getResumeById(userId, resumeId);


            // =================================================
            // CHECK RESULT
            // =================================================

            if (rs != null && rs.next()) {

                // =============================================
                // GET SELECTED TEMPLATE
                // =============================================

                String templateId =
                        rs.getString("template_id");


                // =============================================
                // DEFAULT TEMPLATE
                // =============================================

                if (templateId == null ||
                    templateId.trim().isEmpty()) {

                    templateId = "template1";
                }


                // =============================================
                // VALIDATE TEMPLATE
                // =============================================

                if (!templateId.matches("template[1-6]")) {

                    templateId = "template1";
                }


                // =============================================
                // SEND DATA TO JSP
                // =============================================

                request.setAttribute(
                        "resume",
                        rs
                );

                request.setAttribute(
                        "templateId",
                        templateId
                );


                // =============================================
                // FORWARD TO VIEW RESUME PAGE
                // =============================================

                request.getRequestDispatcher(
                        "viewresume.jsp"
                ).forward(
                        request,
                        response
                );

                return;
            }

        } catch (NumberFormatException e) {

            // Invalid resume ID
            response.sendRedirect("myresumes");
            return;

        } catch (Exception e) {

            e.printStackTrace();
        }


        // =====================================================
        // RESUME NOT FOUND
        // =====================================================

        response.sendRedirect("myresumes");
    }
}