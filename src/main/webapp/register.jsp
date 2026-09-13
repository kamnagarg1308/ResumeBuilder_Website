<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Register - ResumeCraft</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3f6fa;
            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;

            color: #111827;
        }

        .page {
            width: 100%;
            padding: 25px;
        }

        .register-container {
            width: 420px;
            max-width: 100%;
            margin: auto;

            background: #ffffff;

            padding: 38px 40px;

            border: 1px solid #e2e8f0;
            border-radius: 14px;

            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
        }

        .brand {
            text-align: center;
            color: #4f46e5;

            font-size: 27px;
            font-weight: 800;

            margin-bottom: 25px;
        }

        .register-container h1 {
            text-align: center;

            margin: 0 0 8px;

            font-size: 27px;
            color: #111827;
        }

        .subtitle {
            text-align: center;

            color: #64748b;

            font-size: 14px;

            margin: 0 0 30px;
        }

        .form-group {
            margin-bottom: 19px;
        }

        label {
            display: block;

            margin-bottom: 7px;

            font-size: 14px;
            font-weight: 600;

            color: #334155;
        }

        input {
            width: 100%;

            padding: 12px 13px;

            border: 1px solid #cbd5e1;
            border-radius: 7px;

            font-size: 14px;

            color: #111827;
            background: #ffffff;

            transition: 0.2s;
        }

        input::placeholder {
            color: #94a3b8;
        }

        input:focus {
            outline: none;

            border-color: #4f46e5;

            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.10);
        }

        .register-btn {
            width: 100%;

            padding: 12px;

            margin-top: 5px;

            background: #111827;
            color: #ffffff;

            border: none;
            border-radius: 7px;

            font-size: 15px;
            font-weight: 600;

            cursor: pointer;

            transition: 0.2s;
        }

        .register-btn:hover {
            background: #4f46e5;
        }

        .login {
            text-align: center;

            margin: 24px 0 0;

            color: #64748b;

            font-size: 14px;
        }

        .login a {
            color: #4f46e5;

            text-decoration: none;

            font-weight: 600;
        }

        .login a:hover {
            text-decoration: underline;
        }

        .note {
            text-align: center;

            margin-top: 20px;

            color: #94a3b8;

            font-size: 12px;
        }

        @media (max-width: 500px) {

            .page {
                padding: 18px;
            }

            .register-container {
                padding: 30px 25px;
            }

            .brand {
                font-size: 24px;
            }

            .register-container h1 {
                font-size: 24px;
            }
        }

    </style>

</head>

<body>

    <div class="page">

        <div class="register-container">

            <div class="brand">
                ResumeCraft
            </div>

            <h1>
                Create Your Account
            </h1>

            <p class="subtitle">
                Start building your professional resume
            </p>


            <form action="register" method="post">

                <div class="form-group">

                    <label for="name">
                        Full Name
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your full name"
                        required>

                </div>


                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter your email address"
                        required>

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Create a password"
                        required>

                </div>


                <button
                    type="submit"
                    class="register-btn">

                    Create Account

                </button>

            </form>


            <p class="login">

                Already have an account?

                <a href="login.jsp">
                    Login here
                </a>

            </p>


            <div class="note">
                Create your account and start building your resume.
            </div>

        </div>

    </div>

</body>
</html>