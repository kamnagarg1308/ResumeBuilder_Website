package com.resumebuilder.servlet;

import java.io.IOException;

import com.resumebuilder.dao.ResumeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/saveResume")
public class SaveResumeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // =====================================================
        // CHECK LOGIN
        // =====================================================

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {

            // =================================================
            // USER ID
            // =================================================

            int userId =
                    ((Number) session.getAttribute("userId")).intValue();


            // =================================================
            // TEMPLATE
            // =================================================

            String templateId =
                    request.getParameter("template");

            if (templateId == null ||
                templateId.trim().isEmpty()) {

                templateId = "1";
            }

            templateId = templateId.trim();

            if (!templateId.matches("[1-6]")) {
                templateId = "1";
            }

            // Convert 1 → template1
            templateId = "template" + templateId;


            // =================================================
            // PERSONAL INFORMATION
            // =================================================

            String fullName =
                    request.getParameter("fullName");

            String email =
                    request.getParameter("email");

            String phone =
                    request.getParameter("phone");

            String address =
                    request.getParameter("address");


            // =================================================
            // CAREER OBJECTIVE
            // =================================================

            String careerObjective =
                    request.getParameter("careerObjective");


            // =================================================
            // BACHELOR
            // =================================================

            String bachelorDegree =
                    request.getParameter("bachelorDegree");

            String bachelorCollege =
                    request.getParameter("bachelorCollege");

            String bachelorYear =
                    request.getParameter("bachelorYear");

            String bachelorCgpa =
                    request.getParameter("bachelorCgpa");


            // =================================================
            // MASTER
            // =================================================

            String masterDegree =
                    request.getParameter("masterDegree");

            String masterCollege =
                    request.getParameter("masterCollege");

            String masterYear =
                    request.getParameter("masterYear");

            String masterCgpa =
                    request.getParameter("masterCgpa");


            // =================================================
            // INTERMEDIATE / 12TH
            // =================================================

            String intermediateSchool =
                    request.getParameter("intermediateSchool");

            String intermediateBoard =
                    request.getParameter("intermediateBoard");

            String intermediateYear =
                    request.getParameter("intermediateYear");

            String intermediatePercentage =
                    request.getParameter("intermediatePercentage");


            // =================================================
            // HIGH SCHOOL / 10TH
            // =================================================

            String highschoolSchool =
                    request.getParameter("highschoolSchool");

            String highschoolBoard =
                    request.getParameter("highschoolBoard");

            String highschoolYear =
                    request.getParameter("highschoolYear");

            String highschoolPercentage =
                    request.getParameter("highschoolPercentage");


            // =================================================
            // OTHER DETAILS
            // =================================================

            String experience =
                    request.getParameter("experience");

            String skills =
                    request.getParameter("skills");

            String projects =
                    request.getParameter("projects");

            String certifications =
                    request.getParameter("certifications");

            String languages =
                    request.getParameter("languages");

            String hobbies =
                    request.getParameter("hobbies");


            // =================================================
            // SAVE TO DATABASE
            // =================================================

            ResumeDAO dao =
                    new ResumeDAO();

            boolean result =
                    dao.saveResume(

                            userId,

                            // Personal
                            fullName,
                            email,
                            phone,
                            address,

                            // Career Objective
                            careerObjective,

                            // Bachelor
                            bachelorDegree,
                            bachelorCollege,
                            bachelorYear,
                            bachelorCgpa,

                            // Master
                            masterDegree,
                            masterCollege,
                            masterYear,
                            masterCgpa,

                            // Intermediate
                            intermediateSchool,
                            intermediateBoard,
                            intermediateYear,
                            intermediatePercentage,

                            // High School
                            highschoolSchool,
                            highschoolBoard,
                            highschoolYear,
                            highschoolPercentage,

                            // Other
                            experience,
                            skills,
                            projects,
                            certifications,
                            languages,
                            hobbies,

                            // Template
                            templateId
                    );


            // =================================================
            // RESULT
            // =================================================

            if (result) {

                response.sendRedirect("myresumes");

            } else {

                response.setContentType("text/html");

                response.getWriter().println(
                        "<h2>Failed to Save Resume!</h2>"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Error while saving resume</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}