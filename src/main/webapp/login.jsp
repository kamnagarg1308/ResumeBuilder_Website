<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - ResumeCraft</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f7fb;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1f2937;
        }

        .page {
            width: 900px;
            max-width: 92%;
            min-height: 560px;
            background: #ffffff;
            border-radius: 18px;
            overflow: hidden;
            display: grid;
            grid-template-columns: 1fr 1fr;
            box-shadow: 0 18px 45px rgba(15, 23, 42, 0.12);
        }

        /* LEFT SIDE */

        .welcome {
            background: #111827;
            color: white;
            padding: 55px 48px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .brand {
            font-size: 25px;
            font-weight: 700;
            letter-spacing: -0.5px;
            margin-bottom: 55px;
        }

        .brand span {
            color: #818cf8;
        }

        .welcome h1 {
            font-size: 38px;
            line-height: 1.15;
            margin: 0 0 18px;
            letter-spacing: -1px;
        }

        .welcome p {
            margin: 0;
            color: #cbd5e1;
            font-size: 15px;
            line-height: 1.7;
            max-width: 330px;
        }

        .accent-line {
            width: 55px;
            height: 4px;
            background: #6366f1;
            border-radius: 10px;
            margin: 25px 0;
        }

        .tagline {
            font-size: 13px;
            color: #94a3b8;
            margin-top: 45px;
        }

        /* RIGHT SIDE */

        .login-section {
            padding: 55px 48px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-section h2 {
            margin: 0 0 8px;
            font-size: 29px;
            color: #111827;
        }

        .subtitle {
            margin: 0 0 32px;
            color: #64748b;
            font-size: 14px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
        }

        input {
            width: 100%;
            padding: 13px 14px;
            margin-bottom: 20px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            color: #111827;
            background: #ffffff;
            transition: 0.2s ease;
        }

        input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.10);
        }

        input::placeholder {
            color: #9ca3af;
        }

        .login-btn {
            width: 100%;
            padding: 13px;
            margin-top: 3px;
            background: #4f46e5;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .login-btn:hover {
            background: #4338ca;
            transform: translateY(-1px);
        }

        .register {
            text-align: center;
            margin: 25px 0 0;
            color: #64748b;
            font-size: 13px;
        }

        .register a {
            color: #4f46e5;
            text-decoration: none;
            font-weight: 600;
        }

        .register a:hover {
            text-decoration: underline;
        }

        @media (max-width: 700px) {
            .page {
                grid-template-columns: 1fr;
                min-height: auto;
            }

            .welcome {
                padding: 35px;
            }

            .brand {
                margin-bottom: 30px;
            }

            .welcome h1 {
                font-size: 30px;
            }

            .tagline {
                margin-top: 25px;
            }

            .login-section {
                padding: 40px 35px;
            }
        }
    </style>
</head>

<body>

<div class="page">

    <!-- LEFT SIDE -->
    <div class="welcome">

        <div class="brand">
            Resume<span>Craft</span>
        </div>

        <h1>
            Build a resume<br>
            that gets noticed.
        </h1>

        <div class="accent-line"></div>

        <p>
            Create, manage and present your professional
            resume with a clean and modern approach.
        </p>

        <div class="tagline">
            Your career. Your story. Your resume.
        </div>

    </div>


    <!-- RIGHT SIDE -->
    <div class="login-section">

        <h2>Welcome back</h2>

        <p class="subtitle">
            Login to continue to your ResumeCraft account.
        </p>

        <form action="login" method="post">

            <label>Email</label>

            <input
                type="email"
                name="email"
                placeholder="Enter your email"
                required
            >

            <label>Password</label>

            <input
                type="password"
                name="password"
                placeholder="Enter your password"
                required
            >

            <button type="submit" class="login-btn">
                Login
            </button>

        </form>

        <p class="register">
            Don't have an account?
            <a href="register.jsp">Register here</a>
        </p>

    </div>

</div>

</body>
</html>