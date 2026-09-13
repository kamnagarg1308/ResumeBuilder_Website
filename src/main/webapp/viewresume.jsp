<%@ page import="java.sql.ResultSet" %>

<%!

    public String safe(String value) {

        if (value == null) return "";

        return value.trim();

    }

    public String esc(String value) {

        String s = safe(value);

        s = s.replace("&", "&amp;");

        s = s.replace("<", "&lt;");

        s = s.replace(">", "&gt;");

        s = s.replace("\"", "&quot;");

        s = s.replace("'", "&#39;");

        return s;

    }

    public String initials(String value) {

        String name = safe(value);

        if (name.isEmpty()) return "";

        String[] parts = name.split("\\s+");

        if (parts.length == 1) {

            return parts[0].substring(0, Math.min(2, parts[0].length())).toUpperCase();

        }

        return (parts[0].substring(0, 1) +

                parts[parts.length - 1].substring(0, 1)).toUpperCase();

    }

%>

<%

    ResultSet rs = (ResultSet) request.getAttribute("resume");

    String templateId = (String) request.getAttribute("templateId");

    if (templateId == null || templateId.trim().isEmpty()) {

        templateId = "template1";

    }

    if (!templateId.matches("template[1-6]")) {

        templateId = "template1";

    }

    String fullName = "";

    String email = "";

    String phone = "";

    String address = "";

    String careerObjective = "";

    String bachelorDegree = "";

    String bachelorCollege = "";

    String bachelorYear = "";

    String bachelorCgpa = "";

    String masterDegree = "";

    String masterCollege = "";

    String masterYear = "";

    String masterCgpa = "";

    String intermediateSchool = "";

    String intermediateBoard = "";

    String intermediateYear = "";

    String intermediatePercentage = "";

    String highschoolSchool = "";

    String highschoolBoard = "";

    String highschoolYear = "";

    String highschoolPercentage = "";

    String experience = "";

    String skills = "";

    String projects = "";

    String certifications = "";

    String languages = "";

    String hobbies = "";

    if (rs != null) {

        fullName = safe(rs.getString("full_name"));

        email = safe(rs.getString("email"));

        phone = safe(rs.getString("phone"));

        address = safe(rs.getString("address"));

        careerObjective = safe(rs.getString("career_objective"));

        bachelorDegree = safe(rs.getString("bachelor_degree"));

        bachelorCollege = safe(rs.getString("bachelor_college"));

        bachelorYear = safe(rs.getString("bachelor_year"));

        bachelorCgpa = safe(rs.getString("bachelor_cgpa"));

        masterDegree = safe(rs.getString("master_degree"));

        masterCollege = safe(rs.getString("master_college"));

        masterYear = safe(rs.getString("master_year"));

        masterCgpa = safe(rs.getString("master_cgpa"));

        intermediateSchool = safe(rs.getString("intermediate_school"));

        intermediateBoard = safe(rs.getString("intermediate_board"));

        intermediateYear = safe(rs.getString("intermediate_year"));

        intermediatePercentage = safe(rs.getString("intermediate_percentage"));

        highschoolSchool = safe(rs.getString("highschool_school"));

        highschoolBoard = safe(rs.getString("highschool_board"));

        highschoolYear = safe(rs.getString("highschool_year"));

        highschoolPercentage = safe(rs.getString("highschool_percentage"));

        experience = safe(rs.getString("experience"));

        skills = safe(rs.getString("skills"));

        projects = safe(rs.getString("projects"));

        certifications = safe(rs.getString("certifications"));

        languages = safe(rs.getString("languages"));

        hobbies = safe(rs.getString("hobbies"));

    }

%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Resume | ResumeCraft</title>

    <style>

        * {

            box-sizing: border-box;

        }

        body {

            margin: 0;

            padding: 30px;

            background: #edf1f5;

            color: #111827;

            font-family: Arial, Helvetica, sans-serif;

        }

        .resume {

            width: 850px;

            max-width: 100%;

            margin: 0 auto;

            background: #fff;

            min-height: 1100px;

            overflow: hidden;

            box-shadow: 0 15px 40px rgba(15, 23, 42, 0.12);

        }

        .buttons {

            width: 850px;

            max-width: 100%;

            margin: 24px auto 0;

            text-align: center;

        }

        .buttons button {

            border: 0;

            border-radius: 6px;

            padding: 12px 22px;

            margin: 4px;

            background: #111827;

            color: white;

            font-weight: 700;

            cursor: pointer;

        }

        .buttons button:hover {

            opacity: .88;

        }

        p {

            margin: 6px 0;

            line-height: 1.55;

            white-space: pre-line;

        }

        .edu-item h3 {

            margin: 0 0 5px;

            font-size: 15px;

        }

        .edu-item p {

            margin: 4px 0;

            font-size: 13px;

        }

        /* =========================

           TEMPLATE 1 - NOVA

           Clean Editorial Professional

           ========================= */

        .template1 .t1-header {

            padding: 46px 58px 34px;

            background: #ffffff;

            border-top: 7px solid #4f46e5;

        }

        .template1 .t1-header h1 {

            margin: 0;

            color: #111827;

            font-size: 42px;

            line-height: 1.1;

            font-weight: 800;

            letter-spacing: -1.5px;

        }

        .template1 .role {

            margin-top: 9px;

            color: #4f46e5;

            font-size: 13px;

            font-weight: 800;

            letter-spacing: 2px;

            text-transform: uppercase;

        }

        .template1 .contact {

            margin-top: 13px;

            color: #64748b;

            font-size: 13px;

        }

        .template1 .t1-divider {

            height: 1px;

            background: #e2e8f0;

        }

        .template1 .resume-content {

            padding: 40px 58px 50px;

        }

        .template1 .section {

            margin-bottom: 30px;

        }

        .template1 .title {

            margin: 0 0 14px;

            padding-bottom: 9px;

            border-bottom: 2px solid #c7d2fe;

            color: #4f46e5;

            font-size: 18px;

            font-weight: 800;

            letter-spacing: 1px;

            text-transform: uppercase;

        }

        .template1 .profile-box {

            padding: 19px 22px;

            background: #f5f3ff;

            border-radius: 8px;

        }

        .template1 .profile-box .title {

            margin-bottom: 13px;

        }

        .template1 p {

            margin: 7px 0;

            font-size: 14px;

            line-height: 1.65;

            white-space: pre-line;

        }

        .template1 .education-item {

            margin-bottom: 16px;

            padding: 12px 0 12px 16px;

            border-left: 3px solid #4f46e5;

        }

        .template1 .education-item h3 {

            margin: 0 0 7px;

            color: #111827;

            font-size: 16px;

        }

        .template1 .education-item p {

            margin: 5px 0;

        }

        .template1 .education-meta {

            margin: 5px 0;

            color: #475569;

            font-size: 13px;

            line-height: 1.45;

            white-space: normal;

        }

        /* =========================

           TEMPLATE 2 - EXECUTIVE

           ========================= */

        .template2 {

            display: grid;

            grid-template-columns: 215px 1fr;

            min-height: 1100px;

        }

        .template2 .sidebar {

            background: #111827;

            color: #fff;

            padding: 38px 24px;

        }

        .template2 .sidebar h1 {

            margin: 0;

            font-size: 29px;

            line-height: 1.08;

        }

        .template2 .sidebar .small-role {

            margin-top: 12px;

            color: #cbd5e1;

            font-size: 10px;

            letter-spacing: 1.8px;

            text-transform: uppercase;

        }

        .template2 .side-section {

            margin-top: 34px;

        }

        .template2 .side-title {

            padding-bottom: 7px;

            border-bottom: 1px solid #475569;

            color: #fff;

            font-size: 11px;

            font-weight: 800;

            letter-spacing: 1.5px;

            text-transform: uppercase;

        }

        .template2 .side-text {

            margin-top: 8px;

            color: #e2e8f0;

            font-size: 11px;

            line-height: 1.45;

            white-space: pre-line;

            word-break: break-word;

        }

        /* Compact contact details in Template 2 */
        .template2 .side-text br {
            line-height: 1.1;
        }

        .template2 .content {

            padding: 42px 48px 55px 38px;

        }

        .template2 .content-section {

            margin-bottom: 30px;

        }

        .template2 .content-title {

            margin: 0 0 13px;

            padding-left: 11px;

            border-left: 5px solid #111827;

            color: #111827;

            font-size: 16px;

            letter-spacing: 1px;

            text-transform: uppercase;

        }

        .template2 .content-text {

            margin-left: 16px;

            font-size: 13px;

        }

        .template2 .edu-item {

            margin: 0 0 10px 16px;

            padding: 11px 14px;

            background: #f8fafc;

            border-left: 3px solid #64748b;

            border-radius: 5px;

        }

        .template2 .edu-item h3 {
            margin: 0 0 3px;
            font-size: 15px;
            line-height: 1.25;
        }

        .template2 .edu-item p {
            margin: 3px 0;
            line-height: 1.35;
        }

        .template2 .edu-meta {
            margin: 5px 0 0 !important;
            color: #475569;
            font-size: 12px;
            line-height: 1.3;
        }
