DROP DATABASE IF EXISTS WDU_LMS_IT_G3;
create database WDU_LMS_IT_G3;
use WDU_LMS_IT_G3;

/*----patron table start-----*/
CREATE TABLE Patron ( 
PatronID INT PRIMARY KEY, 
Name VARCHAR(100), 
Address VARCHAR(255), 
PhoneNumber VARCHAR(15), 
Email VARCHAR(100), 
MembershipDate DATE 
); 
INSERT INTO Patron (PatronID, Name, Address, PhoneNumber, Email, 
MembershipDate) VALUES 
(1, 'TADIWOS GETANEH', 'WDU', '0912345678', 'TADIWOS@example.com', '2025-01-01'), 
(2, 'PAULOS ASCHENAKI', 'WDU', '0912345679', 'PAULOS@example.com', '2025-02-01'),
(3, 'SADOR KEBEDE', 'WDU', '0912345680', 'SADOR@example.com', '2025-03-01'), 
(4, 'ATSEDE ASCHALEW', 'WDU', '0912345681', 'ATSEDE@example.com', '2025-04-01'), 
(5, 'EYERUS ADINO', 'WDU', '0912345682', 'EYERUS@example.com', '2025-05-01'); 
select *from Patron;

/*----patron table ends-----*/

/*----catagorey table start-----*/
CREATE TABLE Category ( 
CategoryID INT PRIMARY KEY, 
CategoryName VARCHAR(50) 
); 
INSERT INTO Category (CategoryID, CategoryName) VALUES 
(1, 'Fiction'), 
(2, 'Non-Fiction'), 
(3, 'natural'), 
(4, 'social'), 
(5, 'medicine'), 
(6, 'others'); 
select *from Category;

/*----Category table end-----*/

/*----Staff table start-----*/

CREATE TABLE Staff ( 
StaffID INT PRIMARY KEY, 
Name VARCHAR(100), 
Position VARCHAR(50), 
Email VARCHAR(100), 
PhoneNumber VARCHAR(15) 
); 
INSERT INTO Staff (StaffID, Name, Position, Email, PhoneNumber) VALUES 
(1, 'ABEBE BEKELE', 'Librarian', 'ABE@example.com', '0912345684'), 
(2, 'SELAM TESFAYE', 'Assistant Librarian', 'SELAM@example.com', 
'0912345685'), 
(3, 'DEMEKE GESESE', 'Library Technician', 'DEME@example.com', 
'0912345686'), 
(4, 'MARTA GOYTOM', 'Library Assistant', 'MARTA@example.com', 
'0912345687'), 
(5, 'ALEMAYEHU BEKELE', 'Archivist', 'ALEMAYEHU@example.com', '0912345688'), 
(6, 'BETELHEM ABABU', 'Cataloger', 'BETELHEM@example.com', '0912345689'); 
select *from Staff;

/*----Staff table end-----*/

/*----book table start-----*/

CREATE TABLE Book ( 
BookID INT PRIMARY KEY, 
Title VARCHAR(255), 
Author VARCHAR(100), 
ISBN VARCHAR(20), 
Publisher VARCHAR(100), 
PublicationYear INT, 
Genre VARCHAR(50), 
CopiesAvailable INT, 
CategoryID INT, 
StaffID INT, 
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID), 
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID) 
); 

INSERT INTO Book (BookID, Title, Author, ISBN, Publisher, PublicationYear, 
Genre, CopiesAvailable, CategoryID, StaffID) VALUES 
(1, 'Fikir Eske Mekabir', 'Haddis Alemayehu', '978-99944-2-000-0', 'Addis 
Ababa University Press', 1965, 'Novel', 5, 1, 2), 
(2, 'Oromay', 'Bealu Girma', '978-99944-2-001-7', 'Berhanena Selam', 1983, 
'Novel', 3, 1, 1), 
(3, 'Dertogada', 'Sahle Sellassie', '978-99944-2-002-4', 'Mega Publishing', 
1974, 'Novel', 4, 2, 3), 
(4, 'Tobiya', 'Gebreyesus Hailu', '978-99944-2-003-1', 'Addis Ababa 
University Press', 1949, 'Novel', 2, 3, 4), 
(5, 'Ye Guzo', 'Mengistu Lemma', '978-99944-2-004-8', 'Berhanena Selam', 
1950, 'Play', 6, 4, 5), 
(6, 'Tikusat', 'Tsegaye Gabre-Medhin', '978-99944-2-005-5', 'Mega 
Publishing', 1962, 'Play', 7, 5, 6); 
select *from Book;
/*----book table end-----*/

/*----loan table start-----*/

CREATE TABLE Loan ( 
LoanID INT PRIMARY KEY, 
PatronID INT, 
BookID INT, 
LoanDate DATE, 
DueDate DATE, 
ReturnDate DATE, 
Status VARCHAR(20), 
FOREIGN KEY (PatronID) REFERENCES Patron(PatronID), 
FOREIGN KEY (BookID) REFERENCES Book(BookID) 
); 
INSERT INTO Loan (LoanID, PatronID, BookID, LoanDate, DueDate, ReturnDate, 
Status) VALUES 
(1, 1, 1, '2023-07-01', '2023-07-15', '2023-07-14', 'completed'), 
(2, 2, 2, '2023-07-05', '2023-07-19', '2023-07-18', 'completed'), 
(3, 3, 3, '2023-07-10', '2023-07-24', NULL, 'active'), 
(4, 4, 4, '2023-07-12', '2023-07-26', NULL, 'active'), 
(5, 5, 5, '2023-07-15', '2023-07-29', NULL, 'active');

select *from Loan;

/*----loan table end-----*/