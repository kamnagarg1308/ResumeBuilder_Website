<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Edit Resume | ResumeCraft</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f7fb;
            color: #1f2937;
            padding: 35px 0 60px;
        }

        .container {
            width: 900px;
            max-width: 94%;
            margin: auto;
        }

        /* TOP BAR */

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .brand {
            font-size: 23px;
            font-weight: 700;
            color: #111827;
            text-decoration: none;
        }

        .brand span {
            color: #6366f1;
        }

        .nav-links {
            display: flex;
            gap: 10px;
        }

        .nav-btn {
            text-decoration: none;
            color: #475569;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            padding: 9px 14px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .nav-btn:hover {
            border-color: #6366f1;
            color: #4f46e5;
        }

        /* PAGE HEADER */

        .page-header {
            background: #111827;
            color: white;
            border-radius: 14px;
            padding: 32px 36px;
            margin-bottom: 20px;
            box-shadow: 0 10px 28px rgba(15, 23, 42, 0.10);
        }

        .page-header h1 {
            margin: 0 0 8px;
            font-size: 30px;
            letter-spacing: -0.5px;
        }

        .page-header p {
            margin: 0;
            color: #cbd5e1;
            font-size: 14px;
            line-height: 1.6;
        }

        .resume-id {
            display: inline-block;
            margin-top: 18px;
            padding: 8px 12px;
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 7px;
            color: #a5b4fc;
            font-size: 11px;
            font-weight: 600;
        }

        /* SECTIONS */

        .section {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 18px;
            box-shadow: 0 3px 12px rgba(15, 23, 42, 0.035);
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 11px;
            margin-bottom: 20px;
        }

        .section-number {
            width: 29px;
            height: 29px;
            border-radius: 7px;
            background: #eef2ff;
            color: #4f46e5;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
        }

        .section h2 {
            margin: 0;
            color: #111827;
            font-size: 18px;
            font-weight: 700;
        }

        .section-description {
            margin: -10px 0 18px 40px;
            color: #64748b;
            font-size: 12px;
            line-height: 1.5;
        }

        /* FORM */

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .form-group {
            min-width: 0;
        }

        label {
            display: block;
            margin: 14px 0 7px;
            color: #374151;
            font-size: 13px;
            font-weight: 600;
        }

        .form-group label {
            margin-top: 0;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            background: #ffffff;
            color: #111827;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            outline: none;
            transition: 0.2s ease;
        }

        input {
            height: 44px;
        }

        input:focus,
        textarea:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.10);
        }

        textarea {
            min-height: 105px;
            resize: vertical;
            line-height: 1.5;
        }

        /* EDUCATION */

        .education-box {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 9px;
            padding: 19px;
            margin-top: 14px;
        }

        .education-box:first-of-type {
            margin-top: 0;
        }

        .education-box h3 {
            margin: 0 0 14px;
            color: #334155;
            font-size: 15px;
            font-weight: 700;
        }

        /* UPDATE AREA */

        .update-area {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 22px;
            margin-top: 5px;
            box-shadow: 0 3px 12px rgba(15, 23, 42, 0.035);
        }

        .update-btn {
            width: 100%;
            padding: 14px;
            background: #4f46e5;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .update-btn:hover {
            background: #4338ca;
            transform: translateY(-1px);
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #64748b;
            text-decoration: none;
            font-size: 13px;
        }

        .back:hover {
            color: #4f46e5;
        }

        /* ERROR */

        .not-found {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 45px;
            text-align: center;
        }

        .not-found h2 {
            margin: 0 0 8px;
            color: #111827;
        }

        .not-found p {
            color: #64748b;
            font-size: 14px;
        }

        /* MOBILE */

        @media (max-width: 700px) {

            body {
                padding: 20px 0 40px;
            }

            .top-bar {
                align-items: flex-start;
                gap: 12px;
            }

            .nav-links {
                flex-direction: column;
            }

            .page-header {
                padding: 25px 22px;
            }

            .page-header h1 {
                font-size: 25px;
            }

            .section {
                padding: 19px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .section-description {
                margin-left: 0;
            }

        }

    </style>

</head>


<body>

<div class="container">

    <!-- TOP BAR -->

    <div class="top-bar">

        <a href="home.jsp" class="brand">
            Resume<span>Craft</span>
        </a>

        <div class="nav-links">

            <a href="myresumes" class="nav-btn">
                My Resumes
            </a>

            <a href="home.jsp" class="nav-btn">
                Dashboard
            </a>

        </div>

    </div>


<%

    ResultSet rs = (ResultSet) request.getAttribute("resume");

    if (rs != null) {

%>


    <!-- PAGE HEADER -->

    <div class="page-header">

        <h1>Edit Your Resume</h1>

        <p>
            Update your information below and save your changes.
        </p>

        <div class="resume-id">
            Resume ID: <%= rs.getInt("resume_id") %>
        </div>

    </div>


    <!-- FORM -->

    <form action="updateResume" method="post">

        <input
            type="hidden"
            name="resumeId"
            value="<%= rs.getInt("resume_id") %>"
        >


        <!-- ================= PERSONAL INFORMATION ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    01
                </div>

                <h2>Personal Information</h2>

            </div>

            <p class="section-description">
                Update your basic contact details.
            </p>


            <label>
                Full Name
            </label>

            <input
                type="text"
                name="full_name"
                value="<%= rs.getString("full_name") %>"
                required
            >


            <label>
                Email
            </label>

            <input
                type="email"
                name="email"
                value="<%= rs.getString("email") %>"
                required
            >


            <div class="form-row">

                <div class="form-group">

                    <label>
                        Phone
                    </label>

                    <input
                        type="text"
                        name="phone"
                        value="<%= rs.getString("phone") %>"
                    >

                </div>


                <div class="form-group">

                    <label>
                        Address
                    </label>

                    <input
                        type="text"
                        name="address"
                        value="<%= rs.getString("address") %>"
                    >

                </div>

            </div>

        </div>


        <!-- ================= CAREER OBJECTIVE ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    02
                </div>

                <h2>Career Objective</h2>

            </div>

            <p class="section-description">
                Update your professional objective or summary.
            </p>


            <textarea name="career_objective"><%= rs.getString("career_objective") %></textarea>

        </div>


        <!-- ================= EDUCATION ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    03
                </div>

                <h2>Education</h2>

            </div>

            <p class="section-description">
                Update your academic qualifications and results.
            </p>


            <!-- BACHELOR -->

            <div class="education-box">

                <h3>Bachelor's / Graduation</h3>

                <label>
                    Degree
                </label>

                <input
                    type="text"
                    name="bachelorDegree"
                    value="<%= rs.getString("bachelor_degree") %>"
                >


                <label>
                    College / University
                </label>

                <input
                    type="text"
                    name="bachelorCollege"
                    value="<%= rs.getString("bachelor_college") %>"
                >


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Year
                        </label>

                        <input
                            type="text"
                            name="bachelorYear"
                            value="<%= rs.getString("bachelor_year") %>"
                        >

                    </div>


                    <div class="form-group">

                        <label>
                            CGPA
                        </label>

                        <input
                            type="text"
                            name="bachelorCgpa"
                            value="<%= rs.getString("bachelor_cgpa") %>"
                        >

                    </div>

                </div>

            </div>


            <!-- MASTER -->

            <div class="education-box">

                <h3>Master's / Post-Graduation (Optional)</h3>

                <label>
                    Degree
                </label>

                <input
                    type="text"
                    name="masterDegree"
                    value="<%= rs.getString("master_degree") %>"
                >


                <label>
                    College / University
                </label>

                <input
                    type="text"
                    name="masterCollege"
                    value="<%= rs.getString("master_college") %>"
                >


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Year
                        </label>

                        <input
                            type="text"
                            name="masterYear"
                            value="<%= rs.getString("master_year") %>"
                        >

                    </div>


                    <div class="form-group">

                        <label>
                            CGPA
                        </label>

                        <input
                            type="text"
                            name="masterCgpa"
                            value="<%= rs.getString("master_cgpa") %>"
                        >

                    </div>

                </div>

            </div>


            <!-- INTERMEDIATE -->

            <div class="education-box">

                <h3>Intermediate / 12th</h3>

                <label>
                    School
                </label>

                <input
                    type="text"
                    name="intermediateSchool"
                    value="<%= rs.getString("intermediate_school") %>"
                >


                <label>
                    Board
                </label>

                <input
                    type="text"
                    name="intermediateBoard"
                    value="<%= rs.getString("intermediate_board") %>"
                >


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Year
                        </label>

                        <input
                            type="text"
                            name="intermediateYear"
                            value="<%= rs.getString("intermediate_year") %>"
                        >

                    </div>


                    <div class="form-group">

                        <label>
                            Percentage
                        </label>

                        <input
                            type="text"
                            name="intermediatePercentage"
                            value="<%= rs.getString("intermediate_percentage") %>"
                        >

                    </div>

                </div>

            </div>


            <!-- HIGH SCHOOL -->

            <div class="education-box">

                <h3>High School / 10th</h3>

                <label>
                    School
                </label>

                <input
                    type="text"
                    name="highschoolSchool"
                    value="<%= rs.getString("highschool_school") %>"
                >


                <label>
                    Board
                </label>

                <input
                    type="text"
                    name="highschoolBoard"
                    value="<%= rs.getString("highschool_board") %>"
                >


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Year
                        </label>

                        <input
                            type="text"
                            name="highschoolYear"
                            value="<%= rs.getString("highschool_year") %>"
                        >

                    </div>


                    <div class="form-group">

                        <label>
                            Percentage
                        </label>

                        <input
                            type="text"
                            name="highschoolPercentage"
                            value="<%= rs.getString("highschool_percentage") %>"
                        >

                    </div>

                </div>

            </div>

        </div>


        <!-- ================= EXPERIENCE ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    04
                </div>

                <h2>Experience</h2>

            </div>

            <p class="section-description">
                Update your work experience, internship or training details.
            </p>


            <textarea name="experience"><%= rs.getString("experience") %></textarea>

        </div>


        <!-- ================= SKILLS ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    05
                </div>

                <h2>Skills</h2>

            </div>

            <p class="section-description">
                Update your technical, professional or soft skills.
            </p>


            <textarea name="skills"><%= rs.getString("skills") %></textarea>

        </div>


        <!-- ================= PROJECTS ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    06
                </div>

                <h2>Projects</h2>

            </div>

            <p class="section-description">
                Update your academic, personal or professional projects.
            </p>


            <textarea name="projects"><%= rs.getString("projects") %></textarea>

        </div>


        <!-- ================= CERTIFICATIONS ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    07
                </div>

                <h2>Certifications</h2>

            </div>

            <p class="section-description">
                Update your certifications and professional courses.
            </p>


            <textarea name="certifications"><%= rs.getString("certifications") %></textarea>

        </div>


        <!-- ================= LANGUAGES ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    08
                </div>

                <h2>Languages</h2>

            </div>

            <p class="section-description">
                Update the languages you can communicate in.
            </p>


            <input
                type="text"
                name="languages"
                value="<%= rs.getString("languages") %>"
            >

        </div>


        <!-- ================= HOBBIES ================= -->

        <div class="section">

            <div class="section-header">

                <div class="section-number">
                    09
                </div>

                <h2>Hobbies</h2>

            </div>

            <p class="section-description">
                Update your personal interests and hobbies.
            </p>


            <input
                type="text"
                name="hobbies"
                value="<%= rs.getString("hobbies") %>"
            >

        </div>


        <!-- ================= UPDATE ================= -->

        <div class="update-area">

            <button type="submit" class="update-btn">
                Update Resume
            </button>

            <a href="myresumes" class="back">
                Back to My Resumes
            </a>

        </div>

    </form>


<%

    } else {

%>


    <div class="not-found">

        <h2>Resume Not Found</h2>

        <p>
            The requested resume could not be loaded.
        </p>

        <a href="myresumes" class="back">
            Back to My Resumes
        </a>

    </div>


<%

    }

%>

</div>

</body>

</html>