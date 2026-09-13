<%
    Object userId = session.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ResumeCraft - Dashboard</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3f6fa;
            color: #111827;
        }

        /* NAVBAR */
        .navbar {
            height: 72px;
            background: #111827;
            color: white;
            padding: 0 55px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-size: 25px;
            font-weight: 800;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .welcome-small {
            color: #d1d5db;
            font-size: 14px;
        }

        .logout {
            text-decoration: none;
            color: white;
            background: #374151;
            padding: 9px 17px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 600;
            transition: 0.2s;
        }

        .logout:hover {
            background: #4b5563;
        }

        /* MAIN */
        .main {
            max-width: 1100px;
            margin: 0 auto;
            padding: 65px 25px 70px;
        }

        .hero {
            text-align: center;
            margin-bottom: 48px;
        }

        .hero h1 {
            margin: 0 0 12px;
            font-size: 40px;
            font-weight: 800;
            letter-spacing: -1px;
        }

        .hero h1 span {
            color: #4f46e5;
        }

        .hero p {
            margin: 0;
            color: #64748b;
            font-size: 17px;
        }

        /* CARDS */
        .cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
            max-width: 850px;
            margin: 0 auto;
        }

        .card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 32px;
            box-shadow: 0 6px 20px rgba(15, 23, 42, 0.06);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.10);
        }

        /* SIMPLE CSS ICON */
        .icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eef2ff;
            color: #4f46e5;
            border-radius: 10px;
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .plus-icon::before {
            content: "+";
        }

        .resume-icon::before {
            content: "R";
            font-size: 20px;
        }

        .card h2 {
            margin: 0 0 10px;
            font-size: 22px;
        }

        .card p {
            margin: 0 0 24px;
            color: #64748b;
            font-size: 14px;
            line-height: 1.7;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #111827;
            color: white;
            padding: 11px 20px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 600;
            transition: 0.2s;
        }

        .btn:hover {
            background: #4f46e5;
        }

        /* FEATURES */
        .features {
            margin-top: 60px;
            text-align: center;
        }

        .features h2 {
            margin-bottom: 28px;
            font-size: 24px;
        }

        .feature-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .feature {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 22px 15px;
        }

        .feature strong {
            display: block;
            margin-bottom: 7px;
            font-size: 15px;
        }

        .feature span {
            color: #64748b;
            font-size: 13px;
        }

        /* FOOTER */
        .footer {
            text-align: center;
            color: #94a3b8;
            font-size: 13px;
            margin-top: 55px;
        }

        /* RESPONSIVE */
        @media (max-width: 750px) {

            .navbar {
                padding: 0 20px;
            }

            .welcome-small {
                display: none;
            }

            .main {
                padding-top: 45px;
            }

            .hero h1 {
                font-size: 31px;
            }

            .hero p {
                font-size: 15px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .feature-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">

        <div class="brand">
            ResumeCraft
        </div>

        <div class="nav-right">

            <div class="welcome-small">
                Your Resume Dashboard
            </div>

            <a class="logout" href="login.jsp">
                Logout
            </a>

        </div>

    </div>


    <!-- MAIN -->
    <div class="main">

        <!-- HERO -->
        <div class="hero">

            <h1>
                Build Your <span>Professional Resume</span>
            </h1>

            <p>
                Create, manage and download your resume with ease.
            </p>

        </div>


        <!-- ACTION CARDS -->
        <div class="cards">

            <!-- CREATE RESUME -->
            <div class="card">

                <div class="icon plus-icon"></div>

                <h2>
                    Create Resume
                </h2>

                <p>
                    Choose from our professionally designed templates
                    and build a resume that represents your skills,
                    education and experience.
                </p>

                <a class="btn" href="templates.jsp">
                    Choose Template
                </a>

            </div>


            <!-- MY RESUMES -->
            <div class="card">

                <div class="icon resume-icon"></div>

                <h2>
                    My Resumes
                </h2>

                <p>
                    Access your saved resumes anytime.
                    View, edit, update, delete or download
                    your resumes as PDF.
                </p>

                <a class="btn" href="myresumes">
                    View My Resumes
                </a>

            </div>

        </div>


        <!-- FEATURES -->
        <div class="features">

            <h2>
                Everything You Need
            </h2>

            <div class="feature-row">

                <div class="feature">
                    <strong>
                        6 Professional Templates
                    </strong>

                    <span>
                        Choose a design that matches your style.
                    </span>
                </div>


                <div class="feature">
                    <strong>
                        Easy to Edit
                    </strong>

                    <span>
                        Update your resume whenever you need.
                    </span>
                </div>


                <div class="feature">
                    <strong>
                        PDF Ready
                    </strong>

                    <span>
                        Print or save your finished resume as PDF.
                    </span>
                </div>

            </div>

        </div>


        <!-- FOOTER -->
        <div class="footer">
            ResumeCraft - Professional Resume Builder
        </div>

    </div>

</body>
</html>