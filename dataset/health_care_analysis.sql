SHOW DATABASES;
SET GLOBAL local_infile = 1;
USE Healthcare_Analytics;
SHOW TABLES;
DESCRIBE patients;
USE Healthcare_Analytics;
SELECT COUNT(*) 
FROM patients;

SELECT *
FROM patients
LIMIT 10;
DESCRIBE patients;
SELECT COUNT(*) AS Total_Patients
FROM patients;
SELECT SUM(Total_Bill) AS Total_Revenue
FROM patients;
SELECT AVG(Hospital_Stay) AS Average_Stay
FROM patients;
SELECT
    Disease,
    COUNT(*) AS Patient_Count
FROM patients
GROUP BY Disease
ORDER BY Patient_Count DESC;
SELECT
    Department,
    SUM(Total_Bill) AS Revenue
FROM patients
GROUP BY Department
ORDER BY Revenue DESC;
SELECT
    Doctor,
    COUNT(*) AS Patients_Treated
FROM patients
GROUP BY Doctor
ORDER BY Patients_Treated DESC
LIMIT 10;
SELECT
    Payment_Mode,
    SUM(Total_Bill) AS Revenue
FROM patients
GROUP BY Payment_Mode;
SELECT
    Patient_ID,
    Patient_Name,
    Total_Bill
FROM patients
ORDER BY Total_Bill DESC
LIMIT 10;
SELECT
    Department,
    AVG(Feedback_Rating) AS Avg_Feedback
FROM patients
GROUP BY Department
ORDER BY Avg_Feedback DESC;
SELECT
    Department,
    SUM(Pending_Amount) AS Total_Pending
FROM patients
GROUP BY Department
ORDER BY Total_Pending DESC;
SELECT
Patient_ID,
Patient_Name,
Age,
Disease

FROM patients

WHERE Age > 60;
SELECT
Patient_Name,
Age,
Disease

FROM patients

WHERE Age BETWEEN 20 AND 40;
SELECT
Patient_Name,
City

FROM patients

WHERE City IN
(
'Bhubaneswar',
'Cuttack',
'Puri'
);
SELECT
Doctor

FROM patients

WHERE Doctor LIKE 'Dr. A%';
SELECT
Patient_Name,
Disease,
Department

FROM patients

WHERE Disease='Cancer';
SELECT
Patient_Name,
Total_Bill

FROM patients

WHERE Total_Bill>100000;
SELECT

Disease,

COUNT(*) AS Total_Patients

FROM patients

GROUP BY Disease

ORDER BY Total_Patients DESC;
SELECT

Disease,

SUM(Total_Bill) AS Revenue

FROM patients

GROUP BY Disease

ORDER BY Revenue DESC;
SELECT

Disease,

AVG(Age) AS Average_Age

FROM patients

GROUP BY Disease;
SELECT

Disease,

COUNT(*) AS Total

FROM patients

GROUP BY Disease

HAVING COUNT(*)>800;
SELECT

Patient_Name,

Age,

CASE

WHEN Age<18 THEN 'Child'

WHEN Age<=35 THEN 'Young Adult'

WHEN Age<=60 THEN 'Adult'

ELSE 'Senior'

END AS Age_Group

FROM patients;
SELECT

MONTHNAME(Admission_Date) AS Month,

COUNT(*) AS Patients

FROM patients

GROUP BY MONTHNAME(Admission_Date);
SELECT

MONTHNAME(Admission_Date) AS Month,

SUM(Total_Bill) AS Revenue

FROM patients

GROUP BY MONTHNAME(Admission_Date);
SELECT

Disease,

AVG(Hospital_Stay) AS Average_Stay

FROM patients

GROUP BY Disease

ORDER BY Average_Stay DESC;
SELECT

Patient_Name,

Disease,

Total_Bill

FROM patients

ORDER BY Total_Bill DESC

LIMIT 5;
SELECT

Doctor,

COUNT(*) AS Patients

FROM patients

GROUP BY Doctor

ORDER BY Patients DESC

LIMIT 10;
SELECT

Payment_Mode,

SUM(Total_Bill) AS Revenue

FROM patients

GROUP BY Payment_Mode;
SELECT

Insurance,

COUNT(*) AS Patients

FROM patients

GROUP BY Insurance;
SELECT

Department,

COUNT(*) AS Patients,

SUM(Total_Bill) AS Revenue,

AVG(Feedback_Rating) AS Rating

FROM patients

GROUP BY Department;





