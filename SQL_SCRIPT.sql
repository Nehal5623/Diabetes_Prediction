use nehaldb;



SELECT  AVG (BMI) AS AVERAGE_BMI
 FROM diabetes_prediction;
 
 SELECT EmployeeName, Patient_id,hypertension ,diabetes
 FROM diabetes_prediction
 WHERE hypertension = 1 AND diabetes = 1;
 
 SELECT COUNT(*)
 FROM diabetes_prediction
 WHERE heart_disease = 1;
 
 SELECT smoking_history, COUNT(*) 
 FROM diabetes_prediction
 GROUP BY smoking_history ;
 
 
 SELECT Patient_id, bmi
 FROM diabetes_prediction
 WHERE bmi > ( SELECT AVG (bmi) FROM diabetes_prediction);
 
 SELECT EmployeeName,Patient_id, HbA1c_level
 FROM diabetes_prediction
 WHERE HbA1c_level =( SELECT MAX(HbA1c_level) FROM diabetes_prediction); 

SELECT EmployeeName,Patient_id, HbA1c_level
 FROM diabetes_prediction
 WHERE HbA1c_level =( SELECT MIN(HbA1c_level) FROM diabetes_prediction); 
 
 SELECT EmployeeName, Patient_id, age
 FROM diabetes_prediction;
 SELECT
 EmployeeName,
  Patient_id,
    gender,
    blood_glucose_level,
    RANK() OVER (PARTITION BY gender ORDER BY blood_glucose_level) AS Glucose_Level_Rank
FROM
    diabetes_prediction;
    
UPDATE  diabetes_prediction
SET smoking_history = "Ex-smoker" 
WHERE age > 50;

INSERT INTO 
diabetes_prediction (EmployeeName, Patient_id, gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, 
blood_glucose_level, diabetes)
VALUES ("Nehal", "PT-1099", "Female", 20, 1, 0, 0, 35,100, 100, 0 );