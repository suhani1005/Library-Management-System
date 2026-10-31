<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Explore Books | My Library</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --green: #174b3b;
            --dark-green: #12382e;
            --cream: #faf6ed;
            --beige: #eee4d1;
            --text: #263c33;
            --muted: #65746b;
            --white: #ffffff;
            --border: #e9dfce;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'DM Sans', sans-serif;
            background: var(--cream);
            color: var(--text);
            line-height: 1.6;
        }

        a {
            text-decoration: none;
        }

        /* Navigation */

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
            padding: 18px 5%;
            background: #fffdf8;
            border-bottom: 1px solid var(--border);
        }

        .brand {
            color: var(--green);
            font-family: 'Playfair Display', serif;
            font-size: 25px;
            font-weight: 700;
        }

        .nav-links {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 22px;
        }

        .nav-links a {
            color: var(--green);
            font-weight: 600;
        }

        .nav-links a:hover {
            color: #a27b42;
        }

        .nav-links .nav-button {
            background: var(--green);
            color: white;
            padding: 10px 17px;
            border-radius: 25px;
        }

        /* Main page */

        main {
            max-width: 1250px;
            margin: 35px auto 55px;
            padding: 0 22px;
        }

        .welcome {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            padding: 17px 22px;
            margin-bottom: 25px;
            background: #e8eddf;
            border: 1px solid #d8e1d0;
            border-radius: 12px;
        }

        .welcome h3 {
            margin: 0;
            color: var(--green);
            font-size: 17px;
        }

        .logout-button {
            display: inline-block;
            background: #a33e32;
            color: white;
            padding: 9px 17px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 700;
            transition: background 0.2s;
        }

        .logout-button:hover {
            background: #842f26;
        }

        .page-heading {
            margin-bottom: 25px;
        }

        .eyebrow {
            color: #758347;
            font-size: 12px;
            letter-spacing: 3px;
            font-weight: 700;
            text-transform: uppercase;
        }

        .page-heading h1 {
            color: var(--green);
            font-family: 'Playfair Display', serif;
            font-size: clamp(30px, 4vw, 43px);
            margin: 7px 0;
        }

        .page-heading p {
            margin: 0;
            color: var(--muted);
        }

        /* Book card */

        .card {
            background: var(--white);
            padding: 27px;
            border: 1px solid var(--border);
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(48, 57, 42, 0.06);
        }

        .card-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 20px;
        }

        .card-heading h2 {
            color: var(--green);
            font-family: 'Playfair Display', serif;
            font-size: 25px;
            margin: 0;
        }

        .add-button {
            display: inline-block;
            background: var(--green);
            color: white;
            padding: 11px 17px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 14px;
        }

        .add-button:hover {
            background: #24654f;
        }

        /* Search */

        .search-form {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
            margin: 20px 0 25px;
        }

        .search-input {
            flex: 1;
            min-width: 220px;
            padding: 13px 15px;
            border: 1px solid #dcd6c9;
            border-radius: 8px;
            outline: none;
            font-family: inherit;
            font-size: 14px;
            background: #fffdf9;
        }

        .search-input:focus {
            border-color: var(--green);
            box-shadow: 0 0 0 3px rgba(23, 75, 59, 0.1);
        }

        .search-button,
        .reset-button {
            display: inline-block;
            padding: 12px 18px;
            border: none;
            border-radius: 8px;
            font-family: inherit;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
        }

        .search-button {
            background: var(--green);
            color: white;
        }

        .search-button:hover {
            background: #24654f;
        }

        .reset-button {
            background: var(--beige);
            color: var(--green);
        }

        .reset-button:hover {
            background: #e4d7be;
        }

        /* Responsive table */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #eee8dc;
            border-radius: 10px;
        }

        table {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 15px 13px;
            text-align: left;
            border-bottom: 1px solid #eee8dc;
            font-size: 13px;
        }

        th {
            background: #e9eddf;
            color: var(--dark-green);
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            white-space: nowrap;
        }

        tbody tr {
            transition: background 0.2s;
        }

        tbody tr:hover {
            background: #fcfaf5;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .book-title {
            color: var(--green);
            font-weight: 700;
        }

        .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            background: #e4f3e8;
            color: #237443;
            font-size: 12px;
            font-weight: 700;
            white-space: nowrap;
        }

        .actions {
            white-space: nowrap;
        }

        .edit-button {
            display: inline-block;
            background: #e9eddf;
            color: var(--green);
            padding: 7px 11px;
            border-radius: 6px;
            font-weight: 700;
            font-size: 12px;
            margin-right: 4px;
        }

        .edit-button:hover {
            background: #dce5d1;
        }

        .delete-button {
            background: #f9e6e1;
            color: #a33e32;
            padding: 7px 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-family: inherit;
            font-weight: 700;
            font-size: 12px;
        }

        .delete-button:hover {
            background: #f2d3cb;
        }

        .empty {
            padding: 35px 15px;
            text-align: center;
            color: var(--muted);
            background: #fffdf9;
            border-radius: 10px;
        }

        .empty-icon {
            display: block;
            font-size: 35px;
            margin-bottom: 8px;
        }

        /* Footer */

        footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
            padding: 23px 5%;
            background: var(--dark-green);
            color: #f8f4e9;
        }

        footer strong {
            font-family: 'Playfair Display', serif;
            font-size: 17px;
        }

        footer p {
            margin: 0;
            color: #e0e7df;
            font-size: 12px;
        }

        @media (max-width: 650px) {
            .navbar {
                justify-content: center;
            }

            .brand {
                font-size: 22px;
            }

            .nav-links {
                justify-content: center;
                gap: 13px;
            }

            .nav-links a {
                font-size: 13px;
            }

            main {
                margin-top: 22px;
                padding: 0 13px;
            }

            .card {
                padding: 17px;
            }

            .card-heading h2 {
                font-size: 22px;
            }

            .search-form {
                align-items: stretch;
            }

            .search-input {
                min-width: 100%;
            }

            .search-button,
            .reset-button {
                flex: 1;
            }

            footer {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/index.html" class="brand">
            📖 My Library
        </a>

        <div class="nav-links">
            <a href="<%= request.getContextPath() %>/index.html">Home</a>
            <a href="<%= request.getContextPath() %>/books">Explore Books</a>
            <a href="<%= request.getContextPath() %>/add-book">Add Book +</a>
        </div>
    </nav>

    <main>

        <!-- Welcome message for logged-in users -->
        <%
            jakarta.servlet.http.HttpSession userSession = request.getSession(false);

            if (userSession != null && userSession.getAttribute("userId") != null) {
        %>
        <div class="welcome">
            <h3>
                Welcome, <%= userSession.getAttribute("userName") %>! 👋
            </h3>

            <a class="logout-button"
               href="<%= request.getContextPath() %>/logout">
                ↪ Logout
            </a>
        </div>
        <%
            }
        %>

        <!-- Page heading -->
        <div class="page-heading">
            <div class="eyebrow">Your Reading Collection</div>
            <h1>Explore Our Books 📚</h1>
            <p>Discover, search and manage your library collection.</p>
        </div>

        <!-- Books card -->
        <section class="card">

            <div class="card-heading">
                <h2>Book Collection</h2>

                <a href="<%= request.getContextPath() %>/add-book"
                   class="add-button">
                    + Add New Book
                </a>
            </div>

            <!-- Search form -->
            <form action="<%= request.getContextPath() %>/books"
                  method="get"
                  class="search-form">

                <input type="text"
                       class="search-input"
                       name="keyword"
                       placeholder="Search by title, author, or category..."
                       value="<%= request.getAttribute("keyword") == null
                                    ? ""
                                    : request.getAttribute("keyword") %>">

                <button type="submit" class="search-button">
                    🔍 Search
                </button>

                <a href="<%= request.getContextPath() %>/books"
                   class="reset-button">
                    Reset
                </a>
            </form>

            <%
                List<Map<String, Object>> books =
                    (List<Map<String, Object>>) request.getAttribute("books");

                if (books != null && !books.isEmpty()) {
            %>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Book Title</th>
                            <th>Author</th>
                            <th>Category</th>
                            <th>Total Copies</th>
                            <th>Available Copies</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <% for (Map<String, Object> book : books) { %>
                        <tr>
                            <td><%= book.get("book_id") %></td>

                            <td class="book-title">
                                <%= book.get("title") %>
                            </td>

                            <td><%= book.get("author") %></td>

                            <td><%= book.get("category") %></td>

                            <td><%= book.get("total_copies") %></td>

                            <td><%= book.get("available_copies") %></td>

                            <td>
                                <span class="status">
                                    <%= book.get("status") %>
                                </span>
                            </td>

                            <td class="actions">
                                <a class="edit-button"
                                   href="<%= request.getContextPath() %>/edit-book?id=<%= book.get("book_id") %>">
                                    ✏️ Edit
                                </a>

                                <form action="<%= request.getContextPath() %>/delete-book"
                                      method="post"
                                      style="display:inline;"
                                      onsubmit="return confirm('Are you sure you want to delete this book?');">

                                    <input type="hidden"
                                           name="id"
                                           value="<%= book.get("book_id") %>">

                                    <button type="submit" class="delete-button">
                                        🗑 Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <%
                } else {
            %>
                <div class="empty">
                    <span class="empty-icon">📚</span>
                    <strong>No books found</strong>
                    <p>Try another search or add a new book to your collection.</p>
                </div>
            <%
                }
            %>

        </section>
    </main>

    <footer>
        <strong>📖 My Library</strong>
        <p>Built with Java, JSP, Servlets and MySQL.</p>
        <p>Read More. Learn More. Grow More. 🌿</p>
    </footer>

</body>
</html>