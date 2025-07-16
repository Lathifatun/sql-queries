-- 1. Tabel Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    PlantName VARCHAR(50)
);

-- 2. Tabel Instructor (mengacu ke Employee)
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,  
    Expertise VARCHAR(100),
    FOREIGN KEY (InstructorID) REFERENCES Employee(EmployeeID)
);

-- 3. Tabel TrainingCourse
CREATE TABLE TrainingCourse (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    DurationHours INT NOT NULL
);

-- 4. Tabel TrainingSession
CREATE TABLE TrainingSession (
    SessionID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT NOT NULL,
    InstructorID INT NOT NULL,
    SessionDate DATE NOT NULL,
    Location VARCHAR(100),
    FOREIGN KEY (CourseID) REFERENCES TrainingCourse(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- 5. Tabel ParticipationRecord
CREATE TABLE ParticipationRecord (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    SessionID INT NOT NULL,
    AttendedDate DATE NOT NULL,
    Passed BIT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (SessionID) REFERENCES TrainingSession(SessionID)
);
