<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Choose Resume Template | ResumeCraft</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f6fa;
            color: #111827;
        }

        .page {
            width: 1180px;
            max-width: 94%;
            margin: auto;
            padding: 30px 0 60px;
        }

        /* ================= TOP BAR ================= */

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 42px;
        }

        .brand {
            font-size: 26px;
            font-weight: 800;
            color: #111827;
            letter-spacing: -0.7px;
        }

        .brand span {
            color: #6366f1;
        }

        .back-btn {
            text-decoration: none;
            color: #475569;
            background: #ffffff;
            border: 1px solid #dbe2ea;
            padding: 10px 17px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .back-btn:hover {
            background: #111827;
            color: #ffffff;
            border-color: #111827;
        }

        /* ================= HEADING ================= */

        .heading {
            text-align: center;
            max-width: 700px;
            margin: 0 auto 42px;
        }

        .eyebrow {
            display: inline-block;
            margin-bottom: 12px;
            padding: 6px 11px;
            background: #eef2ff;
            color: #4f46e5;
            border-radius: 20px;
            font-size: 10px;
            font-weight: 800;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .heading h1 {
            margin: 0 0 12px;
            color: #0f172a;
            font-size: 38px;
            line-height: 1.15;
            letter-spacing: -1px;
        }

        .heading p {
            margin: 0;
            color: #64748b;
            font-size: 14px;
            line-height: 1.6;
        }

        /* ================= GRID ================= */

        .templates {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 26px;
        }

        /* ================= CARD ================= */

        .template-card {
            background: #ffffff;
            border: 1px solid #dfe5ed;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 18px rgba(15, 23, 42, 0.05);
            transition: 0.22s ease;
        }

        .template-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 16px 32px rgba(15, 23, 42, 0.11);
        }

        /* ================= PREVIEW ================= */

        .preview {
            height: 355px;
            padding: 22px;
            background: #edf1f6;
            position: relative;
            overflow: hidden;
        }

        .template-number {
            position: absolute;
            top: 14px;
            left: 14px;
            z-index: 20;

            width: 30px;
            height: 30px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #ffffff;
            border: 1px solid #d7dee8;
            border-radius: 7px;

            color: #334155;
            font-size: 10px;
            font-weight: 800;
        }

        .mini-resume {
            width: 100%;
            height: 100%;
            background: #ffffff;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(15, 23, 42, 0.14);
            position: relative;
        }

        .mini-name {
            font-size: 18px;
            font-weight: 800;
            line-height: 1.1;
        }

        .mini-role {
            font-size: 7px;
            font-weight: 800;
            letter-spacing: 1.4px;
        }

        .mini-contact {
            font-size: 6px;
            margin-top: 7px;
        }

        .mini-title {
            font-size: 8px;
            font-weight: 800;
            letter-spacing: 1px;
        }

        .mini-line {
            height: 1px;
            background: #cbd5e1;
            margin: 7px 0;
        }

        .mini-text {
            height: 4px;
            width: 92%;
            background: #d8e0e8;
            border-radius: 2px;
            margin: 4px 0;
        }

        .mini-text.short {
            width: 62%;
        }

        .mini-section {
            margin-bottom: 14px;
        }


        /* =====================================================
           TEMPLATE 1 - NOVA
           ===================================================== */

        .preview-1 .mini-resume {
            border-top: 5px solid #4f46e5;
            padding: 24px;
        }

        .preview-1 .mini-role,
        .preview-1 .mini-title {
            color: #4f46e5;
        }

        .preview-1 .profile-box {
            background: #f5f3ff;
            border-radius: 6px;
            padding: 11px;
            margin: 19px 0 16px;
        }

        .preview-1 .education-line {
            border-left: 3px solid #4f46e5;
            padding-left: 9px;
            margin-top: 8px;
        }


        /* =====================================================
           TEMPLATE 2 - SLATE
           DARK LEFT SIDEBAR
           ===================================================== */

        .preview-2 .mini-resume {
            display: grid;
            grid-template-columns: 29% 71%;
            background: #ffffff;
        }

        .preview-2 .slate-sidebar {
            background: #111827;
            color: #ffffff;
            padding: 27px 15px;
        }

        .preview-2 .slate-name {
            font-size: 18px;
            font-weight: 800;
            line-height: 1.15;
            margin-bottom: 8px;
        }

        .preview-2 .slate-role {
            color: #ffffff;
            font-size: 6.5px;
            font-weight: 700;
            letter-spacing: 1.1px;
            line-height: 1.3;
        }

        .preview-2 .slate-side-section {
            margin-top: 27px;
        }

        .preview-2 .slate-side-title {
            color: #ffffff;
            font-size: 7px;
            font-weight: 800;
            letter-spacing: 1.2px;
            padding-bottom: 7px;
            border-bottom: 1px solid #475569;
            margin-bottom: 9px;
        }

        .preview-2 .slate-side-text {
            color: #e2e8f0;
            font-size: 6px;
            line-height: 1.45;
        }

        .preview-2 .slate-main {
            padding: 27px 21px;
        }

        .preview-2 .slate-heading {
            display: flex;
            align-items: center;
            gap: 7px;
            margin-bottom: 7px;
        }

        .preview-2 .slate-heading-bar {
            width: 4px;
            height: 21px;
            background: #111827;
        }

        .preview-2 .slate-heading-text {
            font-size: 8px;
            font-weight: 800;
            letter-spacing: 1px;
            color: #111827;
        }

        .preview-2 .slate-main .mini-text {
            background: #d7dee7;
        }

        .preview-2 .slate-education {
            background: #f8fafc;
            border-left: 3px solid #64748b;
            border-radius: 4px;
            padding: 9px;
            margin-top: 8px;
        }


        /* =====================================================
           TEMPLATE 3 - ORBIT
           ===================================================== */

        .preview-3 .mini-resume {
            border-left: 6px solid #10b981;
            padding: 22px;
        }

        .preview-3 .tech-header {
            background: #ecfdf5;
            padding: 14px;
            margin: -22px -22px 17px;
            border-bottom: 1px solid #a7f3d0;
        }

        .preview-3 .mini-role,
        .preview-3 .mini-title {
            color: #047857;
        }

        .preview-3 .tech-card {
            background: #f0fdf4;
            border: 1px solid #a7f3d0;
            border-radius: 6px;
            padding: 9px;
            margin-bottom: 10px;
        }

        .preview-3 .mini-pill {
            display: inline-block;
            width: 43px;
            height: 15px;
            margin: 2px;
            border-radius: 10px;
            background: #bbf7d0;
        }

        .preview-3 .tech-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
        }


        /* =====================================================
           TEMPLATE 4 - AXIS
           FULL WIDTH HEADER + NUMBERED SECTIONS
           ===================================================== */

        .preview-4 .mini-resume {
            background: #ffffff;
            padding: 0 22px 22px;
        }

        .preview-4 .axis-header {
            padding: 24px 18px 19px;
            margin: 0 -22px;
            border-bottom: 3px solid #222222;
        }

        .preview-4 .axis-name {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 7px;
        }

        .preview-4 .axis-role {
            color: #334155;
            font-size: 7px;
            font-weight: 800;
            letter-spacing: 1.4px;
        }

        .preview-4 .axis-contact {
            color: #475569;
            font-size: 6px;
            margin-top: 8px;
        }

        .preview-4 .axis-body {
            padding: 20px 0 0;
        }

        .preview-4 .axis-section {
            margin-bottom: 15px;
        }

        .preview-4 .axis-heading {
            display: flex;
            align-items: center;
            gap: 7px;
            margin-bottom: 7px;
        }

        .preview-4 .axis-circle {
            width: 19px;
            height: 19px;
            border-radius: 50%;
            background: #111827;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 6px;
            font-weight: 800;
            flex-shrink: 0;
        }

        .preview-4 .axis-title {
            font-size: 8px;
            font-weight: 800;
            letter-spacing: 1px;
            color: #111827;
        }

        .preview-4 .axis-line {
            height: 1px;
            background: #cbd5e1;
            margin-bottom: 7px;
        }

        .preview-4 .axis-education {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 6px;
        }

        .preview-4 .axis-edu-card {
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            padding: 7px;
        }

        .preview-4 .axis-edu-card strong {
            display: block;
            font-size: 6.5px;
            margin-bottom: 5px;
        }

        .preview-4 .axis-edu-card span {
            display: block;
            font-size: 5.5px;
            color: #475569;
            margin-top: 3px;
        }


        /* =====================================================
           TEMPLATE 5 - AURA
           ===================================================== */

        .preview-5 .mini-resume {
            font-family: Georgia, "Times New Roman", serif;
        }

        .preview-5 .aura-header {
            background: #29231f;
            color: #ffffff;
            padding: 23px;
        }

        .preview-5 .mini-role,
        .preview-5 .mini-title {
            color: #c49a4a;
        }

        .preview-5 .aura-body {
            display: grid;
            grid-template-columns: 88px 1fr;
            height: calc(100% - 94px);
        }

        .preview-5 .sidebar {
            background: #eee9df;
            padding: 17px 10px;
        }

        .preview-5 .main {
            padding: 17px;
        }

        .preview-5 .gold-box {
            border-left: 3px solid #b88a3b;
            background: #f4f0e8;
            padding: 9px;
        }


        /* =====================================================
           TEMPLATE 6 - VERTEX
           ===================================================== */

        .preview-6 .mini-resume {
            background: #f8fafc;
            border: 1px solid #dbe3ec;
            padding: 22px;
        }

        .preview-6 .vertex-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 15px;
            border-bottom: 1px solid #cbd5e1;
        }

        .preview-6 .badge {
            width: 45px;
            height: 45px;
            background: #0f172a;
            transform: rotate(45deg);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 5px 5px 0 #cbd8e2;
        }

        .preview-6 .badge span {
            color: #ffffff;
            font-size: 8px;
            font-weight: 800;
            transform: rotate(-45deg);
        }

        .preview-6 .mini-title {
            color: #0f172a;
        }

        .preview-6 .vertex-box {
            border-left: 4px solid #0f172a;
            background: #f1f5f9;
            padding: 9px;
        }

        .preview-6 .vertex-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
        }


        /* ================= CARD INFO ================= */

        .card-info {
            padding: 20px 22px 22px;
        }

        .card-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 15px;
        }

        .card-info h2 {
            margin: 0 0 6px;
            color: #111827;
            font-size: 21px;
        }

        .card-info p {
            margin: 0;
            max-width: 480px;
            color: #64748b;
            font-size: 12px;
            line-height: 1.55;
        }

        .style-tag {
            flex-shrink: 0;
            padding: 5px 8px;
            border-radius: 5px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            color: #64748b;
            font-size: 9px;
            font-weight: 700;
        }

        .choose-btn {
            display: inline-block;
            margin-top: 17px;
            padding: 10px 16px;
            border-radius: 7px;
            background: #111827;
            color: #ffffff;
            text-decoration: none;
            font-size: 12px;
            font-weight: 700;
            transition: 0.2s ease;
        }

        .choose-btn:hover {
            background: #4f46e5;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 850px) {

            .templates {
                grid-template-columns: 1fr;
            }

            .heading h1 {
                font-size: 32px;
            }

        }

        @media (max-width: 600px) {

            .page {
                max-width: 94%;
                padding-top: 22px;
            }

            .topbar {
                margin-bottom: 32px;
            }

            .heading {
                margin-bottom: 30px;
            }

            .heading h1 {
                font-size: 28px;
            }

            .preview {
                height: 320px;
            }

            .card-top {
                flex-direction: column;
            }

        }

    </style>

