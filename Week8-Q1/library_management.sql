CREATE DATABASE library_management;
USE library_management;

-- Create Users Table
CREATE TABLE Users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	phone VARCHAR(15),
	address TEXT,
	registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Books Table
CREATE TABLE Books (
	book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    publish_year INT,
    available_copies INT DEFAULT 1
);

-- Create Staff Table
CREATE TABLE Staff (
	staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    email VARCHAR(100) NOT NULL UNIQUE,
    hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Loans Table - Many to Many relationship between books and users
CREATE TABLE Loans (
	loan_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    return_date TIMESTAMP,
    due_date TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- sample data insertion
-- insert users
INSERT INTO Users (name, email, phone, address) VALUES
 ('Alice Johnson', 'alice@email.com', '0123456789', '123 Main St'),
 ('Bob Smith', 'bob@email.com', '0987654321', '456 Est St'),
 ('Charlie Bucks', 'charlie@email.com', '111222333', '789 Oak St');
 
 -- insert books
 INSERT INTO Books (title, author, genre, publish_year, available_copies) VALUES
('The Great Gatsby', 'F.Scott Fitzgerald', 'Fiction' , 1925, 5),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3),
('1984', 'George Orwell', 'Dystopian', 1949, 2);

-- Insert Staff
INSERT INTO Staff (name, position, email) VALUES
('John Doe', 'Librarian', 'john.doe@example.com'),
('Sarah Connor', 'Assistant Librarian', 'sarah.connor@example.com');

-- insert loans
INSERT INTO Loans (user_id, book_id, due_date) VALUES
(1, 1, '2025-05-15'),
(2, 2, '2025-06-01'),
(3, 3, '2025-07-10');


-- Get all books currently available in the library
SELECT title, author, available_copies
FROM Books 
WHERE available_copies > 0;

-- Get all loans and due dates
SELECT U.name AS user_name, B.title AS book_title, L.due_date
FROM Loans L
JOIN Users U ON L.user_id = U.user_id
JOIN Books B ON L.book_id = B.book_id;


-- Count the number of books loaned by each user
SELECT U.name, COUNT(L.book_id) AS books_loaned
FROM Users U
LEFT JOIN Loans L ON U.user_id = L.user_id
GROUP BY U.name;

-- This setup creates a full-featured Library Management System with users, books, staff, and loan tracking. 
    