/* =========================================================
   TEMPLATE 3 - ORBIT
   MODERN TECH / DEVELOPER
   ========================================================= */

.template3 {
    background: #ffffff;
    color: #10231e;
}


/* =========================
   HEADER
   ========================= */

.template3 .t3-top {
    padding: 34px 42px 28px;
    background: #09241d;
    color: #ffffff;
    border-bottom: 5px solid #10b981;
    position: relative;
}

.template3 .t3-top:after {
    content: "</>";
    position: absolute;
    right: 42px;
    top: 30px;
    color: #34d399;
    font-size: 28px;
    font-weight: 800;
    letter-spacing: 1px;
}

.template3 .t3-name {
    margin: 0;
    font-size: 38px;
    line-height: 1.05;
    letter-spacing: -1px;
    color: #ffffff;
}

.template3 .t3-role {
    margin-top: 7px;
    color: #6ee7b7;
    font-size: 12px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 2px;
}

.template3 .t3-contact {
    margin-top: 13px;
    color: #d1fae5;
    font-size: 12px;
}


/* =========================
   MAIN LAYOUT
   ========================= */

.template3 .t3-layout {
    display: grid;
    grid-template-columns: 1.45fr 0.85fr;
    gap: 28px;
    padding: 30px 42px 42px;
}


/* =========================
   SECTIONS
   ========================= */

.template3 .section {
    margin-bottom: 24px;
}

.template3 .section-title {
    display: flex;
    align-items: center;
    gap: 9px;

    margin: 0 0 10px;
    padding-bottom: 7px;

    color: #047857;
    border-bottom: 2px solid #d1fae5;

    font-size: 15px;
    font-weight: 800;
    letter-spacing: 1.3px;
    text-transform: uppercase;
}

.template3 .section-title:before {
    content: ">";
    color: #10b981;
    font-weight: 900;
}

.template3 p {
    margin: 5px 0;
    font-size: 12px;
    line-height: 1.45;
    white-space: pre-line;
}


/* =========================
   PROFILE
   ========================= */

.template3 .profile {
    padding: 14px 16px;

    background: #f0fdf4;
    border-left: 4px solid #10b981;
    border-radius: 0 7px 7px 0;
}


/* =========================
   EXPERIENCE / PROJECTS
   ========================= */

.template3 .work-item {
    display: grid;
    grid-template-columns: 18px 1fr;
    gap: 9px;
    margin-bottom: 11px;
}

.template3 .work-dot {
    width: 9px;
    height: 9px;
    margin-top: 5px;

    border-radius: 50%;
    background: #10b981;
    box-shadow: 0 0 0 4px #d1fae5;
}

.template3 .work-card {
    padding: 12px 14px;

    background: #ffffff;
    border: 1px solid #dbe7e2;
    border-radius: 7px;
}


/* =========================================================
   EDUCATION - COMPACT
   ========================================================= */

/* Two columns */
.template3 .education-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;

    gap: 8px;

    /* VERY IMPORTANT */
    grid-auto-rows: max-content;
    align-items: start;
}


/* Individual education card */
.template3 .education-item {
    display: block !important;

    box-sizing: border-box;

    width: 100%;

    /* REMOVE ALL STRETCHING */
    height: auto !important;
    min-height: 0 !important;
    max-height: none !important;

    align-self: start !important;

    /* Do NOT use flex here */
    flex: none !important;
    flex-grow: 0 !important;
    flex-shrink: 0 !important;

    padding: 10px 12px !important;
    margin: 0 0 8px 0 !important;

    background: #f8faf9;

    border: 1px solid #dbe7e2;
    border-top: 3px solid #10b981;

    border-radius: 6px;
}


/* Degree / School heading */
.template3 .education-item h3 {
    margin: 0 0 3px 0 !important;

    color: #064e3b;

    font-size: 13px;
    line-height: 1.25;
}


/* ALL paragraphs inside education */
.template3 .education-item p {
    display: block !important;

    margin: 2px 0 !important;
    padding: 0 !important;

    color: #334155;

    font-size: 11px;
    line-height: 1.3 !important;
}


/* College name */
.template3 .education-item p.college {
    margin: 0 0 5px 0 !important;
}


/* Year */
.template3 .education-item .year {
    display: block !important;

    margin: 0 0 3px 0 !important;
    padding: 0 !important;

    color: #047857;

    font-size: 11px;
    line-height: 1.3 !important;
}


/* Board */
.template3 .education-item .board {
    display: block !important;

    margin: 0 0 3px 0 !important;
    padding: 0 !important;

    color: #047857;

    font-size: 11px;
    line-height: 1.3 !important;
}


/* CGPA / Percentage */
.template3 .education-item .meta {
    display: block !important;

    margin: 0 !important;
    padding: 0 !important;

    color: #047857 !important;

    font-size: 11px !important;
    line-height: 1.3 !important;
}


/* Remove unnecessary spacing from anything inside meta */
.template3 .education-item .meta span {
    display: inline !important;

    margin: 0 8px 0 0 !important;
    padding: 0 !important;
}


/* If year/CGPA are direct divs */
.template3 .education-item > div {
    margin-top: 3px !important;
    margin-bottom: 3px !important;
    padding-top: 0 !important;
    padding-bottom: 0 !important;
}


/* Remove blank-looking vertical gaps */
.template3 .education-item br {
    line-height: 1 !important;
}


/* =========================
   RIGHT SIDE
   ========================= */

.template3 .side-card {
    margin-bottom: 18px;
    padding: 15px 17px;

    background: #f6faf8;
    border: 1px solid #dbe7e2;
    border-radius: 8px;
}

.template3 .side-card-title {
    margin: 0 0 9px;

    color: #047857;

    font-size: 11px;
    font-weight: 800;
    letter-spacing: 1.3px;
    text-transform: uppercase;
}

.template3 .skill-list {
    display: flex;
    flex-wrap: wrap;
    gap: 6px;
}

.template3 .skill-pill {
    display: inline-block;

    padding: 6px 9px;

    background: #ecfdf5;
    border: 1px solid #a7f3d0;
    border-radius: 14px;

    color: #065f46;

    font-size: 10px;
    font-weight: 700;
}

.template3 .side-card p {
    font-size: 11px;
}


/* =========================
   TECH NOTE
   ========================= */

.template3 .tech-note {
    padding: 13px 15px;

    background: #09241d;
    color: #d1fae5;

    border-radius: 8px;

    font-size: 11px;
    line-height: 1.55;
}


/* =========================================================
   MOBILE
   ========================================================= */

