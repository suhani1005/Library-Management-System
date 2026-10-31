<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Book | My Library</title>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'DM Sans', sans-serif;
            background: #faf6ed;
            color: #253b31;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 22px 8%;
            border-bottom: 1px solid #e8dfd0;
        }

        .brand {
            font-family: 'Playfair Display', serif;
            font-size: 25px;
            font-weight: 700;
            color: #174b3b;
            text-decoration: none;
        }

        .nav-link {
            color: #174b3b;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .nav-link:hover {
            color: #a47b45;
        }

        .container {
            width: calc(100% - 36px);
            max-width: 680px;
            margin: 42px auto;
            padding: 38px;
            background: #fffdf8;
            border: 1px solid #e9dfcf;
            border-radius: 18px;
            box-shadow: 0 14px 40px rgba(39, 57, 45, 0.07);
        }

        .icon {
            width: 58px;
            height: 58px;
            margin: 0 auto 15px;
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

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0 20px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 8px;
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
            margin-top: 8px;
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

        .back-link {
            display: block;
            margin-top: 22px;
            text-align: center;
            color: #174b3b;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
        }

        .back-link:hover {
            color: #a47b45;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #8a8a7f;
            font-size: 12px;
            border-top: 1px solid #e8dfd0;
        }

        @media (max-width: 520px) {
            nav {
                padding: 18px 6%;
            }

            .container {
                padding: 28px 20px;
                margin: 28px auto;
            }

            h1 {
                font-size: 29px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }
        }
    </style>
</head>

<body>

<nav>
    <a class="brand" href="<%= request.getContextPath() %>/index.html">
        My Library
    </a>

    <a class="nav-link" href="<%= request.getContextPath() %>/books">
        ← Book Collection
    </a>
</nav>

<div class="container">

    <div class="icon">📚</div>

    <h1>Add New Book</h1>

    <p class="subtitle">
        Add a new title to your collection and make room for another story.
    </p>

    <% if ("1".equals(request.getParameter("error"))) { %>
        <div class="error">
            Unable to add the book. Please check the details and try again.
        </div>
    <% } %>

    <form action="<%= request.getContextPath() %>/add-book" method="post">

        <div class="form-grid">

            <div class="form-group full-width">
                <label for="title">Book Title *</label>
                <input type="text"
                       id="title"
                       name="title"
                       maxlength="250"
                       placeholder="Enter the book title"
                       required>
            </div>

            <div class="form-group">
                <label for="author">Author Name *</label>
                <input type="text"
                       id="author"
                       name="author"
                       maxlength="250"
                       placeholder="Enter author name"
                       required>
            </div>

            <div class="form-group">
                <label for="category">Category</label>
                <input type="text"
                       id="category"
                       name="category"
                       maxlength="120"
                       placeholder="e.g. Fiction, Technology">
            </div>

            <div class="form-group">
                <label for="isbn">ISBN</label>
                <input type="text"
                       id="isbn"
                       name="isbn"
                       maxlength="30"
                       placeholder="Enter ISBN">
            </div>

            <div class="form-group">
                <label for="publisher">Publisher</label>
                <input type="text"
                       id="publisher"
                       name="publisher"
                       maxlength="250"
                       placeholder="Enter publisher name">
            </div>

            <div class="form-group full-width">
                <label for="totalCopies">Total Copies *</label>
                <input type="number"
                       id="totalCopies"
                       name="totalCopies"
                       min="1"
                       max="100000"
                       placeholder="Enter number of copies"
                       required>
            </div>

        </div>

        <button type="submit">Add Book to Collection →</button>

    </form>

    <a class="back-link"
       href="<%= request.getContextPath() %>/books">
       Cancel and Return to Books
    </a>

</div>

<footer>
    © 2026 My Library · A quiet place for curious minds.
</footer>

</body>
</html>