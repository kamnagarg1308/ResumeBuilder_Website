package com.resumebuilder.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.resumebuilder.util.DBConnection;

public class ResumeDAO {

    // =========================================================
    // SAVE RESUME
    // =========================================================

    public boolean saveResume(
            int userId,
            String fullName,
            String email,
            String phone,
            String address,
            String careerObjective,

            String bachelorDegree,
            String bachelorCollege,
            String bachelorYear,
            String bachelorCgpa,

            String masterDegree,
            String masterCollege,
            String masterYear,
            String masterCgpa,

            String intermediateSchool,
            String intermediateBoard,
            String intermediateYear,
            String intermediatePercentage,

            String highschoolSchool,
            String highschoolBoard,
            String highschoolYear,
            String highschoolPercentage,

            String experience,
            String skills,
            String projects,
            String certifications,
            String languages,
            String hobbies,

            String templateId) {

        String sql =
                "INSERT INTO resumes (" +
                "user_id, " +
                "full_name, " +
                "email, " +
                "phone, " +
                "address, " +
                "career_objective, " +
                "education, " +
                "bachelor_degree, " +
                "bachelor_college, " +
                "bachelor_year, " +
                "bachelor_cgpa, " +
                "master_degree, " +
                "master_college, " +
                "master_year, " +
                "master_cgpa, " +
                "intermediate_school, " +
                "intermediate_board, " +
                "intermediate_year, " +
                "intermediate_percentage, " +
                "highschool_school, " +
                "highschool_board, " +
                "highschool_year, " +
                "highschool_percentage, " +
                "experience, " +
                "skills, " +
                "projects, " +
                "certifications, " +
                "languages, " +
                "hobbies, " +
                "template_id" +
                ") VALUES (" +
                "?, ?, ?, ?, ?, ?, ?, " +
                "?, ?, ?, ?, " +
                "?, ?, ?, ?, " +
                "?, ?, ?, ?, " +
                "?, ?, ?, ?, " +
                "?, ?, ?, ?, ?, ?, ?" +
                ")";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            int i = 1;

            // Personal Information
            ps.setInt(i++, userId);
            ps.setString(i++, fullName);
            ps.setString(i++, email);
            ps.setString(i++, phone);
            ps.setString(i++, address);
            ps.setString(i++, careerObjective);

            // Old education column
            ps.setString(i++, "");

            // Bachelor
            ps.setString(i++, bachelorDegree);
            ps.setString(i++, bachelorCollege);
            ps.setString(i++, bachelorYear);
            ps.setString(i++, bachelorCgpa);

            // Master
            ps.setString(i++, masterDegree);
            ps.setString(i++, masterCollege);
            ps.setString(i++, masterYear);
            ps.setString(i++, masterCgpa);

            // Intermediate
            ps.setString(i++, intermediateSchool);
            ps.setString(i++, intermediateBoard);
            ps.setString(i++, intermediateYear);
            ps.setString(i++, intermediatePercentage);

            // High School
            ps.setString(i++, highschoolSchool);
            ps.setString(i++, highschoolBoard);
            ps.setString(i++, highschoolYear);
            ps.setString(i++, highschoolPercentage);

            // Other Details
            ps.setString(i++, experience);
            ps.setString(i++, skills);
            ps.setString(i++, projects);
            ps.setString(i++, certifications);
            ps.setString(i++, languages);
            ps.setString(i++, hobbies);

            // Template
            ps.setString(i++, templateId);

            int result = ps.executeUpdate();

            if (result > 0) {
                System.out.println("Resume Saved Successfully!");
                System.out.println("Selected Template: " + templateId);
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================================================
    // GET ALL RESUMES OF USER
    // =========================================================

    public ResultSet getResumesByUserId(int userId) {

        String sql =
                "SELECT * FROM resumes " +
                "WHERE user_id = ? " +
                "ORDER BY resume_id DESC";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // GET ONE RESUME
    // =========================================================

    public ResultSet getResumeById(int userId, int resumeId) {

        String sql =
                "SELECT * FROM resumes " +
                "WHERE user_id = ? " +
                "AND resume_id = ?";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, resumeId);

            return ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // DELETE RESUME
    // =========================================================

    public boolean deleteResume(int userId, int resumeId) {

        String sql =
                "DELETE FROM resumes " +
                "WHERE user_id = ? " +
                "AND resume_id = ?";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, resumeId);

            int result = ps.executeUpdate();

            if (result > 0) {
                System.out.println("Resume Deleted Successfully!");
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================================================
    // UPDATE RESUME
    // =========================================================

    public boolean updateResume(
            int userId,
            int resumeId,

            String fullName,
            String email,
            String phone,
            String address,
            String careerObjective,

            String bachelorDegree,
            String bachelorCollege,
            String bachelorYear,
            String bachelorCgpa,

            String masterDegree,
            String masterCollege,
            String masterYear,
            String masterCgpa,

            String intermediateSchool,
            String intermediateBoard,
            String intermediateYear,
            String intermediatePercentage,

            String highschoolSchool,
            String highschoolBoard,
            String highschoolYear,
            String highschoolPercentage,

            String experience,
            String skills,
            String projects,
            String certifications,
            String languages,
            String hobbies,

            String templateId) {

        String sql =
                "UPDATE resumes SET " +
                "full_name = ?, " +
                "email = ?, " +
                "phone = ?, " +
                "address = ?, " +
                "career_objective = ?, " +

                "bachelor_degree = ?, " +
                "bachelor_college = ?, " +
                "bachelor_year = ?, " +
                "bachelor_cgpa = ?, " +

                "master_degree = ?, " +
                "master_college = ?, " +
                "master_year = ?, " +
                "master_cgpa = ?, " +

                "intermediate_school = ?, " +
                "intermediate_board = ?, " +
                "intermediate_year = ?, " +
                "intermediate_percentage = ?, " +

                "highschool_school = ?, " +
                "highschool_board = ?, " +
                "highschool_year = ?, " +
                "highschool_percentage = ?, " +

                "experience = ?, " +
                "skills = ?, " +
                "projects = ?, " +
                "certifications = ?, " +
                "languages = ?, " +
                "hobbies = ?, " +

                "template_id = ? " +

                "WHERE resume_id = ? " +
                "AND user_id = ?";

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            int i = 1;

            // Personal Information
            ps.setString(i++, fullName);
            ps.setString(i++, email);
            ps.setString(i++, phone);
            ps.setString(i++, address);
            ps.setString(i++, careerObjective);

            // Bachelor
            ps.setString(i++, bachelorDegree);
            ps.setString(i++, bachelorCollege);
            ps.setString(i++, bachelorYear);
            ps.setString(i++, bachelorCgpa);

            // Master
            ps.setString(i++, masterDegree);
            ps.setString(i++, masterCollege);
            ps.setString(i++, masterYear);
            ps.setString(i++, masterCgpa);

            // Intermediate
            ps.setString(i++, intermediateSchool);
            ps.setString(i++, intermediateBoard);
            ps.setString(i++, intermediateYear);
            ps.setString(i++, intermediatePercentage);

            // High School
            ps.setString(i++, highschoolSchool);
            ps.setString(i++, highschoolBoard);
            ps.setString(i++, highschoolYear);
            ps.setString(i++, highschoolPercentage);

            // Other Details
            ps.setString(i++, experience);
            ps.setString(i++, skills);
            ps.setString(i++, projects);
            ps.setString(i++, certifications);
            ps.setString(i++, languages);
            ps.setString(i++, hobbies);

            // Template
            ps.setString(i++, templateId);

            // WHERE
            ps.setInt(i++, resumeId);
            ps.setInt(i++, userId);

            int result = ps.executeUpdate();

            if (result > 0) {
                System.out.println("Resume Updated Successfully!");
                System.out.println("Selected Template: " + templateId);
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}