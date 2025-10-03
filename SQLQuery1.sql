create database hospital
go
use hospital
go

CREATE TABLE Company (
    CompanyID      INT PRIMARY KEY,
    Name           VARCHAR(100) NOT NULL,
    Address        VARCHAR(200),
    PhoneNumber    VARCHAR(20)
)

CREATE TABLE Drugs (
    CompanyID      INT,
    TradeName      VARCHAR(100),
    DrugStrength   VARCHAR(50),
    PRIMARY KEY (CompanyID, TradeName, DrugStrength),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
        ON DELETE CASCADE
)

CREATE TABLE Prescription (
    PrescriptionID       INT PRIMARY KEY,
    PrescriptionDate     DATE NOT NULL,
    Quantity             INT NOT NULL,
    DosageInstructions   VARCHAR(200),
    CompanyID            INT,
    TradeName            VARCHAR(100),
    DrugStrength         VARCHAR(50),
    FOREIGN KEY (CompanyID, TradeName, DrugStrength)
    REFERENCES Drugs(CompanyID, TradeName, DrugStrength)
    ON DELETE CASCADE
)

CREATE TABLE Doctor (
    DoctorID        INT PRIMARY KEY,
    FirstName       VARCHAR(50) NOT NULL,
    LastName        VARCHAR(50) NOT NULL,
    Email           VARCHAR(100),
    PhoneNumber     VARCHAR(20),
    Specialty       VARCHAR(100),
    YearsExperience INT,
    PrescriptionID  INT,
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID)
)

CREATE TABLE Patient (
    URNumber       INT PRIMARY KEY,
    Name           VARCHAR(100) NOT NULL,
    Address        VARCHAR(200),
    Age            INT,
    PhoneNumber    VARCHAR(20),
    Email          VARCHAR(100),
    NumberOfCard   VARCHAR(50),
    DoctorID       INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
)


INSERT INTO Company (CompanyID, Name, Address, PhoneNumber) VALUES
(1, 'PharmaOne', 'Cairo, Egypt', '0100000001'),
(2, 'MediLife', 'Alexandria, Egypt', '0100000002'),
(3, 'HealthPlus', 'Giza, Egypt', '0100000003'),
(4, 'BioCare', 'Mansoura, Egypt', '0100000004'),
(5, 'GlobalMed', 'Tanta, Egypt', '0100000005'),
(6, 'CureWell', 'Aswan, Egypt', '0100000006'),
(7, 'WellnessPharma', 'Suez, Egypt', '0100000007'),
(8, 'LifeLine', 'Luxor, Egypt', '0100000008'),
(9, 'MediTrust', 'Fayoum, Egypt', '0100000009'),
(10, 'CarePlus', 'Ismailia, Egypt', '0100000010'),
(11, 'NovaPharma', 'Minya, Egypt', '0100000011'),
(12, 'PharmaTrust', 'Zagazig, Egypt', '0100000012'),
(13, 'MediLink', 'Port Said, Egypt', '0100000013'),
(14, 'BioPharm', 'Beni Suef, Egypt', '0100000014'),
(15, 'ElixirMed', 'Sharm El Sheikh, Egypt', '0100000015')


INSERT INTO Drugs (CompanyID, TradeName, DrugStrength) VALUES
(1, 'Paracetamol', '500mg'),
(1, 'Ibuprofen', '200mg'),
(2, 'Amoxicillin', '250mg'),
(2, 'Ciprofloxacin', '500mg'),
(3, 'Omeprazole', '20mg'),
(3, 'Metformin', '500mg'),
(4, 'Atorvastatin', '10mg'),
(5, 'Aspirin', '100mg'),
(6, 'Azithromycin', '500mg'),
(7, 'Clarithromycin', '250mg'),
(8, 'Diclofenac', '50mg'),
(9, 'Losartan', '50mg'),
(10, 'Salbutamol', '2mg'),
(11, 'Cetirizine', '10mg'),
(12, 'Furosemide', '40mg'),
(13, 'Levothyroxine', '75mcg')






INSERT INTO Prescription (PrescriptionID, PrescriptionDate, Quantity, DosageInstructions, CompanyID, TradeName, DrugStrength) VALUES
(1, '2025-01-01', 10, 'Take 1 tablet twice daily', 1, 'Paracetamol', '500mg'),
(2, '2025-01-02', 20, 'Take 1 tablet every 8 hours', 1, 'Ibuprofen', '200mg'),
(3, '2025-01-03', 15, 'Take 1 capsule three times daily', 2, 'Amoxicillin', '250mg'),
(4, '2025-01-04', 7, 'Take 1 tablet twice daily', 2, 'Ciprofloxacin', '500mg'),
(5, '2025-01-05', 14, 'Take 1 capsule daily before breakfast', 3, 'Omeprazole', '20mg'),
(6, '2025-01-06', 30, 'Take 1 tablet with meals', 3, 'Metformin', '500mg'),
(7, '2025-01-07', 10, 'Take 1 tablet daily', 4, 'Atorvastatin', '10mg'),
(8, '2025-01-08', 25, 'Take 1 tablet daily', 5, 'Aspirin', '100mg'),
(9, '2025-01-09', 12, 'Take 1 tablet once daily', 6, 'Azithromycin', '500mg'),
(10, '2025-01-10', 18, 'Take 1 tablet twice daily', 7, 'Clarithromycin', '250mg'),
(11, '2025-01-11', 10, 'Take 1 tablet after meals', 8, 'Diclofenac', '50mg'),
(12, '2025-01-12', 14, 'Take 1 tablet daily', 9, 'Losartan', '50mg'),
(13, '2025-01-13', 20, 'Inhale twice daily', 10, 'Salbutamol', '2mg'),
(14, '2025-01-14', 15, 'Take 1 tablet daily', 11, 'Cetirizine', '10mg'),
(15, '2025-01-15', 30, 'Take 1 tablet daily', 12, 'Furosemide', '40mg')




