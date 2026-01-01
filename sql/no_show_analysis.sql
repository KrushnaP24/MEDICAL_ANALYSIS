1️⃣ Total Appointments & No-Show %
SELECT 
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(
        SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS no_show_percentage
FROM hospital_appointments;




2️⃣ Department-wise No-Show
SELECT 
    department,
    COUNT(*) AS total,
    SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) AS no_show_count
FROM hospital_appointments
GROUP BY department
ORDER BY no_show_count DESC;




3️⃣ Age Group Analysis
SELECT 
    CASE
        WHEN age < 18 THEN '0-17'
        WHEN age BETWEEN 18 AND 35 THEN '18-35'
        WHEN age BETWEEN 36 AND 60 THEN '36-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS appointments,
    SUM(CASE WHEN no_show = 'Yes' THEN 1 ELSE 0 END) AS no_shows
FROM hospital_appointments
GROUP BY age_group;




4️⃣ Revenue Loss 
SELECT 
    SUM(consultation_fee) AS potential_revenue_loss
FROM hospital_appointments
WHERE no_show = 'Yes';