@media (max-width: 700px) {

    .template3 .t3-top {
        padding: 28px 25px 24px;
    }

    .template3 .t3-top:after {
        right: 25px;
        top: 25px;
    }

    .template3 .t3-name {
        font-size: 30px;
        padding-right: 55px;
    }

    .template3 .t3-layout {
        display: block;
        padding: 25px;
    }

    .template3 .education-grid {
        grid-template-columns: 1fr;
        gap: 8px;
    }

    .template3 .education-item {
        height: auto !important;
        min-height: 0 !important;
        max-height: none !important;
    }
}

        /* =========================

           TEMPLATE 4 - ATS MONO

           ========================= */

        .template4 .t4-header {

            padding: 50px 60px 34px;

            border-bottom: 3px solid #18181b;

        }

        .template4 .t4-header h1 {

            margin: 0;

            font-size: 45px;

            letter-spacing: -1.5px;

        }

        .template4 .role {

            margin-top: 8px;

            color: #52525b;

            font-size: 13px;

            font-weight: 700;

            letter-spacing: 2px;

            text-transform: uppercase;

        }

        .template4 .contact {

            margin-top: 15px;

            color: #52525b;

            font-size: 13px;

        }

        .template4 .content {

            padding: 37px 60px 50px;

        }

        .template4 .section {

            margin-bottom: 31px;

        }

        .template4 .heading {

            display: flex;

            align-items: center;

            gap: 11px;

            margin: 0 0 10px;

            font-size: 16px;

            letter-spacing: 1.5px;

            text-transform: uppercase;

        }

        .template4 .number {

            width: 27px;

            height: 27px;

            display: inline-flex;

            align-items: center;

            justify-content: center;

            border-radius: 50%;

            background: #18181b;

            color: #fff;

            font-size: 10px;

        }

        .template4 .line {

            height: 1px;

            background: #d4d4d8;

            margin-bottom: 15px;

        }

        .template4 .text {

            margin-left: 0;

            font-size: 13px;

        }

        .template4 .edu-grid {

            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 14px;

        }

        .template4 .edu-item {

            padding: 16px;

            background: #fafafa;

            border: 1px solid #d4d4d8;

            border-radius: 4px;

        }

        .template4 .edu-meta {

            padding-top: 8px;

            margin-top: 8px;

            border-top: 1px solid #e4e4e7;

            color: #52525b;

            font-size: 11px;

        }

        .template4 .additional {

            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 18px;

        }

        .template4 .additional-box {

            padding: 14px 16px;

            background: #fafafa;

            border-top: 2px solid #18181b;

        }

        .template4 .additional-box h3 {

            margin: 0 0 6px;

            font-size: 13px;

        }

        .template4 .additional-box p {

            font-size: 12px;

        }

        /* =========================

           TEMPLATE 5 - AURA

           Editorial Luxury

           ========================= */

        .template5 {

            background: #fbfaf7;

            color: #29231f;

            font-family: Georgia, "Times New Roman", serif;

        }

        .template5 .t5-header {

            display: grid;

            grid-template-columns: 1fr 160px;

            min-height: 165px;

            background: #29231f;

            color: #ffffff;

        }

        .template5 .t5-head-main {

            padding: 30px 38px 25px;

        }

        .template5 .t5-eyebrow {

            margin-bottom: 13px;

            color: #d6b36a;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 3px;

            text-transform: uppercase;

        }

        .template5 .t5-header h1 {

            margin: 0;

            font-size: 46px;

            line-height: 1.05;

            font-weight: normal;

            letter-spacing: -1px;

        }

        .template5 .t5-role {

            margin-top: 10px;

            color: #ded7cf;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 11px;

            letter-spacing: 1.8px;

            text-transform: uppercase;

        }

        .template5 .t5-contact {

            margin-top: 16px;

            color: #cfc6bd;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 11px;

        }

        .template5 .t5-monogram {

            display: flex;

            align-items: center;

            justify-content: center;

            margin: 22px;

            border: 1px solid #80683e;

            background: #332d27;

            color: #d6b36a;

            font-size: 42px;

            font-weight: normal;

            letter-spacing: 1px;

        }

        .template5 .t5-body {

            display: grid;

            grid-template-columns: 205px 1fr;

            gap: 0;

        }

        .template5 .t5-sidebar {

            padding: 24px 20px;

            background: #eee9e1;

            border-right: 1px solid #d8d0c6;

        }

        .template5 .t5-side-section {

            margin-bottom: 18px;

        }

        .template5 .t5-side-title {

            margin: 0 0 9px;

            color: #80612d;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 1.6px;

            text-transform: uppercase;

        }

        .template5 .t5-sidebar p {

            margin: 0;

            color: #514940;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 10px;

            line-height: 1.65;

            white-space: pre-line;

        }

        .template5 .t5-tags {

            display: flex;

            flex-wrap: wrap;

            gap: 5px;

        }

        .template5 .t5-tag {

            padding: 5px 7px;

            border: 1px solid #cdbd9f;

            border-radius: 2px;

            color: #66502a;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 9px;

            background: #f7f3ed;

        }

        .template5 .t5-main {

            padding: 24px 30px 30px;

            background: #fbfaf7;

        }

        .template5 .t5-section {

            margin-bottom: 18px;

        }

        .template5 .t5-section-heading {

            display: flex;

            align-items: baseline;

            gap: 8px;

            margin: 0 0 7px;

            padding-bottom: 5px;

            border-bottom: 1px solid #cfc7bc;

            color: #29231f;

            font-size: 18px;

            font-weight: normal;

        }

        .template5 .t5-section-number {

            color: #b18a49;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 9px;

            font-weight: 800;

            letter-spacing: 1px;

        }

        .template5 .t5-main p {

            margin: 3px 0;

            font-size: 12px;

            line-height: 1.4;

            white-space: pre-line;

        }

        .template5 .t5-profile {

            padding: 10px 13px;

            border-left: 3px solid #b18a49;

            background: #f1ede6;

        }

        .template5 .t5-work {

            position: relative;

            padding: 3px 0 3px 15px;

            border-left: 1px solid #cdbd9f;

        }

        .template5 .t5-work:before {

            content: *"";

            position: absolute;

            left: -4px;

            top: 11px;

            width: 7px;

            height: 7px;

            border-radius: 50%;

            background: #b18a49;

        }

        .template5 .t5-education {

            position: relative;

            margin-bottom: 8px;

            padding: 9px 12px 8px 14px;

            background: #ffffff;

            border: 1px solid #ded7cf;

            border-left: 3px solid #b18a49;

        }

        .template5 .t5-education h3 {

            margin: 0 0 3px;

            color: #29231f;

            font-size: 13px;

            line-height: 1.3;

        }

        .template5 .t5-education p {

            margin: 2px 0;

            padding: 0;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 10px;

            line-height: 1.35;

            color: #5b5148;

        }

        .template5 .t5-meta {

            margin: 5px 0 0 !important;

            padding: 0 !important;

            color: #80612d !important;

            line-height: 1.35 !important;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 10px;

        }

        /* Degree details: fixed columns keep Year and CGPA perfectly aligned */

        .template5 .degree-meta {

            display: grid;

            grid-template-columns: 82px 1fr;

            column-gap: 10px;

            align-items: baseline;

        }

        /* School details: Board, Year and Percentage stay on one aligned row */

        .template5 .school-meta {

            display: grid;

            grid-template-columns: 95px 78px 1fr;

            column-gap: 10px;

            align-items: baseline;

        }

        .template5 .t5-meta span {

            display: block;

            margin: 0;

            white-space: nowrap;

        }

        .template5 .t5-quote {

            margin-top: 2px;

            padding: 9px 12px;

            background: #29231f;

            color: #e9dfd2;

            font-family: Georgia, "Times New Roman", serif;

            font-size: 12px;

            line-height: 1.5;

        }

        @media (max-width: 700px) {

            .template5 .t5-header {

                grid-template-columns: 1fr;

            }

            .template5 .t5-head-main {

                padding: 30px 25px;

            }

            .template5 .t5-header h1 {

                font-size: 35px;

            }

            .template5 .t5-monogram {

                display: none;

            }

            .template5 .t5-body {

                display: block;

            }

            .template5 .t5-sidebar {

                padding: 22px 25px;

                border-right: 0;

                border-bottom: 1px solid #d8d0c6;

            }

            .template5 .t5-main {

                padding: 25px;

            }

        }

        /* =========================

           TEMPLATE 6 - SIGNATURE

           Geometric Modern Graduate

           ========================= */

        .template6 {

            background: #ffffff;

            border: 1px solid #d9e1e8;

        }

        .template6 .t6-header {

            position: relative;

            display: grid;

            grid-template-columns: 1fr 105px;

            align-items: center;

            min-height: 190px;

            padding: 38px 48px 34px;

            background: linear-gradient(135deg, #f3f7fa 0%, #eef3f7 72%, #dfe9f0 72%, #dfe9f0 100%);

            border-bottom: 3px solid #0f172a;

            overflow: hidden;

        }

        .template6 .t6-header:after {

            content: *"";

            position: absolute;

            left: 0;

            bottom: 0;

            width: 34%;

            height: 4px;

            background: #0f172a;

        }

        .template6 .t6-header h1 {

            margin: 0;

            font-size: 43px;

            letter-spacing: -1.8px;

            color: #0b1324;

        }

        .template6 .role {

            margin-top: 8px;

            color: #334155;

            font-size: 12px;

            font-weight: 800;

            letter-spacing: 2px;

            text-transform: uppercase;

        }

        .template6 .contact {

            margin-top: 13px;

            color: #475569;

            font-size: 12px;

        }

        .template6 .mark {

            position: relative;

            width: 82px;

            height: 82px;

            margin-left: auto;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #0f172a;

            transform: rotate(45deg);

            box-shadow: 9px 9px 0 #cbd8e2;

        }

        .template6 .mark:before {

            content: *"";

            position: absolute;

            width: 58px;

            height: 58px;

            border: 1px solid #94a3b8;

        }

        .template6 .mark span {

            position: relative;

            z-index: 1;

            color: #ffffff;

            font-size: 21px;

            font-weight: 800;

            letter-spacing: 1px;

            transform: rotate(-45deg);

        }

        .template6 .content {

            padding: 38px 48px 48px;

        }

        .template6 .section {

            margin-bottom: 28px;

        }

        .template6 .title {

            display: flex;

            align-items: center;

            gap: 10px;

            margin: 0 0 12px;

            padding-bottom: 8px;

            color: #0f172a;

            font-size: 16px;

            font-weight: 800;

            letter-spacing: 1.4px;

            text-transform: uppercase;

            border-bottom: 1px solid #cbd5e1;

        }

        .template6 .title:before {

            content: *"";

            width: 9px;

            height: 9px;

            flex: 0 0 9px;

            background: #0f172a;

            transform: rotate(45deg);

        }

        .template6 .section > p {

            margin: 0;

            line-height: 1.6;

        }

        .template6 .achievement {

            position: relative;

            padding: 14px 17px;

            background: #f8fafc;

            border: 1px solid #e2e8f0;

            border-left: 4px solid #0f172a;

            border-radius: 0 7px 7px 0;

        }

        .template6 .achievement:before {

            content: *"";

            position: absolute;

            left: -8px;

            top: 50%;

            width: 7px;

            height: 7px;

            background: #ffffff;

            border: 2px solid #0f172a;

            border-radius: 50%;

            transform: translateY(-50%);

        }

        .template6 .achievement p {

            margin: 0;

            line-height: 1.5;

        }

        .template6 .edu-grid {

            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 12px;

        }

        .template6 .edu-item {

            position: relative;

            padding: 14px 15px 13px;

            background: #f8fafc;

            border: 1px solid #dbe3ea;

            border-radius: 7px;

            border-top: 3px solid #0f172a;

        }

        .template6 .edu-item h3 {

            margin: 0 0 5px;

            font-size: 15px;

        }

        .template6 .edu-item p {

            margin: 4px 0;

            line-height: 1.4;

            font-size: 13px;

        }


        /* FINAL TEMPLATE 3 EDUCATION SPACING FIX */
        .template3 .education-grid {
            display: grid !important;
            grid-template-columns: 1fr 1fr !important;
            gap: 10px !important;
            grid-auto-rows: auto !important;
            align-items: start !important;
        }

        .template3 .education-item {
            height: fit-content !important;
            min-height: 0 !important;
            padding: 11px 12px !important;
            margin: 0 !important;
            display: block !important;
            align-self: start !important;
            justify-self: stretch !important;
        }

        .template3 .education-item h3 {
            margin: 0 0 3px !important;
            line-height: 1.25 !important;
        }

        .template3 .education-item p {
            margin: 2px 0 !important;
            line-height: 1.3 !important;
        }

        .template3 .education-item .education-meta {
            display: flex !important;
            flex-wrap: wrap !important;
            align-items: baseline !important;
            justify-content: flex-start !important;
            gap: 0 12px !important;
            margin: 6px 0 0 !important;
            padding: 0 !important;
            line-height: 1.3 !important;
            white-space: normal !important;
            position: static !important;
        }

        .template3 .education-item .education-meta br {
            display: none !important;
        }

        .template3 .education-item .education-meta span {
            display: inline !important;
            margin: 0 !important;
            padding: 0 !important;
        }

        @media print {

            @page {

                margin: 0;

            }

            html,

            body {

                padding: 0;

                margin: 0;

                background: #fff;

            }

            /*

             * Keep all template colours/backgrounds when printing

             * or using the browser's Save as PDF option.

             */

            .resume,

            .resume * {

                -webkit-print-color-adjust: exact !important;

                print-color-adjust: exact !important;

            }

            .resume {

                width: 100%;

                max-width: none;

                min-height: auto;

                box-shadow: none;

            }

            /* Preserve the dark / coloured areas in PDF */

            .template2 .sidebar,

            .template3 .t3-top,

            .template3 .tech-note,

            .template5 .t5-header,

            .template5 .t5-quote,

            .template6 .mark {

                -webkit-print-color-adjust: exact !important;

                print-color-adjust: exact !important;

            }

            .buttons {

                display: none;

            }

        }

        @media (max-width: 700px) {

            body {

                padding: 10px;

            }

            .template1 .t1-grid,

            .template2 {

                display: block;

            }

            .template1 .side {

                border-right: 0;

                border-bottom: 1px solid #e5e7eb;

            }

            .template1 .main,

            .template1 .side,

            .template2 .content,

            .template3 .content,

            .template4 .content,

            .template5 .content,

            .template6 .content {

                padding: 28px 25px;

            }

            .template1 .t1-header,

            .template3 .t3-header,

            .template4 .t4-header,

            .template5 .t5-header,

            .template6 .t6-header {

                padding: 32px 25px;

            }

            .template1 .t1-header h1,

            .template3 .t3-header h1,

            .template4 .t4-header h1,

            .template5 .t5-header h1,

            .template6 .t6-header h1 {

                font-size: 32px;

            }

            .template2 .sidebar {

                padding: 30px 25px;

            }

            .template2 .sidebar h1 {

                font-size: 31px;

            }

            .template4 .edu-grid,

            .template4 .additional,

            .template6 .edu-grid {

                grid-template-columns: 1fr;

            }

            .template6 .t6-header {

                grid-template-columns: 1fr 72px;

                min-height: 155px;

                padding: 30px 25px;

            }

            .template6 .mark {

                width: 58px;

                height: 58px;

                box-shadow: 6px 6px 0 #cbd8e2;

            }

            .template6 .mark:before {

                width: 40px;

                height: 40px;

            }

            .template6 .mark span {

                font-size: 16px;

            }

        }

    </style>

</head>

<body>

<% if (rs != null) { %>

<% if ("template1".equals(templateId)) { %>

<div class="resume template1">

    <div class="t1-header">

        <h1><%= esc(fullName) %></h1>

        <div class="role">Professional Resume</div>

        <div class="contact">

            <%= esc(email) %>

            <% if (!phone.isEmpty()) { %>

                &nbsp; | &nbsp; <%= esc(phone) %>

            <% } %>

            <% if (!address.isEmpty()) { %>

                &nbsp; | &nbsp; <%= esc(address) %>

            <% } %>

        </div>

    </div>

    <div class="t1-divider"></div>

    <div class="resume-content">

        <% if (!careerObjective.isEmpty()) { %>

        <div class="section profile-box">

            <div class="title">Profile</div>

            <p><%= esc(careerObjective) %></p>

        </div>

        <% } %>



        <% if (!experience.isEmpty()) { %>

        <div class="section">

            <div class="title">Experience</div>

            <p><%= esc(experience) %></p>

        </div>

        <% } %>



        <% if (!projects.isEmpty()) { %>

        <div class="section">

            <div class="title">Projects</div>

            <p><%= esc(projects) %></p>

        </div>

        <% } %>



        <div class="section">

            <div class="title">Education</div>

            <% if (!bachelorDegree.isEmpty()) { %>

            <div class="education-item">

                <h3><%= esc(bachelorDegree) %></h3>

                <% if (!bachelorCollege.isEmpty()) { %>

                <p><%= esc(bachelorCollege) %></p>

                <% } %>

                <p class="education-meta">

                    <% if (!bachelorYear.isEmpty()) { %>

                        Year: <%= esc(bachelorYear) %>

                    <% } %>

                    <% if (!bachelorCgpa.isEmpty()) { %>

                        &nbsp; | &nbsp; CGPA: <%= esc(bachelorCgpa) %>

                    <% } %>

                </p>

            </div>

            <% } %>



            <% if (!masterDegree.isEmpty()) { %>

            <div class="education-item">

                <h3><%= esc(masterDegree) %></h3>

                <% if (!masterCollege.isEmpty()) { %>

                <p><%= esc(masterCollege) %></p>

                <% } %>

                <p class="education-meta">

                    <% if (!masterYear.isEmpty()) { %>

                        Year: <%= esc(masterYear) %>

                    <% } %>

                    <% if (!masterCgpa.isEmpty()) { %>

                        &nbsp; | &nbsp; CGPA: <%= esc(masterCgpa) %>

                    <% } %>

                </p>

            </div>

            <% } %>



            <% if (!intermediateSchool.isEmpty() || !intermediatePercentage.isEmpty()) { %>

            <div class="education-item">

                <h3>Intermediate / 12th</h3>

                <% if (!intermediateSchool.isEmpty()) { %>

                <p><%= esc(intermediateSchool) %></p>

                <% } %>

                <p class="education-meta">

                    <% if (!intermediateBoard.isEmpty()) { %>

                        Board: <%= esc(intermediateBoard) %>

                    <% } %>

                    <% if (!intermediateYear.isEmpty()) { %>

                        &nbsp; | &nbsp; Year: <%= esc(intermediateYear) %>

                    <% } %>

                    <% if (!intermediatePercentage.isEmpty()) { %>

                        &nbsp; | &nbsp; Percentage: <%= esc(intermediatePercentage) %>

                    <% } %>

                </p>

            </div>

            <% } %>



            <% if (!highschoolSchool.isEmpty() || !highschoolPercentage.isEmpty()) { %>

            <div class="education-item">

                <h3>High School / 10th</h3>

                <% if (!highschoolSchool.isEmpty()) { %>

                <p><%= esc(highschoolSchool) %></p>

                <% } %>

                <p class="education-meta">

                    <% if (!highschoolBoard.isEmpty()) { %>

                        Board: <%= esc(highschoolBoard) %>

                    <% } %>

                    <% if (!highschoolYear.isEmpty()) { %>

                        &nbsp; | &nbsp; Year: <%= esc(highschoolYear) %>

                    <% } %>

                    <% if (!highschoolPercentage.isEmpty()) { %>

                        &nbsp; | &nbsp; Percentage: <%= esc(highschoolPercentage) %>

                    <% } %>

                </p>

            </div>

            <% } %>

        </div>



        <% if (!skills.isEmpty()) { %>

        <div class="section">

            <div class="title">Skills</div>

            <p><%= esc(skills) %></p>

        </div>

        <% } %>



        <% if (!certifications.isEmpty()) { %>

        <div class="section">

            <div class="title">Certifications</div>

            <p><%= esc(certifications) %></p>

        </div>

        <% } %>



        <% if (!languages.isEmpty()) { %>

        <div class="section">

            <div class="title">Languages</div>

            <p><%= esc(languages) %></p>

        </div>

        <% } %>



        <% if (!hobbies.isEmpty()) { %>

        <div class="section">

            <div class="title">Interests</div>

            <p><%= esc(hobbies) %></p>

        </div>

        <% } %>

    </div>

</div>

<% } else if ("template2".equals(templateId)) { %>

<div class="resume template2">

    <aside class="sidebar">

        <h1><%= esc(fullName) %></h1>

        <div class="small-role">Executive Professional Profile</div>

        <div class="side-section">

            <div class="side-title">Contact</div>

            <div class="side-text">

                <%= esc(email) %>

                <% if (!phone.isEmpty()) { %><br><%= esc(phone) %><% } %>

                <% if (!address.isEmpty()) { %><br><%= esc(address) %><% } %>

            </div>

        </div>

        <% if (!skills.isEmpty()) { %>

        <div class="side-section">

            <div class="side-title">Core Skills</div>

            <div class="side-text"><%= esc(skills) %></div>

        </div>

        <% } %>

        <% if (!certifications.isEmpty()) { %>

        <div class="side-section">

            <div class="side-title">Certifications</div>

            <div class="side-text"><%= esc(certifications) %></div>

        </div>

        <% } %>

        <% if (!languages.isEmpty()) { %>

        <div class="side-section">

            <div class="side-title">Languages</div>

            <div class="side-text"><%= esc(languages) %></div>

        </div>

        <% } %>

        <% if (!hobbies.isEmpty()) { %>

        <div class="side-section">

            <div class="side-title">Interests</div>

            <div class="side-text"><%= esc(hobbies) %></div>

        </div>

        <% } %>

    </aside>

    <main class="content">

        <% if (!careerObjective.isEmpty()) { %>

        <section class="content-section">

            <h2 class="content-title">Professional Summary</h2>

            <div class="content-text"><p><%= esc(careerObjective) %></p></div>

        </section>

        <% } %>

        <% if (!experience.isEmpty()) { %>

        <section class="content-section">

            <h2 class="content-title">Experience</h2>

            <div class="content-text"><p><%= esc(experience) %></p></div>

        </section>

        <% } %>

        <% if (!projects.isEmpty()) { %>

        <section class="content-section">

            <h2 class="content-title">Projects</h2>

            <div class="content-text"><p><%= esc(projects) %></p></div>

        </section>

        <% } %>

        <section class="content-section">

            <h2 class="content-title">Education</h2>

            <% if (!bachelorDegree.isEmpty()) { %>

            <div class="edu-item">

                <h3><%= esc(bachelorDegree) %></h3>

                <p><%= esc(bachelorCollege) %></p>

                <p class="edu-meta">

                    <% if (!bachelorYear.isEmpty()) { %>Year: <%= esc(bachelorYear) %><% } %>

                    <% if (!bachelorCgpa.isEmpty()) { %> &nbsp; | &nbsp; CGPA: <%= esc(bachelorCgpa) %><% } %>

                </p>

            </div>

            <% } %>

            <% if (!masterDegree.isEmpty()) { %>

            <div class="edu-item">

                <h3><%= esc(masterDegree) %></h3>

                <p><%= esc(masterCollege) %></p>

                <p class="edu-meta">

                    <% if (!masterYear.isEmpty()) { %>Year: <%= esc(masterYear) %><% } %>

                    <% if (!masterCgpa.isEmpty()) { %> &nbsp; | &nbsp; CGPA: <%= esc(masterCgpa) %><% } %>

                </p>

            </div>

            <% } %>

            <% if (!intermediateSchool.isEmpty() || !intermediatePercentage.isEmpty()) { %>

            <div class="edu-item">

                <h3>Intermediate / 12th</h3>

                <p><%= esc(intermediateSchool) %></p>

                <p class="edu-meta">

                    <% if (!intermediateBoard.isEmpty()) { %>Board: <%= esc(intermediateBoard) %><% } %>

                    <% if (!intermediateYear.isEmpty()) { %> &nbsp; | &nbsp; Year: <%= esc(intermediateYear) %><% } %>

                    <% if (!intermediatePercentage.isEmpty()) { %> &nbsp; | &nbsp; Percentage: <%= esc(intermediatePercentage) %><% } %>

                </p>

            </div>

            <% } %>

            <% if (!highschoolSchool.isEmpty() || !highschoolPercentage.isEmpty()) { %>

            <div class="edu-item">

                <h3>High School / 10th</h3>

                <p><%= esc(highschoolSchool) %></p>

                <p class="edu-meta">

                    <% if (!highschoolBoard.isEmpty()) { %>Board: <%= esc(highschoolBoard) %><% } %>

                    <% if (!highschoolYear.isEmpty()) { %> &nbsp; | &nbsp; Year: <%= esc(highschoolYear) %><% } %>

                    <% if (!highschoolPercentage.isEmpty()) { %> &nbsp; | &nbsp; Percentage: <%= esc(highschoolPercentage) %><% } %>

                </p>

            </div>

            <% } %>

        </section>

    </main>

</div>

<% } else if ("template3".equals(templateId)) { %>

<div class="resume template3">

    <header class="t3-top">

        <h1 class="t3-name"><%= esc(fullName) %></h1>

        <div class="t3-role">Technology Professional</div>

        <div class="t3-contact">

            <%= esc(email) %>

            <% if (!phone.isEmpty()) { %>

                &nbsp; | &nbsp; <%= esc(phone) %>

            <% } %>

            <% if (!address.isEmpty()) { %>

                &nbsp; | &nbsp; <%= esc(address) %>

            <% } %>

        </div>

    </header>



    <div class="t3-layout">

        <main>

            <% if (!careerObjective.isEmpty()) { %>

            <section class="section">

                <div class="section-title">Profile</div>

                <div class="profile">

                    <p><%= esc(careerObjective) %></p>

                </div>

            </section>

            <% } %>



            <% if (!experience.isEmpty()) { %>

            <section class="section">

                <div class="section-title">Experience</div>

                <div class="work-item">

                    <div class="work-dot"></div>

                    <div class="work-card">

                        <p><%= esc(experience) %></p>

                    </div>

                </div>

            </section>

            <% } %>



            <% if (!projects.isEmpty()) { %>

            <section class="section">

                <div class="section-title">Projects</div>

                <div class="work-item">

                    <div class="work-dot"></div>

                    <div class="work-card">

                        <p><%= esc(projects) %></p>

                    </div>

                </div>

            </section>

            <% } %>



            <section class="section">

                <div class="section-title">Education</div>

                <div class="education-grid">

                    <% if (!bachelorDegree.isEmpty()) { %>

                    <div class="education-item">

                        <h3><%= esc(bachelorDegree) %></h3>

                        <% if (!bachelorCollege.isEmpty()) { %>

                        <p><%= esc(bachelorCollege) %></p>

                        <% } %>

                        <p class="meta">

                            <% if (!bachelorYear.isEmpty()) { %>

                                Year: <%= esc(bachelorYear) %>

                            <% } %>

                            <% if (!bachelorCgpa.isEmpty()) { %>

                                &nbsp; | &nbsp; CGPA: <%= esc(bachelorCgpa) %>

                            <% } %>

                        </p>

                    </div>

                    <% } %>



                    <% if (!masterDegree.isEmpty()) { %>

                    <div class="education-item">

                        <h3><%= esc(masterDegree) %></h3>

                        <% if (!masterCollege.isEmpty()) { %>

                        <p><%= esc(masterCollege) %></p>

                        <% } %>

                        <p class="meta">

                            <% if (!masterYear.isEmpty()) { %>

                                Year: <%= esc(masterYear) %>

                            <% } %>

                            <% if (!masterCgpa.isEmpty()) { %>

                                &nbsp; | &nbsp; CGPA: <%= esc(masterCgpa) %>

                            <% } %>

                        </p>

                    </div>

                    <% } %>



                    <% if (!intermediateSchool.isEmpty() || !intermediatePercentage.isEmpty()) { %>

                    <div class="education-item">

                        <h3>Intermediate / 12th</h3>

                        <% if (!intermediateSchool.isEmpty()) { %>

                        <p><%= esc(intermediateSchool) %></p>

                        <% } %>

                        <p class="meta">

                            <% if (!intermediateBoard.isEmpty()) { %>

                                Board: <%= esc(intermediateBoard) %>

                            <% } %>

                            <% if (!intermediateYear.isEmpty()) { %>

                                &nbsp; | &nbsp; Year: <%= esc(intermediateYear) %>

                            <% } %>

                            <% if (!intermediatePercentage.isEmpty()) { %>

                                &nbsp; | &nbsp; Percentage: <%= esc(intermediatePercentage) %>

                            <% } %>

                        </p>

                    </div>

                    <% } %>



                    <% if (!highschoolSchool.isEmpty() || !highschoolPercentage.isEmpty()) { %>

                    <div class="education-item">

                        <h3>High School / 10th</h3>

                        <% if (!highschoolSchool.isEmpty()) { %>

                        <p><%= esc(highschoolSchool) %></p>

                        <% } %>

                        <p class="meta">

                            <% if (!highschoolBoard.isEmpty()) { %>

                                Board: <%= esc(highschoolBoard) %>

                            <% } %>

                            <% if (!highschoolYear.isEmpty()) { %>

                                &nbsp; | &nbsp; Year: <%= esc(highschoolYear) %>

                            <% } %>

                            <% if (!highschoolPercentage.isEmpty()) { %>

                                &nbsp; | &nbsp; Percentage: <%= esc(highschoolPercentage) %>

                            <% } %>

                        </p>

                    </div>

                    <% } %>

                </div>

            </section>

        </main>



        <aside>

            <% if (!skills.isEmpty()) { %>

            <div class="side-card">

                <div class="side-card-title">Technical Skills</div>

                <div class="skill-list">

                    <span class="skill-pill"><%= esc(skills) %></span>

                </div>

            </div>

            <% } %>



            <% if (!certifications.isEmpty()) { %>

            <div class="side-card">

                <div class="side-card-title">Certifications</div>

                <p><%= esc(certifications) %></p>

            </div>

            <% } %>



            <% if (!languages.isEmpty()) { %>

            <div class="side-card">

                <div class="side-card-title">Languages</div>

                <p><%= esc(languages) %></p>

            </div>

            <% } %>



            <% if (!hobbies.isEmpty()) { %>

            <div class="side-card">

                <div class="side-card-title">Interests</div>

                <p><%= esc(hobbies) %></p>

            </div>

            <% } %>



            <div class="tech-note">

                <strong>TECH PROFILE</strong><br>

                Focused on building practical solutions, learning new technologies and solving real-world problems.

            </div>

        </aside>

    </div>

</div>

<% } else if ("template4".equals(templateId)) { %>

<div class="resume template4">

    <header class="t4-header">

        <h1><%= esc(fullName) %></h1>

        <div class="role">Professional Resume</div>

        <div class="contact">

            <%= esc(email) %>

            <% if (!phone.isEmpty()) { %> <span class="separator">|</span> <%= esc(phone) %><% } %>

            <% if (!address.isEmpty()) { %> <span class="separator">|</span> <%= esc(address) %><% } %>

        </div>

    </header>

    <main class="content">

        <% if (!careerObjective.isEmpty()) { %>

        <section class="section">

            <h2 class="heading"><span class="number">01</span> Profile</h2>

            <div class="line"></div>

            <div class="text"><%= esc(careerObjective) %></div>

        </section>

        <% } %>

        <% if (!experience.isEmpty()) { %>

        <section class="section">

            <h2 class="heading"><span class="number">02</span> Experience</h2>

            <div class="line"></div>

            <div class="text"><%= esc(experience) %></div>

        </section>

        <% } %>

        <% if (!projects.isEmpty()) { %>

        <section class="section">

            <h2 class="heading"><span class="number">03</span> Projects</h2>

            <div class="line"></div>

            <div class="text"><%= esc(projects) %></div>

        </section>

        <% } %>

        <section class="section">

            <h2 class="heading"><span class="number">04</span> Education</h2>

            <div class="line"></div>

            <div class="edu-grid">

                <% if (!bachelorDegree.isEmpty()) { %>

                <div class="edu-item">

                    <h3><%= esc(bachelorDegree) %></h3>

                    <p><%= esc(bachelorCollege) %></p>

                    <div class="edu-meta">

                        Year: <%= esc(bachelorYear) %>

                        <% if (!bachelorCgpa.isEmpty()) { %> &nbsp; | &nbsp; CGPA: <%= esc(bachelorCgpa) %><% } %>

                    </div>

                </div>

                <% } %>

                <% if (!masterDegree.isEmpty()) { %>

                <div class="edu-item">

                    <h3><%= esc(masterDegree) %></h3>

                    <p><%= esc(masterCollege) %></p>

                    <div class="edu-meta">

                        Year: <%= esc(masterYear) %>

                        <% if (!masterCgpa.isEmpty()) { %> &nbsp; | &nbsp; CGPA: <%= esc(masterCgpa) %><% } %>

                    </div>

                </div>

                <% } %>

                <% if (!intermediateSchool.isEmpty() || !intermediatePercentage.isEmpty()) { %>

                <div class="edu-item">

                    <h3>Intermediate / 12th</h3>

                    <p><%= esc(intermediateSchool) %></p>

                    <div class="edu-meta">

                        Board: <%= esc(intermediateBoard) %>

                        &nbsp; | &nbsp; Year: <%= esc(intermediateYear) %>

                        &nbsp; | &nbsp; Percentage: <%= esc(intermediatePercentage) %>

                    </div>

                </div>

                <% } %>

                <% if (!highschoolSchool.isEmpty() || !highschoolPercentage.isEmpty()) { %>

                <div class="edu-item">

                    <h3>High School / 10th</h3>

                    <p><%= esc(highschoolSchool) %></p>

                    <div class="edu-meta">

                        Board: <%= esc(highschoolBoard) %>

                        &nbsp; | &nbsp; Year: <%= esc(highschoolYear) %>

                        &nbsp; | &nbsp; Percentage: <%= esc(highschoolPercentage) %>

                    </div>

                </div>

                <% } %>

            </div>

        </section>

        <% if (!skills.isEmpty() || !certifications.isEmpty() || !languages.isEmpty() || !hobbies.isEmpty()) { %>

        <section class="section">

            <h2 class="heading"><span class="number">05</span> Additional Information</h2>

            <div class="line"></div>

            <div class="additional">

                <% if (!skills.isEmpty()) { %>

                <div class="additional-box">

                    <h3>Skills</h3>

                    <p><%= esc(skills) %></p>

                </div>

                <% } %>

                <% if (!certifications.isEmpty()) { %>

                <div class="additional-box">

                    <h3>Certifications</h3>

                    <p><%= esc(certifications) %></p>

                </div>

                <% } %>

                <% if (!languages.isEmpty()) { %>

                <div class="additional-box">

                    <h3>Languages</h3>

                    <p><%= esc(languages) %></p>

                </div>

                <% } %>

                <% if (!hobbies.isEmpty()) { %>

                <div class="additional-box">

                    <h3>Interests</h3>

                    <p><%= esc(hobbies) %></p>

                </div>

                <% } %>

            </div>

        </section>

        <% } %>

    </main>

</div>

<% } else if ("template5".equals(templateId)) { %>

<div class="resume template5">

    <header class="t5-header">

        <div class="t5-head-main">

            <div class="t5-eyebrow">CURATED PROFESSIONAL PROFILE</div>

            <h1><%= esc(fullName) %></h1>

            <div class="t5-role">Elegant Professional</div>

            <div class="t5-contact">

                <%= esc(email) %>

                <% if (!phone.isEmpty()) { %>

                    &nbsp; | &nbsp; <%= esc(phone) %>

                <% } %>

                <% if (!address.isEmpty()) { %>

                    &nbsp; | &nbsp; <%= esc(address) %>

                <% } %>

            </div>

        </div>

        <div class="t5-monogram">

            <%

                String initials = "";

                if (!fullName.isEmpty()) {

                    String[] nameParts = fullName.trim().split("\\s+");

                    initials = nameParts[0].substring(0, 1).toUpperCase();

                    if (nameParts.length > 1) {

                        initials += nameParts[nameParts.length - 1].substring(0, 1).toUpperCase();

                    }

                }

            %>

            <%= esc(initials) %>

        </div>

    </header>



    <div class="t5-body">

        <aside class="t5-sidebar">

            <% if (!skills.isEmpty()) { %>

            <div class="t5-side-section">

                <div class="t5-side-title">Expertise</div>

                <div class="t5-tags">

                    <%

                        String[] skillParts = skills.split(",");

                        for (String skill : skillParts) {

                            if (!skill.trim().isEmpty()) {

                    %>

                        <span class="t5-tag"><%= esc(skill) %></span>

                    <%

                            }

                        }

                    %>

                </div>

            </div>

            <% } %>



            <% if (!certifications.isEmpty()) { %>

            <div class="t5-side-section">

                <div class="t5-side-title">Certifications</div>

                <p><%= esc(certifications) %></p>

            </div>

            <% } %>



            <% if (!languages.isEmpty()) { %>

            <div class="t5-side-section">

                <div class="t5-side-title">Languages</div>

                <p><%= esc(languages) %></p>

            </div>

            <% } %>



            <% if (!hobbies.isEmpty()) { %>

            <div class="t5-side-section">

                <div class="t5-side-title">Interests</div>

                <p><%= esc(hobbies) %></p>

            </div>

            <% } %>

        </aside>



        <main class="t5-main">

            <% if (!careerObjective.isEmpty()) { %>

            <section class="t5-section">

                <h2 class="t5-section-heading">

                    <span class="t5-section-number">01</span>

                    Profile

                </h2>

                <div class="t5-profile">

                    <p><%= esc(careerObjective) %></p>

                </div>

            </section>

            <% } %>



            <% if (!experience.isEmpty()) { %>

            <section class="t5-section">

                <h2 class="t5-section-heading">

                    <span class="t5-section-number">02</span>

                    Experience

                </h2>

                <div class="t5-work">

                    <p><%= esc(experience) %></p>

                </div>

            </section>

            <% } %>



            <% if (!projects.isEmpty()) { %>

            <section class="t5-section">

                <h2 class="t5-section-heading">

                    <span class="t5-section-number">03</span>

                    Selected Work

                </h2>

                <div class="t5-work">

                    <p><%= esc(projects) %></p>

                </div>

            </section>

            <% } %>



            <section class="t5-section">

                <h2 class="t5-section-heading">

                    <span class="t5-section-number">04</span>

                    Education

                </h2>



                <% if (!bachelorDegree.isEmpty()) { %>

                <div class="t5-education">

                    <h3><%= esc(bachelorDegree) %></h3>

                    <% if (!bachelorCollege.isEmpty()) { %>

                    <p><%= esc(bachelorCollege) %></p>

                    <% } %>

                    <div class="t5-meta degree-meta">

                        <% if (!bachelorYear.isEmpty()) { %>

                            <span>Year: <%= esc(bachelorYear) %></span>

                        <% } %>

                        <% if (!bachelorCgpa.isEmpty()) { %>

                            <span>CGPA: <%= esc(bachelorCgpa) %></span>

                        <% } %>

                    </div>

                </div>

                <% } %>



                <% if (!masterDegree.isEmpty()) { %>

                <div class="t5-education">

                    <h3><%= esc(masterDegree) %></h3>

                    <% if (!masterCollege.isEmpty()) { %>

                    <p><%= esc(masterCollege) %></p>

                    <% } %>

                    <div class="t5-meta degree-meta">

                        <% if (!masterYear.isEmpty()) { %>

                            <span>Year: <%= esc(masterYear) %></span>

                        <% } %>

                        <% if (!masterCgpa.isEmpty()) { %>

                            <span>CGPA: <%= esc(masterCgpa) %></span>

                        <% } %>

                    </div>

                </div>

                <% } %>



                <% if (!intermediateSchool.isEmpty() || !intermediatePercentage.isEmpty()) { %>

                <div class="t5-education">

                    <h3>Intermediate / 12th</h3>

                    <% if (!intermediateSchool.isEmpty()) { %>

                    <p><%= esc(intermediateSchool) %></p>

                    <% } %>

                    <div class="t5-meta school-meta">

                        <% if (!intermediateBoard.isEmpty()) { %>

                            <span>Board: <%= esc(intermediateBoard) %></span>

                        <% } %>

                        <% if (!intermediateYear.isEmpty()) { %>

                            <span>Year: <%= esc(intermediateYear) %></span>

                        <% } %>

                        <% if (!intermediatePercentage.isEmpty()) { %>

                            <span>Percentage: <%= esc(intermediatePercentage) %></span>

                        <% } %>

                    </div>

                </div>

                <% } %>



                <% if (!highschoolSchool.isEmpty() || !highschoolPercentage.isEmpty()) { %>

                <div class="t5-education">

                    <h3>High School / 10th</h3>

                    <% if (!highschoolSchool.isEmpty()) { %>

                    <p><%= esc(highschoolSchool) %></p>

                    <% } %>

                    <div class="t5-meta school-meta">

                        <% if (!highschoolBoard.isEmpty()) { %>

                            <span>Board: <%= esc(highschoolBoard) %></span>

                        <% } %>

                        <% if (!highschoolYear.isEmpty()) { %>

                            <span>Year: <%= esc(highschoolYear) %></span>

                        <% } %>

                        <% if (!highschoolPercentage.isEmpty()) { %>

                            <span>Percentage: <%= esc(highschoolPercentage) %></span>

                        <% } %>

                    </div>

                </div>

                <% } %>

            </section>



            <section class="t5-section">

                <h2 class="t5-section-heading">

                    <span class="t5-section-number">05</span>

                    Personal Note

                </h2>

                <div class="t5-quote">

                    A polished profile that brings together experience, education,

                    skills and interests in one clear professional story.

                </div>

            </section>

        </main>

    </div>

</div>

<% } else { %>

<div class="resume template6">

    <header class="t6-header">

        <div>

            <h1><%= esc(fullName) %></h1>

            <div class="role">Graduate Professional</div>

            <div class="contact">

                <%= esc(email) %>

                <% if (!phone.isEmpty()) { %> &nbsp; | &nbsp; <%= esc(phone) %><% } %>

                <% if (!address.isEmpty()) { %> &nbsp; | &nbsp; <%= esc(address) %><% } %>

            </div>

        </div>

        <div class="mark" aria-label="Candidate initials"><span><%= esc(initials(fullName)) %></span></div>

    </header>

    <main class="content">

        <% if (!careerObjective.isEmpty()) { %>

        <section class="section">

            <h2 class="title">PROFILE</h2>

            <p><%= esc(careerObjective) %></p>

        </section>

        <% } %>

        <% if (!experience.isEmpty()) { %>

        <section class="section">

            <h2 class="title">EXPERIENCE</h2>

            <div class="achievement"><p><%= esc(experience) %></p></div>

        </section>

        <% } %>

        <% if (!projects.isEmpty()) { %>

        <section class="section">

            <h2 class="title">PROJECTS</h2>

            <div class="achievement"><p><%= esc(projects) %></p></div>

        </section>

        <% } %>

        <section class="section">

            <h2 class="title">EDUCATION</h2>

            <div class="edu-grid">

                <% if (!bachelorDegree.isEmpty()) { %>

                <div class="edu-item">

                    <h3><%= esc(bachelorDegree) %></h3>

                    <p><%= esc(bachelorCollege) %></p>

                    <p>Year: <%= esc(bachelorYear) %></p>

                    <% if (!bachelorCgpa.isEmpty()) { %><p><strong>CGPA:</strong> <%= esc(bachelorCgpa) %></p><% } %>

                </div>

                <% } %>

                <% if (!masterDegree.isEmpty()) { %>

                <div class="edu-item">

                    <h3><%= esc(masterDegree) %></h3>

                    <p><%= esc(masterCollege) %></p>

                    <p>Year: <%= esc(masterYear) %></p>

                    <% if (!masterCgpa.isEmpty()) { %><p><strong>CGPA:</strong> <%= esc(masterCgpa) %></p><% } %>

                </div>

                <% } %>

                <% if (!intermediateSchool.isEmpty() || !intermediatePercentage.isEmpty()) { %>

                <div class="edu-item">

                    <h3>Intermediate / 12th</h3>

                    <p><%= esc(intermediateSchool) %></p>

                    <p>Board: <%= esc(intermediateBoard) %></p>

                    <p>Year: <%= esc(intermediateYear) %></p>

                    <p>Percentage: <%= esc(intermediatePercentage) %></p>

                </div>

                <% } %>

                <% if (!highschoolSchool.isEmpty() || !highschoolPercentage.isEmpty()) { %>

                <div class="edu-item">

                    <h3>High School / 10th</h3>

                    <p><%= esc(highschoolSchool) %></p>

                    <p>Board: <%= esc(highschoolBoard) %></p>

                    <p>Year: <%= esc(highschoolYear) %></p>

                    <p>Percentage: <%= esc(highschoolPercentage) %></p>

                </div>

                <% } %>

            </div>

        </section>

        <% if (!skills.isEmpty()) { %>

        <section class="section">

            <h2 class="title">SKILLS</h2>

            <p><%= esc(skills) %></p>

        </section>

        <% } %>

        <% if (!certifications.isEmpty()) { %>

        <section class="section">

            <h2 class="title">CERTIFICATIONS</h2>

            <p><%= esc(certifications) %></p>

        </section>

        <% } %>

        <% if (!languages.isEmpty()) { %>

        <section class="section">

            <h2 class="title">LANGUAGES</h2>

            <p><%= esc(languages) %></p>

        </section>

        <% } %>

        <% if (!hobbies.isEmpty()) { %>

        <section class="section">

            <h2 class="title">INTERESTS</h2>

            <p><%= esc(hobbies) %></p>

        </section>

        <% } %>

    </main>

</div>

<% } %>

<% } else { %>

<div style="text-align:center; padding:80px 20px;">

    <h2>Resume not found.</h2>

</div>

<% } %>

<div class="buttons">

    <button onclick="window.print()">Print / Save as PDF</button>

    <button onclick="window.location.href='myresumes'">Back to My Resumes</button>

</div>

</body>

</html>
