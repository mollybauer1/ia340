CREATE TABLE IF NOT EXISTS professor
(
    p_email VARCHAR(50) NOT NULL,
    p_name VARCHAR(100) NOT NULL,
    office VARCHAR(10) NOT NULL UNIQUE,
    PRIMARY KEY(p_email)
);

CREATE TABLE IF NOT EXISTS student
(
    s_email VARCHAR(10) NOT NULL,
    s_name VARCHAR(100) NOT NULL,
    major VARCHAR(10),
    PRIMARY KEY(s_email)
);

CREATE TABLE IF NOT EXISTS course
(
    c_number VARCHAR(10) NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    room VARCHAR(10) NOT NULL,
    p_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(c_number)
);

CREATE TABLE IF NOT EXISTS enroll_list
(
    s_email VARCHAR(10) NOT NULL,
    c_number VARCHAR(10) NOT NULL,
    PRIMARY KEY(s_email, c_number)
);


-- Create FKs
ALTER TABLE course
    ADD    FOREIGN KEY (p_email)
    REFERENCES professor(p_email)
    MATCH SIMPLE
;
   
ALTER TABLE enroll_list
    ADD CONSTRAINT FK_lab2
    FOREIGN KEY (s_email)
    REFERENCES student(s_email)
    MATCH SIMPLE
;
   
ALTER TABLE enroll_list
    ADD    FOREIGN KEY (c_number)
    REFERENCES course(c_number)
    MATCH SIMPLE
;  

-- Create Indexes

