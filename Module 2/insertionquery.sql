--1.	Users
INSERT INTO Users (user_id, full_name, email, city, registration_date) VALUES
(1, 'Ravi Shankar', 'ravi.shankar@example.com', 'Bangalore', '2025-01-08'),
(2, 'Meena Devi', 'meena.devi@example.com', 'Mysore', '2025-01-12'),
(3, 'Gopal Krishna', 'gopal.krishna@example.com', 'Hubli', '2025-01-18'),
(4, 'Anjali Menon', 'anjali.menon@example.com', 'Kochi', '2025-02-02'),
(5, 'Vignesh Iyer', 'vignesh.iyer@example.com', 'Trivandrum', '2025-02-12'),
(6, 'Sneha Balan', 'sneha.balan@example.com', 'Bangalore', '2025-02-18'),
(7, 'Manoj Pillai', 'manoj.pillai@example.com', 'Mangalore', '2025-02-22'),
(8, 'Priya Varma', 'priya.varma@example.com', 'Calicut', '2025-03-03'),
(9, 'Suresh Reddy', 'suresh.reddy@example.com', 'Hyderabad', '2025-03-12'),
(10, 'Lakshmi Narayan', 'lakshmi.narayan@example.com', 'Vijayawada', '2025-03-15');

--2.Events
INSERT INTO Events (event_id, title, description, city, start_date, end_date, status, organizer_id) VALUES
(1, 'South India Innovators Meet', 'Innovation showcase from southern states.', 'Bangalore', '2025-07-12 09:30:00', '2025-07-12 18:00:00', 'upcoming', 1),
(2, 'GreenTech Forum', 'Eco-friendly technologies in farming.', 'Mysore', '2025-06-18 10:00:00', '2025-06-18 16:30:00', 'completed', 2),
(3, 'Hubli Hackathon', '48-hour coding challenge.', 'Hubli', '2025-08-03 08:00:00', '2025-08-04 20:00:00', 'upcoming', 3),
(4, 'Women in Robotics', 'Celebrating women in robotics and automation.', 'Kochi', '2025-07-22 09:00:00', '2025-07-22 14:00:00', 'upcoming', 4),
(5, 'Digital Safety Camp', 'Tips and tools for digital safety.', 'Trivandrum', '2025-07-07 11:00:00', '2025-07-07 15:00:00', 'upcoming', 5),
(6, 'ML & AI Bootcamp', 'A hands-on AI bootcamp.', 'Bangalore', '2025-06-28 09:00:00', '2025-06-29 17:30:00', 'completed', 6),
(7, 'Vue.js Developer Day', 'Vue.js intensive workshop.', 'Mangalore', '2025-08-12 10:00:00', '2025-08-12 17:00:00', 'upcoming', 7),
(8, 'Responsible AI', 'Accountability in AI systems.', 'Calicut', '2025-08-18 09:00:00', '2025-08-18 12:00:00', 'upcoming', 8),
(9, 'DevOps Simplified', 'Understanding DevOps tools.', 'Hyderabad', '2025-07-29 10:00:00', '2025-07-29 14:00:00', 'upcoming', 9),
(10, 'Open Source Connect', 'Collaborating in open source.', 'Vijayawada', '2025-08-22 09:00:00', '2025-08-22 13:00:00', 'upcoming', 10);

