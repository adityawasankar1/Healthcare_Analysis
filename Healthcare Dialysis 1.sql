-- KPI 1
select sum(`Number of patients included in the transfusion summary`) as Transfusion_Summary,
sum(`Number of patients in hypercalcemia summary`) as Hypercalcemia_summary,
sum(`Number of patients in Serum phosphorus summary`) as Serumphosphorus_summary,
sum(`Number of patients included in hospitalization summary`) as Hospitalization_summary,
sum(`Number hospitalizations included hospital readmission summary`) as Readmission_summary,
sum(`Number of Patients included in survival summary`) as Survival_summary,
sum(`Number of Patients included in fistula summary`) as Fistula_summary,
sum(`Number of patients in long term catheter summary`) as catheter_summary,
sum(`Number of patients in nPCR summary`) as nPCR_summary from healthcare_data;

-- KPI 2
SELECT `Profit or Non-Profit`,
  SUM(CASE 
    WHEN `Profit or Non-Profit` = 'profit' THEN 1
    ELSE 0
  END) as profit,
  SUM(CASE 
    WHEN `Profit or Non-Profit` = 'non-profit' THEN 1
    ELSE 0
  END) as nonprofit
FROM healthcare_data
GROUP BY `Profit or Non-Profit`;

-- KPI3
SELECT `Chain Organization`, SUM(`Total Performance Score`)
FROM healthcare_data
GROUP BY `Chain Organization`
ORDER BY SUM(`Total Performance Score`) DESC
LIMIT 10;

-- KPI 4
SELECT count(`# of Dialysis Stations`), `State`
FROM healthcare_data
GROUP BY `State`
order by count(`# of Dialysis Stations`) desc;

-- KPI 5
SELECT 
  COUNT(`Patient Transfusion category text`) AS Patient_Transfusion,
  COUNT(`Patient hospitalization category text`) AS Patient_hospitalization,
  COUNT(`Patient Survival Category Text`) AS Patient_Survival,
  COUNT(`Patient Infection category text`) AS Patient_Infection,
  COUNT(`Fistula Category Text`) AS Fistula,
  COUNT(`SWR category text`) AS SWR,
  COUNT(`PPPW category text`) AS PPPW
FROM 
  healthcare_data
WHERE 
  `Patient Transfusion category text` = 'As Expected'
  AND `Patient Survival Category Text` = 'As Expected'
  AND `Patient Infection category text` = 'As Expected'
  AND `Fistula Category Text` = 'As Expected'
  AND `SWR category text` = 'As Expected'
  AND `PPPW category text` = 'As Expected';

-- KPI 6
SELECT ROUND(AVG(`PY2020 Payment Reduction Percentage`) * 100, 3) AS Average_Payment_Reduction_Rate
FROM healthcare_data;




