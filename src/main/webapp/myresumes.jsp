<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Resumes | ResumeCraft</title>

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
            width: 950px;
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

        .dashboard-btn {
            text-decoration: none;
            color: #475569;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            padding: 9px 15px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .dashboard-btn:hover {
            border-color: #6366f1;
            color: #4f46e5;
        }

        /* HEADER */

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .page-header h1 {
            margin: 0 0 7px;
            color: #111827;
            font-size: 30px;
            letter-spacing: -0.5px;
        }

        .page-header p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
        }

        .create-btn {
            display: inline-block;
            text-decoration: none;
            background: #4f46e5;
            color: #ffffff;
            padding: 12px 18px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 700;
            transition: 0.2s ease;
            white-space: nowrap;
        }

        .create-btn:hover {
            background: #4338ca;
            transform: translateY(-1px);
        }

        /* RESUME CARD */

        .resume-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 13px;
            margin-bottom: 18px;
            overflow: hidden;
            box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
        }

        .resume-card-header {
            padding: 22px 24px;
            border-bottom: 1px solid #eef2f7;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
        }

        .resume-name {
            margin: 0 0 6px;
            color: #111827;
            font-size: 21px;
        }

        .resume-email {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }

        .template-badge {
            padding: 7px 11px;
            border-radius: 6px;
            background: #eef2ff;
            color: #4f46e5;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

        /* INFORMATION */

        .resume-content {
            padding: 20px 24px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .info-box {
            background: #f8fafc;
            border: 1px solid #edf1f5;
            border-radius: 8px;
            padding: 13px 15px;
        }

        .info-label {
            display: block;
            color: #94a3b8;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 5px;
        }

        .info-value {
            color: #334155;
            font-size: 13px;
            line-height: 1.5;
            word-break: break-word;
        }

        /* ACTIONS */

        .actions {
            padding: 16px 24px;
            background: #fafbfc;
            border-top: 1px solid #eef2f7;
            display: flex;
            gap: 9px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            padding: 9px 15px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 700;
            transition: 0.2s ease;
        }

        .view {
            background: #4f46e5;
            color: #ffffff;
        }

        .view:hover {
            background: #4338ca;
        }

        .edit {
            background: #fff7ed;
            color: #c2410c;
            border: 1px solid #fed7aa;
        }

        .edit:hover {
            background: #ffedd5;
        }

        .delete {
            background: #fef2f2;
            color: #dc2626;
            border: 1px solid #fecaca;
        }

        .delete:hover {
            background: #fee2e2;
        }

        /* EMPTY STATE */

        .empty {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 13px;
            padding: 55px 25px;
            text-align: center;
            box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
        }

        .empty-icon {
            width: 48px;
            height: 48px;
            margin: 0 auto 18px;
            border-radius: 10px;
            background: #eef2ff;
            color: #4f46e5;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
            font-weight: 700;
        }

        .empty h2 {
            margin: 0 0 8px;
            color: #111827;
            font-size: 21px;
        }

        .empty p {
            margin: 0 0 22px;
            color: #64748b;
            font-size: 13px;
        }

        /* MOBILE */

        @media (max-width: 700px) {

            body {
                padding: 20px 0 40px;
            }

            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .create-btn {
                width: 100%;
                text-align: center;
            }

            .resume-card-header {
                flex-direction: column;
            }

            .template-badge {
                align-self: flex-start;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .actions {
                flex-direction: column;
            }

            .btn {
                text-align: center;
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

        <a href="home.jsp" class="dashboard-btn">
            Dashboard
        </a>

    </div>


    <!-- PAGE HEADER -->

    <div class="page-header">

        <div>
            <h1>My Resumes</h1>

            <p>
                View, edit and manage all your saved resumes.
            </p>
        </div>

        <a href="templates.jsp" class="create-btn">
            + Create New Resume
        </a>

    </div>


<%

    ResultSet rs = (ResultSet) request.getAttribute("resumes");

    if (rs != null) {

        boolean hasResume = false;

        while (rs.next()) {

            hasResume = true;

            int resumeId = rs.getInt("resume_id");

            String fullName = rs.getString("full_name");
            String email = rs.getString("email");
            String phone = rs.getString("phone");
            String address = rs.getString("address");

            String careerObjective = rs.getString("career_objective");
            String skills = rs.getString("skills");
            String experience = rs.getString("experience");

            String templateId = rs.getString("template_id");

            if (templateId == null || templateId.trim().isEmpty()) {
                templateId = "1";
            }

            String templateName;

            switch (templateId) {

                case "2":
                case "template2":
                    templateName = "Slate";
                    break;

                case "3":
                case "template3":
                    templateName = "Orbit";
                    break;

                case "4":
                case "template4":
                    templateName = "Axis";
                    break;

                case "5":
                case "template5":
                    templateName = "Aura";
                    break;

                case "6":
                case "template6":
                    templateName = "Vertex";
                    break;

                default:
                    templateName = "Nova";
                    break;
            }

%>


    <!-- RESUME CARD -->

    <div class="resume-card">

        <div class="resume-card-header">

            <div>

                <h2 class="resume-name">
                    <%= fullName != null ? fullName : "Untitled Resume" %>
                </h2>

                <p class="resume-email">
                    <%= email != null ? email : "" %>
                </p>

            </div>

            <div class="template-badge">
                <%= templateName %> Template
            </div>

        </div>


        <div class="resume-content">

            <div class="info-grid">

                <div class="info-box">

                    <span class="info-label">
                        Phone
                    </span>

                    <div class="info-value">
                        <%= phone != null && !phone.trim().isEmpty()
                                ? phone
                                : "Not provided" %>
                    </div>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Location
                    </span>

                    <div class="info-value">
                        <%= address != null && !address.trim().isEmpty()
                                ? address
                                : "Not provided" %>
                    </div>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Professional Summary
                    </span>

                    <div class="info-value">
                        <%= careerObjective != null && !careerObjective.trim().isEmpty()
                                ? careerObjective
                                : "Not provided" %>
                    </div>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Skills
                    </span>

                    <div class="info-value">
                        <%= skills != null && !skills.trim().isEmpty()
                                ? skills
                                : "Not provided" %>
                    </div>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Experience
                    </span>

                    <div class="info-value">
                        <%= experience != null && !experience.trim().isEmpty()
                                ? experience
                                : "Not provided" %>
                    </div>

                </div>

            </div>

        </div>


        <!-- ACTION BUTTONS -->

        <div class="actions">

            <a
                class="btn view"
                href="viewResume?resumeId=<%= resumeId %>"
            >
                View Resume
            </a>


            <a
                class="btn edit"
                href="editResume?resumeId=<%= resumeId %>"
            >
                Edit Resume
            </a>


            <a
                class="btn delete"
                href="deleteResume?resumeId=<%= resumeId %>"
                onclick="return confirm('Are you sure you want to delete this resume?');"
            >
                Delete Resume
            </a>

        </div>

    </div>


<%

        }

        if (!hasResume) {

%>


    <!-- EMPTY STATE -->

    <div class="empty">

        <div class="empty-icon">
            +
        </div>

        <h2>No Resumes Yet</h2>

        <p>
            You have not created a resume yet. Start building your first professional resume.
        </p>

        <a href="templates.jsp" class="create-btn">
            Create Your First Resume
        </a>

    </div>


<%

        }

    } else {

%>


    <div class="empty">

        <div class="empty-icon">
            !
        </div>

        <h2>Unable to Load Resumes</h2>

        <p>
            There was a problem loading your saved resumes.
        </p>

    </div>


<%

    }

%>

</div>

</body>

</html>