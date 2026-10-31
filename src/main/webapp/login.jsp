<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | My Library</title>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'DM Sans', sans-serif;
            background: #faf6ed;
            color: #253b31;
            display: flex;
            flex-direction: column;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 22px 8%;
            border-bottom: 1px solid #e8dfd0;
            background: #faf6ed;
        }

        .brand {
            font-family: 'Playfair Display', serif;
            font-size: 25px;
            font-weight: 700;
            color: #174b3b;
            text-decoration: none;
        }

        .home-link {
            color: #174b3b;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
        }

        .home-link:hover {
            color: #a47b45;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 45px 18px;
        }

        .login-card {
            width: 100%;
            max-width: 440px;
            background: #fffdf8;
            padding: 42px;
            border: 1px solid #e9dfcf;
            border-radius: 18px;
            box-shadow: 0 14px 40px rgba(39, 57, 45, 0.08);
        }

        .icon {
            width: 58px;
            height: 58px;
            margin: 0 auto 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #e8eee5;
            border-radius: 50%;
            font-size: 27px;
        }

        h1 {
            margin: 0;
            text-align: center;
            color: #174b3b;
            font-family: 'Playfair Display', serif;
            font-size: 34px;
        }

        .subtitle {
            text-align: center;
            color: #7b8178;
            font-size: 14px;
            line-height: 1.7;
            margin: 12px 0 28px;
        }

        .error {
            background: #fbe9e5;
            color: #a6372c;
            border: 1px solid #f2d0c9;
            padding: 12px 14px;
            margin-bottom: 20px;
            border-radius: 9px;
            font-size: 14px;
        }

        label {
            display: block;
            margin: 18px 0 8px;
            font-size: 14px;
            font-weight: 600;
            color: #35483d;
        }

        input {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #ded8cb;
            border-radius: 9px;
            background: #fffefa;
            font-family: inherit;
            font-size: 14px;
            color: #253b31;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus {
            border-color: #46765f;
            box-shadow: 0 0 0 3px rgba(70, 118, 95, 0.12);
        }

        button {
            width: 100%;
            padding: 14px;
            margin-top: 27px;
            background: #174b3b;
            color: #fffdf8;
            border: none;
            border-radius: 9px;
            font-family: inherit;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }

        button:hover {
            background: #10382c;
            transform: translateY(-1px);
        }

        .links {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            line-height: 2;
            color: #777c73;
        }

        .links a {
            color: #174b3b;
            text-decoration: none;
            font-weight: 700;
        }

        .links a:hover {
            color: #a47b45;
            text-decoration: underline;
        }

        footer {
            text-align: center;
            padding: 18px;
            color: #8a8a7f;
            font-size: 12px;
            border-top: 1px solid #e8dfd0;
        }

        @media (max-width: 480px) {
            nav {
                padding: 18px 6%;
            }

            .login-card {
                padding: 30px 22px;
            }

            h1 {
                font-size: 29px;
            }
        }
    </style>
</head>

<body>

<nav>
    <a class="brand" href="<%= request.getContextPath() %>/index.html">
        My Library
    </a>

    <a class="home-link" href="<%= request.getContextPath() %>/index.html">
        ← Back to Home
    </a>
</nav>

<main>
    <div class="login-card">

        <div class="icon">🌿</div>

        <h1>Welcome Back</h1>

        <p class="subtitle">
            Sign in to your account and continue exploring your library.
        </p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/login" method="post">

            <label for="email">Email Address</label>
            <input
                type="email"
                id="email"
                name="email"
                placeholder="Enter your email address"
                autocomplete="email"
                required
            >

            <label for="password">Password</label>
            <input
                type="password"
                id="password"
                name="password"
                placeholder="Enter your password"
                autocomplete="current-password"
                required
            >

            <button type="submit">Sign In →</button>

        </form>

        <div class="links">
            Don't have an account?
            <a href="<%= request.getContextPath() %>/register">Create Account</a>
            <br>
            <a href="<%= request.getContextPath() %>/index.html">Return to Homepage</a>
        </div>

    </div>
</main>

<footer>
    © 2026 My Library · A quiet place for curious minds.
</footer>

</body>
</html>