create database library_management;

use library_management;

-- create table books
create table books(
	bookId int primary key,
    title varchar(100),
    author varchar(50),
    publicationYear int,
    genre varchar(20));

desc books;

insert into books values
(1, "Pride and Prejudice", "Jane Austen", 1813, "Novel"),
(2, "Challengers of the Unknown", "Ron Goulart", 1977, "comics"),
(3, "Dhdarmayoddha Kalki: Avatar of Vishnu (Book1)", "Kevin Missal", 2018, "mythological fiction"),
(4, "Ghost 19","Simons St. James", 2023, "Horror"),
(5, "The Red and the Black", "Stendhal", 1830, "Novel"),
(6, "The Night Country", "Melissa Albert", 2020, "Horror"),
(7, "Harry Potter", "J. K. Rowling", 1997, "Action and Adventure"),
(8, "Shivaji: The Great Maratha", "Ranjit Desai and Vikrant Pande", 2017, "historical"),
(9, "Ram ke Path Par", "Neelesh Kulkarni and Vikrant Pande", 2023, "Fairy Tale"),
(10, "Armance", "Stendhal", 1950, "Romance Novel");

select * from books;
 
-- create table members
create table members(
	memberId int primary key,
    firstName varchar(20),
    lastName varchar(20),
    email varchar(30),
    membershipDate date);

insert into members values
(10, "Olivia", "Smith", "olivia_smith@gmail.com", "1998-12-13"), 
(20, "Emma", "Johnson", "emmajohn@gmail.com", "2000-02-03"),
(30, "Charlotte", "Williams", "charlottewilliams@gmial.com", "2013-05-06"),
(40, "Amelia", "Brown", "ameliabrown@gmail.com", "1990-11-30"),
(50, "Leo", "Campbell", "Leocampbell@gmail.com", "2002-06-04"),
(60, "Sophia", "Roberts", "sophiaroberts@gmail.com", "2020-10-13"),
(70, "jack", "Wilson", "jackwilson@gmail.com", "1997-08-09"),
(80, "Oliver", "Stewart", "oliverstewart@gmail.com", "2022-05-10"),
(90, "Mia", "Anderson", "miaanderson@gmail.com", "2015-09-01"),
(100, "Aiden","Taylor", "aidentaylor@gmail.com", "2023-01-01");

select * from members;

-- create table loans
create table loans(
	loanId int primary key,
    bookId int, 
    memberId int,
    foreign key (bookId) references books(bookId),
    foreign key (memberId) references members(memberId),
    loanDate date,
    returnDate date);
    
insert into loans values
(501, 2, 10, "2000-01-10", "2000-06-01"),
(502, 1, 90, "1995-06-12", "1996-02-21"),
(503, 4, 30, "2014-03-04", "2014-08-10");

insert into loans (loanId, bookId, memberId, loanDate) values 
(504, 3, 60, "2022-10-22");

insert into loans values
(505, 5, 50, "2004-07-15", "2005-02-15"),
(506, 10, 90, "2018-05-20", "2018-12-02");

insert into loans (loanId, bookId, memberId, loanDate) values 
(507, 8, 60, "2024-03-15"),
(508,5, 30, "2023-05-10");

insert into loans values
(509, 6, 90, "2002-06-14", "2003-01-01"),
(510, 5, 70, "1991-04-25", "1991-12-20"),
(511, 4, 40, "2010-06-14", "2011-01-01"),
(512, 5, 90, "1999-04-25", "1999-12-20");

insert into loans (loanId, bookId, memberId, loanDate) values 
(513, 8, 90, "2024-0-19");

insert into loans values
(514, 6, 40, "2015-01-14", "2016-06-05"),
(515, 5, 60, "2001-04-25", "2001-12-20"),
(516, 4, 90, "2005-05-15", "2005-11-25"),
(517, 1, 60, "2012-04-25", "2012-09-30");

select * from loans;
    
    
-- create table authors
create table authors(
	authorId int primary key,
    authorname varchar(20),
    birthYear int);

insert into authors values
(1001, "Jane Austen", 1775),
(1002, "Ron Goularte", 1933),
(1003, "Kevin Missal",1996),
(1004, "Stendhal", 1783),
(1005, "Simons St. James", 1970),
(1006, "Melissa Albert", 1984),
(1007, "J. K. Rowling", 1965),
(1008, "Vikrant Pande", 1990),
(1009, "Ranjit Desai", 1928),
(1010, "Neelesh Kulkarni", 1973);
    
select * from authors;


-- create table bookAuthors
create table bookAuthors(
	bookId int,
    authorId int,
    foreign key (bookId) references books(bookId),
    foreign key (authorId) references authors(authorId));

insert into bookAuthors values
(1, 1001), 
(2, 1002),
(3, 1003),
(4, 1005),
(5, 1004),
(6, 1006),
(7, 1007),
(8, 1009),
(9, 1010),
(10, 1004);

select * from bookAuthors;

-- create table fines
create table fines(
	fineId int primary key,
    loanId int,
    foreign key (loanId) references loans(loanId),
    fineAmount decimal,
    paidDate date);

insert into fines values
(101, 503, 10, "2014-08-15"),
(102, 502, 100, "1996-03-20"),
(103, 509, 200, "2002-01-20"),
(104, 508, 45, "2003-10-01" ),
(105, 510, 75, "2024-07-10");

select * from fines;