INSERT INTO Doctor (DoctorID, FirstName, LastName, Email, PhoneNumber, Specialty, YearsExperience, PrescriptionID) VALUES
(1, 'Ahmed', 'Hassan', 'ahmed.hassan@hospital.com', '0101111111', 'Cardiology', 12, 1),
(2, 'Sara', 'Ali', 'sara.ali@hospital.com', '0101111112', 'Dermatology', 8, 2),
(3, 'Omar', 'Khaled', 'omar.khaled@hospital.com', '0101111113', 'Neurology', 10, 3),
(4, 'Mona', 'Hussein', 'mona.hussein@hospital.com', '0101111114', 'Endocrinology', 15, 4),
(5, 'Hany', 'Tarek', 'hany.tarek@hospital.com', '0101111115', 'Orthopedics', 7, 5),
(6, 'Yasmin', 'Mostafa', 'yasmin.mostafa@hospital.com', '0101111116', 'Pediatrics', 9, 6),
(7, 'Karim', 'Said', 'karim.said@hospital.com', '0101111117', 'Psychiatry', 11, 7),
(8, 'Nour', 'Samir', 'nour.samir@hospital.com', '0101111118', 'Oncology', 14, 8),
(9, 'Mohamed', 'Fathy', 'mohamed.fathy@hospital.com', '0101111119', 'ENT', 6, 9),
(10, 'Aya', 'Reda', 'aya.reda@hospital.com', '0101111120', 'Ophthalmology', 10, 10),
(11, 'Mostafa', 'Youssef', 'mostafa.youssef@hospital.com', '0101111121', 'Nephrology', 13, 11),
(12, 'Laila', 'Adel', 'laila.adel@hospital.com', '0101111122', 'Rheumatology', 5, 12),
(13, 'Samir', 'Kamal', 'samir.kamal@hospital.com', '0101111123', 'Urology', 18, 13),
(14, 'Hoda', 'Mahmoud', 'hoda.mahmoud@hospital.com', '0101111124', 'Hematology', 16, 14),
(15, 'Eslam', 'Nader', 'eslam.nader@hospital.com', '0101111125', 'Gastroenterology', 20, 15)




INSERT INTO Patient (URNumber, Name, Address, Age, PhoneNumber, Email, NumberOfCard, DoctorID) VALUES
(1, 'Ali Mohamed', 'Cairo', 30, '0120000001', 'ali.mohamed@mail.com', 'CARD001', 1),
(2, 'Salma Tarek', 'Alexandria', 25, '0120000002', 'salma.tarek@mail.com', 'CARD002', 2),
(3, 'Omar Hany', 'Giza', 40, '0120000003', 'omar.hany@mail.com', 'CARD003', 3),
(4, 'Nour Adel', 'Mansoura', 35, '0120000004', 'nour.adel@mail.com', 'CARD004', 4),
(5, 'Hassan Ali', 'Tanta', 28, '0120000005', 'hassan.ali@mail.com', 'CARD005', 5),
(6, 'Mariam Fathy', 'Aswan', 22, '0120000006', 'mariam.fathy@mail.com', 'CARD006', 6),
(7, 'Youssef Nader', 'Suez', 29, '0120000007', 'youssef.nader@mail.com', 'CARD007', 7),
(8, 'Farah Samir', 'Luxor', 33, '0120000008', 'farah.samir@mail.com', 'CARD008', 8),
(9, 'Mahmoud Khaled', 'Fayoum', 41, '0120000009', 'mahmoud.khaled@mail.com', 'CARD009', 9),
(10, 'Aya Mostafa', 'Ismailia', 27, '0120000010', 'aya.mostafa@mail.com', 'CARD010', 10),
(11, 'Ola Hassan', 'Minya', 36, '0120000011', 'ola.hassan@mail.com', 'CARD011', 11),
(12, 'Karim Lotfy', 'Zagazig', 31, '0120000012', 'karim.lotfy@mail.com', 'CARD012', 12),
(13, 'Lina Gamal', 'Port Said', 24, '0120000013', 'lina.gamal@mail.com', 'CARD013', 13),
(14, 'Eman Salah', 'Beni Suef', 38, '0120000014', 'eman.salah@mail.com', 'CARD014', 14),
(15, 'Adel Ibrahim', 'Sharm El Sheikh', 45, '0120000015', 'adel.ibrahim@mail.com', 'CARD015', 15);







