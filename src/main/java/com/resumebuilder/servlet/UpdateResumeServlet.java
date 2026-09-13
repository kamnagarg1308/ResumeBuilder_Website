package com.resumebuilder.servlet;

import java.io.IOException;

import com.resumebuilder.dao.ResumeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateResume")
public class UpdateResumeServlet extends HttpServlet {

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
            // RESUME ID
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
            // PERSONAL INFORMATION
            // =================================================

            String fullName =
                    request.getParameter("full_name");

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
                    request.getParameter("career_objective");


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
            // TEMPLATE
            // =================================================

            String templateId =
                    request.getParameter("template");


            if (templateId == null ||
                templateId.trim().isEmpty()) {

                templateId = "template1";

            } else {

                templateId = templateId.trim();

                // Accept both:
                // 1, 2, 3...
                // and
                // template1, template2...

                if (templateId.matches("[1-6]")) {

                    templateId =
                            "template" + templateId;

                }

                if (!templateId.matches("template[1-6]")) {

                    templateId = "template1";

                }
            }


            // =================================================
            // UPDATE DATABASE
            // =================================================

            ResumeDAO dao =
                    new ResumeDAO();


            boolean result =
                    dao.updateResume(

                            userId,
                            resumeId,

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
                        "<h2>Failed to Update Resume!</h2>"
                );
            }


        } catch (NumberFormatException e) {

            response.sendRedirect("myresumes");


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Error while updating resume</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}