--3.Sessions
INSERT INTO Sessions (session_id, event_id, title, speaker_name, start_time, end_time) VALUES
(1, 1, 'Inaugural Talk', 'Dr. Ashok Reddy', '2025-07-12 09:30:00', '2025-07-12 10:15:00'),
(2, 2, 'Eco Farming Advances', 'Meena Devi', '2025-06-18 10:30:00', '2025-06-18 12:00:00'),
(3, 3, 'Hackathon Rules & Setup', 'Gopal Krishna', '2025-08-03 08:00:00', '2025-08-03 09:30:00'),
(4, 4, 'Robotics and Diversity', 'Anjali Menon', '2025-07-22 09:30:00', '2025-07-22 10:45:00'),
(5, 5, 'Stay Safe Online', 'Vignesh Iyer', '2025-07-07 11:00:00', '2025-07-07 12:30:00'),
(6, 6, 'ML with Python', 'Sneha Balan', '2025-06-28 09:15:00', '2025-06-28 12:15:00'),
(7, 7, 'Vue Composition API', 'Manoj Pillai', '2025-08-12 10:00:00', '2025-08-12 12:30:00'),
(8, 8, 'Ethics in AI Design', 'Priya Varma', '2025-08-18 09:15:00', '2025-08-18 10:45:00'),
(9, 9, 'CI/CD Best Practices', 'Suresh Reddy', '2025-07-29 10:15:00', '2025-07-29 11:45:00'),
(10, 10, 'Power of Contribution', 'Lakshmi Narayan', '2025-08-22 09:00:00', '2025-08-22 10:30:00');





--4. Registration
INSERT INTO Registrations (registration_id, user_id, event_id, registration_date) VALUES
(1, 1, 1, '2025-06-10'),
(2, 2, 2, '2025-06-05'),
(3, 3, 3, '2025-07-15'),
(4, 4, 4, '2025-06-25'),
(5, 5, 5, '2025-06-28'),
(6, 6, 6, '2025-06-20'),
(7, 7, 7, '2025-07-25'),
(8, 8, 8, '2025-08-01'),
(9, 9, 9, '2025-07-05'),
(10, 10, 10, '2025-08-05');

--5. Feedback
INSERT INTO Feedback (feedback_id, user_id, event_id, rating, comments, feedback_date) VALUES
(1, 2, 2, 5, 'Great insight on sustainable farming.', '2025-06-19'),
(2, 4, 4, 4, 'Very encouraging session.', '2025-07-23'),
(3, 6, 6, 5, 'Detailed and easy to follow.', '2025-06-29'),
(4, 3, 3, 5, 'Fun and challenging.', '2025-08-05'),
(5, 5, 5, 3, 'Good but could be more interactive.', '2025-07-07'),
(6, 8, 8, 5, 'Critical discussion well done.', '2025-08-18'),
(7, 9, 9, 4, 'Clear and concise.', '2025-07-29'),
(8, 10, 10, 5, 'Inspirational and collaborative.', '2025-08-22'),
(9, 1, 1, 4, 'Nice way to start the day.', '2025-07-12'),
(10, 7, 7, 5, 'Awesome workshop!', '2025-08-12');



--6.Resources
INSERT INTO Resources (resource_id, event_id, resource_type, resource_url, uploaded_at) VALUES
(1, 1, 'pdf', 'https://portal.com/resources/southindia_meet2025.pdf', '2025-07-05 11:00:00'),
(2, 2, 'image', 'https://portal.com/resources/greentech_forum_poster.jpg', '2025-06-12 10:00:00'),
(3, 3, 'link', 'https://portal.com/resources/hubli_hackathon_guide', '2025-07-28 13:00:00'),
(4, 4, 'pdf', 'https://portal.com/resources/robotics_women_speakers.pdf', '2025-07-20 10:30:00'),
(5, 5, 'pdf', 'https://portal.com/resources/digital_safety_handbook.pdf', '2025-07-02 09:00:00'),
(6, 6, 'video', 'https://portal.com/resources/ml_ai_bootcamp.mp4', '2025-06-27 14:00:00'),
(7, 7, 'code', 'https://portal.com/resources/vuejs_samples.zip', '2025-08-07 09:30:00'),
(8, 8, 'pdf', 'https://portal.com/resources/ai_responsibility.pdf', '2025-08-12 11:00:00'),
(9, 9, 'link', 'https://portal.com/resources/devops_basics', '2025-07-24 08:45:00'),
(10, 10, 'image', 'https://portal.com/resources/opensource_event_banner.jpg', '2025-08-16 12:00:00');
