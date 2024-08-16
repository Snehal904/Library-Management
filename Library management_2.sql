use library_management;

/*	1.	Create Table:
		Write an SQL statement to create all tables with the specified columns. */

/*	2.	Insert Records:
	Insert at least 10 records in all the tables. */

/*	3.	Select Records:
		Write a query to select all books published
        before 2000 from the Books table. */
select title, publicationYear
from books
where publicationYear < 2000;

/*	4.	Where Clause (AND/OR):
		Write a query to select all Loans where the LoanDate is 
        in 2024 and the ReturnDate is NULL. */
select * from loans 
where year(loanDate) = 2024 and returnDate is null;


/*	5.	LIKE Operator:
		Write a query to select all Books where the Title contains 'Science'. */
select title from books
where title like "%Science%";


/*	6.	CASE Statement:
		Write a query to select Title and a new column Availability from the Books table. 
        If a book has been loaned out (i.e., exists in Loans table with a NULL ReturnDate), 
        set Availability to 'Checked Out', otherwise 'Available'. */
select title,
	case 
		when returnDate is null then "Checked out"
        else "Available"
	end as "Availability"
from books join loans
using (bookId);


/*	7.	Subquery:
		Write a query to find all Members who have borrowed more than 5 books. 
        Use a subquery to find these MemberIDs. */
select memberId, firstName, LastName
from members 
where memberId = (select memberID
					from loans
					group by memberId
					having count(memberId)>= 5 ); 

/*	8.	Group By:
		Write a query to get the total number of books borrowed by each Member. 
        Group the results by MemberID. */
select  memberId, count(bookId) "Books Borrowed"
from loans right outer join members
using (memberId)
group by  memberId
order by memberID;


/*	9.	Having Clause:
		Write a query to get the total FineAmount collected for each LoanID, 
        but only include loans where the total fine amount is greater than $10. 
        Use the HAVING clause.*/
select loanId, fineAmount
from loans join fines
using (loanId)
having fineAmount > 10 ;


/*	10.	Limit:
		Write a query to select the top 5 most frequently borrowed books. */
select b.bookId, title, count(l.bookId) "Borrowed count"
from books b join loans l
using (bookId)
group by b.bookId
order by count(l.bookId)
desc limit 5;


/*	11.	Inner Join:
		Write a query to join Loans with Books to get a list of all loans 
        with Title, LoanDate, and ReturnDate.	*/
select loanId, title, loanDate, returnDate
from books join loans
using (bookId);

/*	12.	Outer Join:
		Write a query to get a list of all Books and any associated loans. 
        Include books that might not be currently borrowed. */
select b.bookId, title, loanId
from books b left outer join loans l
using (bookId);

/*	13.	Join with Aggregation:
		Write a query to get the total number of books each Author has written. 
        Use an INNER JOIN between Books and BookAuthors, and group by AuthorID. */
select b.authorId, authorName, count(b.bookId) "Books Written"
from authors a join bookAuthors b
using (authorId)
group by authorId;


/*	14.	Subquery with Join:
		Write a query to find all Books that were written by authors born after 1970. 
        Use a subquery in the WHERE clause to find these AuthorIDs. */
select title, authorName, birthYear
from books join authors
on author = authorName
where birthYear in (select distinct birthYear from authors
							where birthYear > 1970);

/*	15.	Advanced Join:
		Write a query to list Title, AuthorName, and FineAmount for all books 
        where a fine has been recorded. 
        Use INNER JOIN and LEFT JOIN as necessary to get all required details. */
 select title, authorName, fineAmount
 from books join authors
 on author = authorName
 join loans
 using (bookId)
 join fines
 using (loanId);