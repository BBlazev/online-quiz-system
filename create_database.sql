CREATE DATABASE OnlineQuizSystem;
GO

USE OnlineQuizSystem;
GO

CREATE TABLE Professor (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Quiz (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProfessorId INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    DateCreated DATETIME DEFAULT GETDATE(),
    TimeLimit INT, 
    IsPublished BIT DEFAULT 0,
    FOREIGN KEY (ProfessorId) REFERENCES Professor(Id) ON DELETE CASCADE
);

CREATE TABLE Question (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    QuizId INT NOT NULL,
    QuestionText NVARCHAR(MAX) NOT NULL,
    Points INT NOT NULL,
    FOREIGN KEY (QuizId) REFERENCES Quiz(Id) ON DELETE CASCADE
);

CREATE TABLE Answer (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    QuestionId INT NOT NULL,
    AnswerText NVARCHAR(MAX) NOT NULL,
    IsCorrect BIT DEFAULT 0,
    FOREIGN KEY (QuestionId) REFERENCES Question(Id) ON DELETE CASCADE
);
