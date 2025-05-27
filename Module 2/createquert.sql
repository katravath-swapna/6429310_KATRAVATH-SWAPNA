CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    city VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    city VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status ENUM('upcoming', 'completed', 'cancelled'),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

CREATE TABLE Session (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    title VARCHAR(200) NOT NULL,
    speaker_name VARCHAR(200) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Registration (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_id INT,
    registration_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
);

CREATE TABLE Resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    resource_type ENUM('pdf', 'image', 'link'),
    resource_url VARCHAR(25) NOT NULL,
    uploaded_at DATETIME NOT NULL
);
