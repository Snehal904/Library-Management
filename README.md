Project Overview:
  This project involves creating and managing a Library Management System using MySQL Workbench. It includes designing a relational database schema, populating it with sample data, and utilizing SQL queries to generate insights. The aim is to demonstrate database design, data manipulation, and effective querying techniques.


Database Schema:
  Tables created - 
  1.	Books
    o	BookID (INT, Primary Key)
    o	Title (VARCHAR)
    o	Author (VARCHAR)
    o	PublicationYear (YEAR)
    o	Genre (VARCHAR)
  2.	Members
    o	MemberID (INT, Primary Key)
    o	FirstName (VARCHAR)
    o	LastName (VARCHAR)
    o	Email (VARCHAR)
    o	MembershipDate (DATE)
  3.	Loans
    o	LoanID (INT, Primary Key)
    o	BookID (INT, Foreign Key referencing Books.BookID)
    o	MemberID (INT, Foreign Key referencing Members.MemberID)
    o	LoanDate (DATE)
    o	ReturnDate (DATE)
  4.	Authors
    o	AuthorID (INT, Primary Key)
    o	AuthorName (VARCHAR)
    o	BirthYear (YEAR)
  5.	BookAuthors
    o	BookID (INT, Foreign Key referencing Books.BookID)
    o	AuthorID (INT, Foreign Key referencing Authors.AuthorID)
  6.	Fines
    o	FineID (INT, Primary Key)
    o	LoanID (INT, Foreign Key referencing Loans.LoanID)
    o	FineAmount (DECIMAL)
    o	PaidDate (DATE)


Data Insertion:
Sample data was inserted into the tables to simulate library operations:

  • Books: Added records for various books, including bookId, titles, genres, publicationYear.
  • Members: Populated with several library members, including their personal details and membership dates.
  • Authors: Inserted information about authors, including their names and birthYears.
  • BookAuthors: Created relationships between books and authors to reflect which authors wrote which books.
  • Loans: Added records for book loans, linking books to members with specific loan and due dates.
  • Fines: Inserted records for fines associated with overdue books.


Insights Derived:
  Several SQL queries were employed to extract useful insights from the data:
  
  • All books published before 2000 from the Books table.
      select title, publicationYear  
      from books
      where publicationYear < 2000;
      
  • find all Members who have borrowed more than 5 books
      select memberId, firstName, LastName
      from members 
      where memberId = (select memberID
	              				from loans
					              group by memberId
					              having count(memberId)>= 5 ); 
  
  • Get the total number of books borrowed by each Member
        select  memberId, count(bookId) "Books Borrowed"
        from loans right outer join members
        using (memberId)
        group by  memberId
        order by memberID;
        
  • select the top 5 most frequently borrowed books
        select b.bookId, title, count(l.bookId) "Borrowed count"
        from books b join loans l
        using (bookId)
        group by b.bookId
        order by count(l.bookId)
        desc limit 5;
        
  • list Title, AuthorName, and FineAmount for all books where a fine has been recorded
         select title, authorName, fineAmount
         from books join authors
         on author = authorName
         join loans
         using (bookId)
         join fines
         using (loanId);

        
Conclusion:
  The Library Management System project illustrates the design and implementation of a relational database for managing library operations. By using MySQL Workbench, the project covers database schema creation, data insertion, and querying to extract valuable insights. This project demonstrates skills in database design, data management, and SQL querying, offering a comprehensive solution for library management.

