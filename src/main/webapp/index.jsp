
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Library Management System</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #e8f0ff, #f5eaff);
            min-height: 100vh;
            color: #263238;
        }

        nav {
            background: #243b64;
            color: white;
            padding: 20px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
        }

        nav h2 {
            font-size: 24px;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: bold;
        }

        .hero {
            min-height: 75vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 40px 20px;
        }

        .icon {
            font-size: 65px;
            margin-bottom: 20px;
        }

        .hero h1 {
            font-size: 42px;
            color: #243b64;
            margin-bottom: 18px;
        }

        .hero p {
            font-size: 18px;
            line-height: 1.7;
            max-width: 650px;
            margin-bottom: 30px;
            color: #526174;
        }

        .button {
            display: inline-block;
            background: #243b64;
            color: white;
            padding: 14px 28px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        .button:hover {
            background: #36588f;
            transform: translateY(-2px);
        }

        .features {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
            padding: 20px;
            margin-bottom: 40px;
        }

        .card {
            background: white;
            width: 250px;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.08);
        }

        .card h3 {
            color: #243b64;
            margin-bottom: 10px;
        }

        .card p {
            color: #657386;
            line-height: 1.5;
        }

        footer {
            background: #243b64;
            color: white;
            text-align: center;
            padding: 18px;
        }

        @media (max-width: 600px) {
            .hero h1 {
                font-size: 30px;
            }

            nav {
                justify-content: center;
            }
        }
    </style>
</head>

<body>

    <nav>
        <h2>📚 My Library</h2>

        <div>
            <a href="index.jsp">Home</a>
            <a href="books">View Books</a>
        </div>
    </nav>

    <section class="hero">
        <div class="icon">📚</div>

        <h1>Welcome to Our Library</h1>

        <p>
            Discover your next favourite book!
            Explore our library collection and find books
            from different categories, authors and subjects.
        </p>

        <a href="books" class="button">Explore Books →</a>
    </section>

    <section class="features">

        <div class="card">
            <h3>📖 Book Collection</h3>
            <p>Explore the books available in our library database.</p>
        </div>

        <div class="card">
            <h3>🔎 Easy Access</h3>
            <p>View book details, authors and available copies.</p>
        </div>

        <div class="card">
            <h3>💻 Digital Library</h3>
            <p>A simple web-based interface for library book records.</p>
        </div>

    </section>

    <footer>
        <p>Library Management System | MCA Project</p>
    </footer>

</body>
</html>
