--1. User Upcoming Events
--Show a list of all upcoming events a user is registered for in their city, sorted by date.

SELECT 
    u.full_name,
    e.title AS event_title,
    e.city,
    e.start_date
FROM 
    Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE 
    e.status = 'upcoming' 
    AND u.city = e.city
ORDER BY 
    e.start_date;

--2. Top Rated Events
--Identify events with the highest average rating, considering only those that have received at least 10 feedback submissions.

SELECT 
    e.event_id,
    e.title,
    AVG(f.rating) AS average_rating,
    COUNT(f.feedback_id) AS total_feedbacks
FROM 
    Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY 
    e.event_id, e.title
HAVING 
    COUNT(f.feedback_id) >= 10
ORDER BY 
    average_rating DESC;
Note: With current sample data, no event has 10 feedbacks. This query is designed for real-world scale.

--3. Inactive Users
--Retrieve users who have not registered for any events in the last 90 days (from today’s date, assumed '2025-05-26').

SELECT 
    u.user_id,
    u.full_name,
    u.email
FROM 
    Users u
LEFT JOIN Registrations r 
    ON u.user_id = r.user_id 
    AND r.registration_date >= DATE('2025-05-26') - INTERVAL 90 DAY
WHERE 
    r.registration_id IS NULL;

--4. Peak Session Hours
--Count how many sessions are scheduled between 10 AM to 12 PM for each event.

SELECT 
    e.event_id,
    e.title,
    COUNT(s.session_id) AS sessions_between_10_12
FROM 
    Events e
JOIN Sessions s ON e.event_id = s.event_id
WHERE 
    TIME(s.start_time) >= '10:00:00' 
    AND TIME(s.start_time) < '12:00:00'
GROUP BY 
    e.event_id, e.title;

--5. Most Active Cities
--List the top 5 cities with the highest number of distinct user registrations.

SELECT 
    u.city,
    COUNT(DISTINCT r.user_id) AS total_users
FROM 
    Users u
JOIN Registrations r ON u.user_id = r.user_id
GROUP BY 
    u.city
ORDER BY 
    total_users DESC
LIMIT 5;


--6. Event Resource Summary
--Generate a report showing the number of resources (PDFs, images, links) uploaded for each event.
SELECT 
    e.event_id,
    e.title,
    SUM(CASE WHEN r.resource_type = 'pdf' THEN 1 ELSE 0 END) AS pdf_count,
    SUM(CASE WHEN r.resource_type = 'image' THEN 1 ELSE 0 END) AS image_count,
    SUM(CASE WHEN r.resource_type = 'link' THEN 1 ELSE 0 END) AS link_count
FROM 
    Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
GROUP BY 
    e.event_id, e.title;

--7. Low Feedback Alerts

SELECT 
    u.full_name,
    e.title AS event_title,
    f.rating,
    f.comments
FROM 
    Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE 
    f.rating < 3;

--8. Sessions per Upcoming Event

SELECT 
    e.title AS event_title,
    COUNT(s.session_id) AS session_count
FROM 
    Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE 
    e.status = 'upcoming'
GROUP BY 
    e.event_id, e.title;

--9. Organizer Event Summary

SELECT 
    u.full_name AS organizer_name,
    e.status,
    COUNT(e.event_id) AS event_count
FROM 
    Events e
JOIN Users u ON e.organizer_id = u.user_id
GROUP BY 
    u.full_name, e.status;


--10. Feedback Gap

SELECT 
    e.event_id,
    e.title
FROM 
    Events e
JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
GROUP BY 
    e.event_id, e.title
HAVING 
    COUNT(f.feedback_id) = 0;

--11. Daily New User Count
--(Assuming today is '2025-05-26')

SELECT 
    registration_date,
    COUNT(user_id) AS new_users
FROM 
    Users
WHERE 
    registration_date >= DATE('2025-05-26') - INTERVAL 7 DAY
