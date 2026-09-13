<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Create Resume | ResumeCraft</title>

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

        /* TOP NAVIGATION */

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

        .selected-template {
            margin-top: 22px;
            display: inline-block;
            padding: 9px 13px;
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 7px;
            color: #a5b4fc;
            font-size: 12px;
            font-weight: 600;
        }

        /* FORM */

        form {
            margin: 0;
        }

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

        /* FORM FIELDS */

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

        input::placeholder,
        textarea::placeholder {
            color: #9ca3af;
        }

        textarea {
            min-height: 105px;
            resize: vertical;
            line-height: 1.5;
        }

        .required {
            color: #dc2626;
        }

        .hint {
            margin-top: 7px;
            color: #94a3b8;
            font-size: 11px;
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

        /* SAVE */

        .save-area {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 22px;
            margin-top: 5px;
            box-shadow: 0 3px 12px rgba(15, 23, 42, 0.035);
        }

        .save-btn {
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

        .save-btn:hover {
            background: #4338ca;
            transform: translateY(-1px);
        }

        .cancel-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #64748b;
            text-decoration: none;
            font-size: 13px;
        }

        .cancel-link:hover {
            color: #4f46e5;
        }

        /* MOBILE */

        @media (max-width: 700px) {

            body {
                padding: 20px 0 40px;
            }

            .container {
                max-width: 94%;
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

            .education-box {
                padding: 16px;
            }
        }

    </style>

</head>

<body>

<%
    String selectedTemplate = request.getParameter("template");

    if (selectedTemplate == null || selectedTemplate.trim().isEmpty()) {
        selectedTemplate = "1";
    }

    if (!selectedTemplate.matches("[1-6]")) {
        selectedTemplate = "1";
    }

    String templateName = "Nova";

    switch (selectedTemplate) {

        case "2":
            templateName = "Slate";
            break;

        case "3":
            templateName = "Orbit";
            break;

        case "4":
            templateName = "Axis";
            break;

        case "5":
            templateName = "Aura";
            break;

        case "6":
            templateName = "Vertex";
            break;

        default:
            templateName = "Nova";
            break;
    }
%>


<div class="container">

    <!-- TOP BAR -->

    <div class="top-bar">

        <a href="home.jsp" class="brand">
            Resume<span>Craft</span>
        </a>

        <div class="nav-links">

            <a href="home.jsp" class="nav-btn">
                Dashboard
            </a>

            <a href="myresumes" class="nav-btn">
                My Resumes
            </a>

        </div>

    </div>


    <!-- PAGE HEADER -->

    <div class="page-header">

        <h1>Create Your Resume</h1>

        <p>
            Add your professional information below.
            You can edit your resume later from My Resumes.
        </p>

        <div class="selected-template">
            Selected Template:
            Template <%= selectedTemplate %> - <%= templateName %>
        </div>

    </div>


    <!-- FORM -->

    <form action="saveResume" method="post">

        <!-- SELECTED TEMPLATE -->

        <input
            type="hidden"
            name="template"
            value="<%= selectedTemplate %>"
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
                Add the basic contact details that will appear on your resume.
            </p>


            <label>
                Full Name
                <span class="required">*</span>
            </label>

            <input
                type="text"
                name="fullName"
                placeholder="Enter your full name"
                required
            >


            <label>
                Email
                <span class="required">*</span>
            </label>

            <input
                type="email"
                name="email"
                placeholder="Enter your email"
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
                        placeholder="Enter your phone number"
                    >

                </div>


                <div class="form-group">

                    <label>
                        Address
                    </label>

                    <input
                        type="text"
                        name="address"
                        placeholder="City, State"
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
                Briefly describe your professional goal and what you aim to contribute.
            </p>


            <textarea
                name="careerObjective"
                placeholder="Write a short professional career objective"
            ></textarea>

            <div class="hint">
                Example: Motivated IT student seeking opportunities to apply
                technical and problem-solving skills in a professional environment.
            </div>

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
                Add your academic qualifications, from graduation to school level.
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
                    placeholder="Example: B.Tech in Information Technology"
                >


                <label>
                    College / University
                </label>

                <input
                    type="text"
                    name="bachelorCollege"
                    placeholder="Example: ABC University"
                >


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Year
                        </label>

                        <input
                            type="text"
                            name="bachelorYear"
                            placeholder="Example: 2026"
                        >

                    </div>


                    <div class="form-group">

                        <label>
                            CGPA
                        </label>

                        <input
                            type="text"
                            name="bachelorCgpa"
                            placeholder="Example: 8.5"
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
                    placeholder="Example: M.Tech / MCA"
                >


                <label>
                    College / University
                </label>

                <input
                    type="text"
                    name="masterCollege"
                    placeholder="Example: ABC University"
                >


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Year
                        </label>

                        <input
                            type="text"
                            name="masterYear"
                            placeholder="Example: 2028"
                        >

                    </div>


                    <div class="form-group">

                        <label>
                            CGPA
                        </label>

                        <input
                            type="text"
                            name="masterCgpa"
                            placeholder="Example: 8.7"
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
                    placeholder="Example: ABC Public School"
                >


                <label>
                    Board
                </label>

                <input
                    type="text"
                    name="intermediateBoard"
                    placeholder="Example: CBSE"
                >


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Year
                        </label>

                        <input
                            type="text"
                            name="intermediateYear"
                            placeholder="Example: 2022"
                        >

                    </div>


                    <div class="form-group">

                        <label>
                            Percentage
                        </label>

                        <input
                            type="text"
                            name="intermediatePercentage"
                            placeholder="Example: 85%"
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
                    placeholder="Example: ABC Public School"
                >


                <label>
                    Board
                </label>

                <input
                    type="text"
                    name="highschoolBoard"
                    placeholder="Example: CBSE"
                >


                <div class="form-row">

                    <div class="form-group">

                        <label>
                            Year
                        </label>

                        <input
                            type="text"
                            name="highschoolYear"
                            placeholder="Example: 2020"
                        >

                    </div>


                    <div class="form-group">

                        <label>
                            Percentage
                        </label>

                        <input
                            type="text"
                            name="highschoolPercentage"
                            placeholder="Example: 90%"
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
                Add work experience, internships, training, or relevant professional exposure.
            </p>


            <textarea
                name="experience"
                placeholder="Describe your work experience, internship or training"
            ></textarea>

            <div class="hint">
                If you are a fresher, you can mention internships or training,
                or leave this section blank.
            </div>

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
                List technical, professional, or soft skills relevant to your career.
            </p>


            <textarea
                name="skills"
                placeholder="Example: Java, MySQL, HTML, CSS, JavaScript"
            ></textarea>

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
                Highlight academic, personal, or professional projects you have worked on.
            </p>


            <textarea
                name="projects"
                placeholder="Describe your academic or personal projects"
            ></textarea>

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
                Add relevant certifications, courses, or professional credentials.
            </p>


            <textarea
                name="certifications"
                placeholder="Enter your certifications"
            ></textarea>

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
                Mention the languages you can communicate in.
            </p>


            <input
                type="text"
                name="languages"
                placeholder="Example: English, Hindi"
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
                Add a few personal interests that help represent you beyond academics or work.
            </p>


            <input
                type="text"
                name="hobbies"
                placeholder="Example: Reading, Music, Travelling"
            >

        </div>


        <!-- ================= SAVE ================= -->

        <div class="save-area">

            <button type="submit" class="save-btn">
                Save Resume
            </button>

            <a href="home.jsp" class="cancel-link">
                Back to Dashboard
            </a>

        </div>

    </form>

</div>

</body>
</html>