</head>


<body>

<div class="page">


    <!-- ================= TOP BAR ================= -->

    <div class="topbar">

        <div class="brand">
            Resume<span>Craft</span>
        </div>

        <a
            href="<%= request.getContextPath() %>/home.jsp"
            class="back-btn"
        >
            Back to Dashboard
        </a>

    </div>


    <!-- ================= HEADING ================= -->

    <div class="heading">

        <div class="eyebrow">
            ResumeCraft Templates
        </div>

        <h1>
            Choose your resume style
        </h1>

        <p>
            Select a design that matches your professional identity.
            Your information will stay the same across every template.
        </p>

    </div>


    <div class="templates">


        <!-- =====================================================
             TEMPLATE 1 - NOVA
             ===================================================== -->

        <div class="template-card">

            <div class="preview preview-1">

                <div class="template-number">
                    01
                </div>

                <div class="mini-resume">

                    <div class="mini-name">
                        Professional Resume
                    </div>

                    <div class="mini-role">
                        PROFESSIONAL PROFILE
                    </div>

                    <div class="mini-contact">
                        email@example.com | +91 XXXXX XXXXX
                    </div>


                    <div class="profile-box">

                        <div class="mini-title">
                            PROFILE
                        </div>

                        <div class="mini-text"></div>
                        <div class="mini-text"></div>
                        <div class="mini-text short"></div>

                    </div>


                    <div class="mini-section">

                        <div class="mini-title">
                            EXPERIENCE
                        </div>

                        <div class="mini-line"></div>

                        <div class="mini-text"></div>
                        <div class="mini-text short"></div>

                    </div>


                    <div class="mini-section">

                        <div class="mini-title">
                            PROJECTS
                        </div>

                        <div class="mini-line"></div>

                        <div class="mini-text"></div>
                        <div class="mini-text short"></div>

                    </div>


                    <div class="mini-section">

                        <div class="mini-title">
                            EDUCATION
                        </div>

                        <div class="education-line">

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>

                        </div>

                    </div>

                </div>

            </div>


            <div class="card-info">

                <div class="card-top">

                    <div>

                        <h2>Nova</h2>

                        <p>
                            Clean editorial design with generous whitespace
                            and a polished professional appearance.
                        </p>

                    </div>

                    <div class="style-tag">
                        EDITORIAL
                    </div>

                </div>

                <a href="resume.jsp?template=1" class="choose-btn">
                    Use Nova
                </a>

            </div>

        </div>


        <!-- =====================================================
             TEMPLATE 2 - SLATE
             ===================================================== -->

        <div class="template-card">

            <div class="preview preview-2">

                <div class="template-number">
                    02
                </div>

                <div class="mini-resume">


                    <div class="slate-sidebar">

                        <div class="slate-name">
                            Professional Resume
                        </div>

                        <div class="slate-role">
                            EXECUTIVE<br>
                            PROFESSIONAL PROFILE
                        </div>


                        <div class="slate-side-section">

                            <div class="slate-side-title">
                                CONTACT
                            </div>

                            <div class="slate-side-text">
                                email@example.com
                            </div>

                            <div
                                class="slate-side-text"
                                style="margin-top:18px;"
                            >
                                +91 XXXXX XXXXX
                            </div>

                            <div
                                class="slate-side-text"
                                style="margin-top:18px;"
                            >
                                City, Country
                            </div>

                        </div>


                        <div class="slate-side-section">

                            <div class="slate-side-title">
                                CORE SKILLS
                            </div>

                            <div class="slate-side-text">
                                Web Development,
                                Databases,
                                Java, Python
                            </div>

                        </div>


                        <div class="slate-side-section">

                            <div class="slate-side-title">
                                CERTIFICATIONS
                            </div>

                            <div class="slate-side-text">
                                Professional Certification
                            </div>

                        </div>


                        <div class="slate-side-section">

                            <div class="slate-side-title">
                                LANGUAGES
                            </div>

                            <div class="slate-side-text">
                                English, Hindi
                            </div>

                        </div>

                    </div>


                    <div class="slate-main">


                        <div class="slate-heading">

                            <div class="slate-heading-bar"></div>

                            <div class="slate-heading-text">
                                PROFESSIONAL SUMMARY
                            </div>

                        </div>

                        <div class="mini-text"></div>
                        <div class="mini-text"></div>
                        <div class="mini-text short"></div>


                        <div
                            class="slate-heading"
                            style="margin-top:22px;"
                        >

                            <div class="slate-heading-bar"></div>

                            <div class="slate-heading-text">
                                EXPERIENCE
                            </div>

                        </div>

                        <div class="mini-text"></div>
                        <div class="mini-text short"></div>


                        <div
                            class="slate-heading"
                            style="margin-top:22px;"
                        >

                            <div class="slate-heading-bar"></div>

                            <div class="slate-heading-text">
                                PROJECTS
                            </div>

                        </div>

                        <div class="mini-text"></div>
                        <div class="mini-text short"></div>


                        <div
                            class="slate-heading"
                            style="margin-top:22px;"
                        >

                            <div class="slate-heading-bar"></div>

                            <div class="slate-heading-text">
                                EDUCATION
                            </div>

                        </div>


                        <div class="slate-education">

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>
                            <div
                                class="mini-text"
                                style="width:45%;"
                            ></div>

                        </div>


                        <div class="slate-education">

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>

                        </div>

                    </div>

                </div>

            </div>


            <div class="card-info">

                <div class="card-top">

                    <div>

                        <h2>Slate</h2>

                        <p>
                            Executive layout with a dark navy sidebar,
                            contact-focused profile area and structured
                            professional sections.
                        </p>

                    </div>

                    <div class="style-tag">
                        EXECUTIVE
                    </div>

                </div>

                <a href="resume.jsp?template=2" class="choose-btn">
                    Use Slate
                </a>

            </div>

        </div>


        <!-- =====================================================
             TEMPLATE 3 - ORBIT
             ===================================================== -->

        <div class="template-card">

            <div class="preview preview-3">

                <div class="template-number">
                    03
                </div>

                <div class="mini-resume">

                    <div class="tech-header">

                        <div class="mini-name">
                            Technology Resume
                        </div>

                        <div class="mini-role">
                            TECHNOLOGY PROFESSIONAL
                        </div>

                        <div class="mini-contact">
                            email@example.com | +91 XXXXX XXXXX
                        </div>

                    </div>


                    <div class="mini-section">

                        <div class="mini-title">
                            ABOUT
                        </div>

                        <div class="mini-line"></div>

                        <div class="mini-text"></div>
                        <div class="mini-text short"></div>

                    </div>


                    <div class="tech-grid">

                        <div class="tech-card">

                            <div class="mini-title">
                                SKILLS
                            </div>

                            <span class="mini-pill"></span>
                            <span class="mini-pill"></span>
                            <span class="mini-pill"></span>

                        </div>


                        <div class="tech-card">

                            <div class="mini-title">
                                PROJECTS
                            </div>

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>

                        </div>

                    </div>


                    <div
                        class="mini-section"
                        style="margin-top:12px;"
                    >

                        <div class="mini-title">
                            EXPERIENCE
                        </div>

                        <div class="mini-line"></div>

                        <div class="mini-text"></div>
                        <div class="mini-text short"></div>

                    </div>


                    <div class="mini-section">

                        <div class="mini-title">
                            EDUCATION
                        </div>

                        <div class="tech-card">

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>

                        </div>

                    </div>

                </div>

            </div>


            <div class="card-info">

                <div class="card-top">

                    <div>

                        <h2>Orbit</h2>

                        <p>
                            Technology-focused layout featuring highlighted
                            skills, projects and developer-oriented sections.
                        </p>

                    </div>

                    <div class="style-tag">
                        TECH
                    </div>

                </div>

                <a href="resume.jsp?template=3" class="choose-btn">
                    Use Orbit
                </a>

            </div>

        </div>


        <!-- =====================================================
             TEMPLATE 4 - AXIS
             ===================================================== -->

        <div class="template-card">

            <div class="preview preview-4">

                <div class="template-number">
                    04
                </div>

                <div class="mini-resume">


                    <div class="axis-header">

                        <div class="axis-name">
                            Professional Resume
                        </div>

                        <div class="axis-role">
                            PROFESSIONAL RESUME
                        </div>

                        <div class="axis-contact">
                            email@example.com | +91 XXXXX XXXXX | City, Country
                        </div>

                    </div>


                    <div class="axis-body">


                        <div class="axis-section">

                            <div class="axis-heading">

                                <div class="axis-circle">
                                    01
                                </div>

                                <div class="axis-title">
                                    PROFILE
                                </div>

                            </div>

                            <div class="axis-line"></div>

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>

                        </div>


                        <div class="axis-section">

                            <div class="axis-heading">

                                <div class="axis-circle">
                                    02
                                </div>

                                <div class="axis-title">
                                    EXPERIENCE
                                </div>

                            </div>

                            <div class="axis-line"></div>

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>

                        </div>


                        <div class="axis-section">

                            <div class="axis-heading">

                                <div class="axis-circle">
                                    03
                                </div>

                                <div class="axis-title">
                                    PROJECTS
                                </div>

                            </div>

                            <div class="axis-line"></div>

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>

                        </div>


                        <div class="axis-section">

                            <div class="axis-heading">

                                <div class="axis-circle">
                                    04
                                </div>

                                <div class="axis-title">
                                    EDUCATION
                                </div>

                            </div>

                            <div class="axis-line"></div>


                            <div class="axis-education">

                                <div class="axis-edu-card">

                                    <strong>
                                        Bachelor's Degree
                                    </strong>

                                    <span>
                                        University
                                    </span>

                                    <span>
                                        Year | CGPA
                                    </span>

                                </div>


                                <div class="axis-edu-card">

                                    <strong>
                                        Master's Degree
                                    </strong>

                                    <span>
                                        University
                                    </span>

                                    <span>
                                        Year | CGPA
                                    </span>

                                </div>


                                <div class="axis-edu-card">

                                    <strong>
                                        Intermediate / 12th
                                    </strong>

                                    <span>
                                        School
                                    </span>

                                    <span>
                                        Board | Year | Percentage
                                    </span>

                                </div>


                                <div class="axis-edu-card">

                                    <strong>
                                        High School / 10th
                                    </strong>

                                    <span>
                                        School
                                    </span>

                                    <span>
                                        Board | Year | Percentage
                                    </span>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <div class="card-info">

                <div class="card-top">

                    <div>

                        <h2>Axis</h2>

                        <p>
                            Minimal black-and-white layout with a strong
                            header, numbered sections and structured
                            education cards.
                        </p>

                    </div>

                    <div class="style-tag">
                        STRUCTURED
                    </div>

                </div>

                <a href="resume.jsp?template=4" class="choose-btn">
                    Use Axis
                </a>

            </div>

        </div>


        <!-- =====================================================
             TEMPLATE 5 - AURA
             ===================================================== -->

        <div class="template-card">

            <div class="preview preview-5">

                <div class="template-number">
                    05
                </div>

                <div class="mini-resume">

                    <div class="aura-header">

                        <div class="mini-role">
                            CURATED PROFESSIONAL PROFILE
                        </div>

                        <div
                            class="mini-name"
                            style="font-size:22px; margin-top:5px;"
                        >
                            Professional Resume
                        </div>

                        <div
                            class="mini-contact"
                            style="color:#eee9df;"
                        >
                            email@example.com | +91 XXXXX XXXXX
                        </div>

                    </div>


                    <div class="aura-body">

                        <div class="sidebar">

                            <div class="mini-title">
                                EXPERTISE
                            </div>

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>


                            <div
                                class="mini-title"
                                style="margin-top:20px;"
                            >
                                LANGUAGES
                            </div>

                            <div class="mini-text short"></div>


                            <div
                                class="mini-title"
                                style="margin-top:20px;"
                            >
                                INTERESTS
                            </div>

                            <div class="mini-text short"></div>

                        </div>


                        <div class="main">

                            <div class="mini-section">

                                <div class="mini-title">
                                    01 &nbsp; PROFILE
                                </div>

                                <div class="gold-box">

                                    <div class="mini-text"></div>
                                    <div class="mini-text short"></div>

                                </div>

                            </div>


                            <div class="mini-section">

                                <div class="mini-title">
                                    02 &nbsp; EXPERIENCE
                                </div>

                                <div class="mini-line"></div>

                                <div class="mini-text"></div>
                                <div class="mini-text short"></div>

                            </div>


                            <div class="mini-section">

                                <div class="mini-title">
                                    03 &nbsp; SELECTED WORK
                                </div>

                                <div class="mini-line"></div>

                                <div class="mini-text"></div>
                                <div class="mini-text short"></div>

                            </div>


                            <div class="mini-section">

                                <div class="mini-title">
                                    04 &nbsp; EDUCATION
                                </div>

                                <div class="mini-line"></div>

                                <div class="mini-text"></div>
                                <div class="mini-text short"></div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <div class="card-info">

                <div class="card-top">

                    <div>

                        <h2>Aura</h2>

                        <p>
                            Premium editorial design combining warm tones,
                            refined typography and a curated layout.
                        </p>

                    </div>

                    <div class="style-tag">
                        PREMIUM
                    </div>

                </div>

                <a href="resume.jsp?template=5" class="choose-btn">
                    Use Aura
                </a>

            </div>

        </div>


        <!-- =====================================================
             TEMPLATE 6 - VERTEX
             ===================================================== -->

        <div class="template-card">

            <div class="preview preview-6">

                <div class="template-number">
                    06
                </div>

                <div class="mini-resume">

                    <div class="vertex-header">

                        <div>

                            <div class="mini-name">
                                Graduate Resume
                            </div>

                            <div class="mini-role">
                                GRADUATE PROFESSIONAL
                            </div>

                            <div class="mini-contact">
                                email@example.com | +91 XXXXX XXXXX
                            </div>

                        </div>


                        <div class="badge">

                            <span>
                                VC
                            </span>

                        </div>

                    </div>


                    <div style="margin-top:18px;">

                        <div class="mini-section">

                            <div class="mini-title">
                                PROFILE
                            </div>

                            <div class="mini-line"></div>

                            <div class="mini-text"></div>
                            <div class="mini-text short"></div>

                        </div>


                        <div class="vertex-grid">

                            <div class="vertex-box">

                                <div class="mini-title">
                                    EXPERIENCE
                                </div>

                                <div class="mini-text"></div>
                                <div class="mini-text short"></div>

                            </div>


                            <div class="vertex-box">

                                <div class="mini-title">
                                    PROJECTS
                                </div>

                                <div class="mini-text"></div>
                                <div class="mini-text short"></div>

                            </div>

                        </div>


                        <div
                            class="mini-section"
                            style="margin-top:14px;"
                        >

                            <div class="mini-title">
                                EDUCATION
                            </div>

                            <div class="mini-line"></div>

                            <div class="vertex-box">

                                <div class="mini-text"></div>
                                <div class="mini-text short"></div>

                            </div>

                        </div>


                        <div class="mini-section">

                            <div class="mini-title">
                                SKILLS
                            </div>

                            <span
                                class="mini-pill"
                                style="background:#e2e8f0;"
                            ></span>

                            <span
                                class="mini-pill"
                                style="background:#e2e8f0;"
                            ></span>

                            <span
                                class="mini-pill"
                                style="background:#e2e8f0;"
                            ></span>

                        </div>

                    </div>

                </div>

            </div>


            <div class="card-info">

                <div class="card-top">

                    <div>

                        <h2>Vertex</h2>

                        <p>
                            Geometric graduate-focused design with a modern
                            structured identity and strong visual details.
                        </p>

                    </div>

                    <div class="style-tag">
                        MODERN
                    </div>

                </div>

                <a href="resume.jsp?template=6" class="choose-btn">
                    Use Vertex
                </a>

            </div>

        </div>


    </div>

</div>

</body>

</html>