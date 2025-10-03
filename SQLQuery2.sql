--1 SELECT: Retrieve all columns from the Doctor table.

SELECT * 
FROM Doctor
--2 ORDER BY: List patients in the Patient table in ascending order of their ages.
SELECT *
FROM Patient
ORDER BY Age ASC
--3 ORDER BY: List patients in the Patient table in ascending order of their ages.
SELECT * 
FROM Patient
ORDER BY URNumber
OFFSET 4 ROWS 
FETCH NEXT 10 ROWS ONLY
--4SELECT TOP: Retrieve the top 5 doctors from the Doctor table.


SELECT TOP 5 *
FROM Doctor

--5SELECT DISTINCT: Get a list of unique address from the Patient table.

SELECT DISTINCT Address 
FROM Patient

--6 WHERE: Retrieve patients from the Patient table who are aged 25.


SELECT * 
FROM Patient
WHERE Age = 25

--7NULL: Retrieve patients from the Patient table whose email is not provided.

SELECT * FROM Patient
WHERE Email IS NULL
--8 AND: Retrieve doctors from the Doctor table who have experience greater than 5 years and specialize in 'Cardiology'.


SELECT * 
FROM Doctor
WHERE YearsExperience > 5 AND Specialty = 'Cardiology'

-- 9 IN: Retrieve doctors from the Doctor table whose speciality is either 'Dermatology' or 'Oncology'.

SELECT * 
FROM Doctor
WHERE Specialty IN ('Dermatology', 'Oncology')
--10 BETWEEN: Retrieve patients from the Patient table whose ages are between 18 and 30.


SELECT * 
FROM Patient
WHERE Age BETWEEN 18 AND 30

--11LIKE: Retrieve doctors from the Doctor table whose names start with 'Dr.'.
SELECT * 
FROM Doctor
WHERE FirstName LIKE 'Dr.%'

--12 Column & Table Aliases: Select the name and email of doctors, aliasing them as 'DoctorName' and 'DoctorEmail'.

SELECT (FirstName + ' ' + LastName) AS DoctorName,Email AS DoctorEmail
FROM Doctor

--13  Joins: Retrieve all prescriptions with corresponding patient names.

SELECT p.Name AS PatientName, pr.PrescriptionID, pr.TradeName, pr.DrugStrength
FROM Patient p
JOIN Doctor d ON p.DoctorID = d.DoctorID
JOIN Prescription pr ON d.PrescriptionID = pr.PrescriptionID

--14 GROUP BY: Retrieve the count of patients grouped by their cities.

SELECT Address AS City, COUNT(*) AS PatientCount
FROM Patient
GROUP BY Address

--15 HAVING: Retrieve cities with more than 3 patients.

SELECT Address AS City, COUNT(*) AS PatientCount
FROM Patient
GROUP BY Address
HAVING COUNT(*) > 3

--16 GROUPING SETS: Retrieve counts of patients grouped by cities and ages.

SELECT Address, Age, COUNT(*) AS PatientCount
FROM Patient
GROUP BY GROUPING SETS ((Address), (Age))

--17 CUBE: Retrieve counts of patients considering all possible combinations of city and age.

SELECT Address, Age, COUNT(*) AS PatientCount
FROM Patient
GROUP BY CUBE (Address, Age)

--18 ROLLUP: Retrieve counts of patients rolled up by city.

SELECT Address, COUNT(*) AS PatientCount
FROM Patient
GROUP BY ROLLUP (Address)

--19 EXISTS: Retrieve patients who have at least one prescription.


SELECT * FROM Patient p
WHERE EXISTS (
    SELECT 1 FROM Doctor d
    WHERE d.DoctorID = p.DoctorID  AND d.PrescriptionID IS NOT NULL
)


--20UNION: Retrieve a combined list of doctors and patients.

SELECT FirstName AS Name, Email FROM Doctor
UNION
SELECT Name, Email FROM Patient

--21 Common Table Expression (CTE): Retrieve patients along with their doctors using a CTE.


WITH PatientDoctor AS (
    SELECT p.Name AS PatientName, d.FirstName + ' ' + d.LastName AS DoctorName
    FROM Patient p
    JOIN Doctor d ON p.DoctorID = d.DoctorID
)
SELECT * FROM PatientDoctor


--22 INSERT: Insert a new doctor into the Doctor table.

INSERT INTO Doctor (DoctorID, FirstName, LastName, Email, PhoneNumber, Specialty, YearsExperience, PrescriptionID)
VALUES (16, 'Tamer', 'Youssef', 'tamer.youssef@hospital.com', '0101111126', 'Cardiology', 9, 1)

--23 INSERT Multiple Rows: Insert multiple patients into the Patient table.



INSERT INTO Patient (URNumber, Name, Address, Age, PhoneNumber, Email, NumberOfCard, DoctorID) VALUES
(16, 'Khaled Samir', 'Cairo', 26, '0120000016', 'khaled.samir@mail.com', 'CARD016', 2),
(17, 'Nadia Fawzy', 'Alexandria', 32, '0120000017', 'nadia.fawzy@mail.com', 'CARD017', 3)


--24UPDATE: Update the phone number of a doctor.

UPDATE Doctor
SET PhoneNumber = '0109999999'
WHERE DoctorID = 1

--25 UPDATE JOIN: Update the city of patients who have a prescription from a specific doctor.


UPDATE p
SET Address = 'Cairo'
FROM Patient p
JOIN Doctor d ON p.DoctorID = d.DoctorID
WHERE d.FirstName = 'Ahmed'

-- 26 DELETE: Delete a patient from the Patient table.

DELETE FROM Patient
WHERE URNumber = 15

-- 27 Transaction: Insert a new doctor and a patient, ensuring both operations succeed or fail together.


BEGIN TRANSACTION;

INSERT INTO Doctor (DoctorID, FirstName, LastName, Email, PhoneNumber, Specialty, YearsExperience, PrescriptionID)
VALUES (17, 'Hossam', 'Adel', 'hossam.adel@hospital.com', '0101111127', 'Dermatology', 6, 2);

INSERT INTO Patient (URNumber, Name, Address, Age, PhoneNumber, Email, NumberOfCard, DoctorID)
VALUES (18, 'Reem Yasser', 'Giza', 29, '0120000018', 'reem.yasser@mail.com', 'CARD018', 17);

COMMIT TRANSACTION

-- 28 View: Create a view that combines patient and doctor information for easy access.

CREATE VIEW PatientDoctorView AS
SELECT p.Name AS PatientName, p.Age, d.FirstName + ' ' + d.LastName AS DoctorName, d.Specialty
FROM Patient p
JOIN Doctor d ON p.DoctorID = d.DoctorID

--29 Index: Create an index on the 'phone' column of the Patient table to improve search performance.

CREATE INDEX idx_patient_phone
ON Patient (PhoneNumber)

-- 30 Backup: Perform a backup of the entire database to ensure data safety.

BACKUP DATABASE YourDatabaseName
TO DISK = ''