GROUP BY 
    registration_date
ORDER BY 
    registration_date;


--12. Event with Maximum Sessions

SELECT 
    e.event_id,
    e.title,
    COUNT(s.session_id) AS session_count
FROM 
    Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY 
    e.event_id, e.title
HAVING 
    COUNT(s.session_id) = (
        SELECT MAX(session_total)
        FROM (
            SELECT COUNT(session_id) AS session_total
            FROM Sessions
            GROUP BY event_id
        ) AS counts
    );

--13. Average Rating per City

SELECT 
    e.city,
    AVG(f.rating) AS average_rating
FROM 
    Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY 
    e.city;

--14. Most Registered Events

SELECT 
    e.title,
    COUNT(r.user_id) AS total_registrations
FROM 
    Events e
JOIN Registrations r ON e.event_id = r.event_id
GROUP BY 
    e.event_id, e.title
ORDER BY 
    total_registrations DESC
LIMIT 3;

--15. Event Session Time Conflict

SELECT 
    s1.event_id,
    s1.session_id AS session1_id,
    s2.session_id AS session2_id,
    s1.title AS session1_title,
    s2.title AS session2_title
FROM 
    Sessions s1
JOIN Sessions s2 
    ON s1.event_id = s2.event_id 
    AND s1.session_id < s2.session_id
    AND s1.start_time < s2.end_time
    AND s2.start_time < s1.end_time;

--16. Unregistered Active Users

SELECT 
    u.user_id,
    u.full_name,
    u.registration_date
FROM 
    Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
WHERE 
    u.registration_date >= DATE('2025-05-26') - INTERVAL 30 DAY
    AND r.registration_id IS NULL;

--17. Multi-Session Speakers

SELECT 
    speaker_name,
    COUNT(session_id) AS session_count
FROM 
    Sessions
GROUP BY 
    speaker_name
HAVING 
    COUNT(session_id) > 1;

--18. Resource Availability Check

SELECT 
    e.event_id,
    e.title
FROM 
    Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
WHERE 
    r.resource_id IS NULL;

--19. Completed Events with Feedback Summary

SELECT 
    e.title AS event_title,
    COUNT(DISTINCT r.registration_id) AS total_registrations,
    AVG(f.rating) AS average_rating
FROM 
    Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE 
    e.status = 'completed'
GROUP BY 
    e.event_id, e.title;

--20. User Engagement Index

SELECT 
    u.user_id,
    u.full_name,
    COUNT(DISTINCT r.event_id) AS events_attended,
    COUNT(DISTINCT f.feedback_id) AS feedback_submitted
FROM 
    Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
LEFT JOIN Feedback f ON u.user_id = f.user_id
GROUP BY 
    u.user_id, u.full_name;

--21. Top Feedback Providers

SELECT 
    u.user_id,
    u.full_name,
    COUNT(f.feedback_id) AS feedback_count
FROM 
    Users u
JOIN Feedback f ON u.user_id = f.user_id
GROUP BY 
    u.user_id, u.full_name
ORDER BY 
    feedback_count DESC
LIMIT 5;

--22. Duplicate Registrations Check

SELECT 
    user_id,
    event_id,
    COUNT(*) AS registration_count
FROM 
    Registrations
GROUP BY 
    user_id, event_id
HAVING 
    COUNT(*) > 1;

--23. Registration Trends

SELECT 
    DATE_FORMAT(registration_date, '%Y-%m') AS month,
    COUNT(*) AS registration_count
FROM 
    Registrations
WHERE 
    registration_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY 
    month
ORDER BY 
    month;

--24. Average Session Duration per Event

SELECT 
    e.title AS event_title,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time)), 2) AS avg_duration_minutes
FROM 
    Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY 
    e.event_id, e.title;

--25. Events Without Sessions

SELECT 
    e.event_id,
    e.title
FROM 
    Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE 
    s.session_id IS NULL;
