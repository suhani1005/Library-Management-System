<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | My Library</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
        }

        :root {
            --green: #174b3b;
            --dark-green: #12382e;
            --cream: #faf6ed;
            --beige: #eee4d1;
            --text: #263c33;
            --muted: #65746b;
        }

        body {
            margin: 0;
            padding: 25px 16px 40px;
            min-height: 100vh;
            font-family: 'DM Sans', sans-serif;
            background: var(--cream);
            color: var(--text);
        }

        .navbar {
            max-width: 1100px;
            margin: 0 auto 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .brand {
            color: var(--green);
            font-family: 'Playfair Display', serif;
            font-size: 25px;
            font-weight: 700;
            text-decoration: none;
        }

        .home-link {
            color: var(--green);
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
        }

        .home-link:hover,
        .bottom-link a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 510px;
            margin: 0 auto;
            padding: 34px;
            background: #fffdf8;
            border: 1px solid var(--beige);
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(35, 57, 43, 0.08);
        }

        .icon {
            width: 64px;
            height: 64px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 15px;
            border-radius: 50%;
            background: #e8eddf;
            font-size: 29px;
        }

        h1 {
            margin: 0 0 8px;
            text-align: center;
            color: var(--green);
            font-family: 'Playfair Display', serif;
            font-size: 32px;
        }

        .subtitle {
            margin: 0 0 24px;
            text-align: center;
            color: var(--muted);
            font-size: 14px;
        }

        label {
            display: block;
            margin: 16px 0 7px;
            color: var(--dark-green);
            font-size: 14px;
            font-weight: 700;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ded8ca;
            border-radius: 8px;
            background: white;
            color: var(--text);
            font-family: inherit;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus,
        textarea:focus {
            border-color: var(--green);
            box-shadow: 0 0 0 3px rgba(23, 75, 59, 0.09);
        }

        textarea {
            min-height: 75px;
            resize: vertical;
        }

        .submit-button {
            width: 100%;
            margin-top: 24px;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: var(--green);
            color: white;
            font-family: inherit;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }

        .submit-button:hover {
            background: #24654f;
            transform: translateY(-1px);
        }

        .message {
            padding: 12px;
            margin-bottom: 16px;
            border-radius: 8px;
            text-align: center;
            font-size: 14px;
        }

        .error {
            background: #f9e6e1;
            color: #a33e32;
        }

        .success {
            background: #e4f3e8;
            color: #237443;
        }

        .success a {
            display: inline-block;
            margin-top: 8px;
            color: #174b3b;
            font-weight: 700;
        }

        .bottom-link {
            margin-top: 22px;
            text-align: center;
            color: var(--muted);
            font-size: 14px;
        }

        .bottom-link a {
            color: var(--green);
            font-weight: 700;
            text-decoration: none;
        }

        @media (max-width: 500px) {
            .container {
                padding: 25px 20px;
            }

            .brand {
                font-size: 22px;
            }

            h1 {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/index.html" class="brand">
            📖 My Library
        </a>

        <a href="<%= request.getContextPath() %>/index.html" class="home-link">
            ← Back to Home
        </a>
    </nav>

    <div class="container">

        <div class="icon">🌿</div>

        <h1>Create Your Account</h1>

        <p class="subtitle">
            Join our library and start exploring books.
        </p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="message error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <% if ("1".equals(request.getParameter("success"))) { %>
            <div class="message success">
                Registration successful! Your account has been created.
                <br>
                <a href="<%= request.getContextPath() %>/login">
                    Login here →
                </a>
            </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/register" method="post">

            <label for="first_name">First Name *</label>
            <input type="text" id="first_name" name="first_name"
                   maxlength="100" autocomplete="given-name" required>

            <label for="last_name">Last Name *</label>
            <input type="text" id="last_name" name="last_name"
                   maxlength="100" autocomplete="family-name" required>

            <label for="email">Email Address *</label>
            <input type="email" id="email" name="email"
                   maxlength="120" autocomplete="email" required>

            <label for="password">Password *</label>
            <input type="password" id="password" name="password"
                   minlength="8" autocomplete="new-password" required>

            <label for="phone_no">Phone Number *</label>
            <input type="tel" id="phone_no" name="phone_no"
                   maxlength="120" autocomplete="tel" required>

            <label for="address">Address</label>
            <textarea id="address" name="address"
                      autocomplete="street-address"
                      placeholder="Enter your address (optional)"></textarea>

            <button type="submit" class="submit-button">
                Create Account →
            </button>

        </form>

        <div class="bottom-link">
            Already have an account?
            <a href="<%= request.getContextPath() %>/login">Login</a>
        </div>

    </div>

</body>
</html>