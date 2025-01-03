const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");

const app = express();

// MySQL Connection Setup
const db = mysql.createConnection({
  host: process.env.DB_HOST, //Change this if your MySQL server is remote
  user:process.env.DB_USER, // Replace with your MySQL username
  password: process.env.DB_PASSWORD, //Replace with your MySQL password
  database: "contacts_app", // Database name
});

db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL:", err.message);
    process.exit(1); // Exit if the database connection fails
  }
  console.log("Connected to MySQL database.");
});

// Middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.set("view engine", "ejs");

// Routes

// GET: Render index page with data
app.get("/", (req, res) => {
  const sql = "SELECT * FROM contacts";
  db.query(sql, (err, results) => {
    if (err) {
      console.error(err.message);
      res.status(500).send("Database error");
      return;
    }
    res.render("index", { entries: results }); // Pass results as "entries" to EJS
  });
});

// POST: Save name and number to database
app.post("/index", (req, res) => {
  const { person, number } = req.body;
  if (!person || !number) {
    res.status(400).send("Name and number are required");
    return;
  }

  const sql = "INSERT INTO contacts (name, number) VALUES (?, ?)";
  db.query(sql, [person, number], (err) => {
    if (err) {
      console.error(err.message);
      res.status(500).send("Database error");
      return;
    }
    res.redirect("/"); // Redirect to the home page after saving
  });
});

// Start server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
