
--TABLE: JOB_DEOARTMENT

CREATE TABLE job_department (
    job_ID        NUMBER(10)       PRIMARY KEY,
    job_dept      VARCHAR2(50)  NOT NULL,
    dept_name     VARCHAR2(100) NOT NULL,
    description   VARCHAR2(255),
    min_salary    NUMBER(10,2)  NOT NULL,
    max_salary    NUMBER(10,2)  NOT NULL

);




-- TABLE: SALARY_BONUS

CREATE TABLE salary_bonus (
    salary_ID   NUMBER(10)      PRIMARY KEY,
    job_ID      NUMBER(10) NOT NULL,
    amount      NUMBER(10,2) NOT NULL,
    annual      NUMBER(10,2) NOT NULL,
    bonus       NUMBER(10,2) DEFAULT 0 NOT NULL,


        FOREIGN KEY (job_ID)    
        REFERENCES job_department(job_ID),

        CHECK (amount > 0)
);



-- TABLE: EMPLOYEE

CREATE TABLE employee (
    emp_ID        NUMBER(10)    PRIMARY KEY,
    job_ID        NUMBER(10) NOT NULL,
    salary_ID     NUMBER(10) NOT NULL,
    fname         VARCHAR2(50)  NOT NULL,
    lname         VARCHAR2(50)  NOT NULL,
    gender        CHAR(1)       NOT NULL,
    age           NUMBER(3)     NOT NULL,
    emp_email     VARCHAR2(100) NOT NULL,
    emp_pass      VARCHAR2(100) NOT NULL,
    city          VARCHAR2(50)  NOT NULL,
    address       VARCHAR2(150) NOT NULL,
    phone_number  VARCHAR2(20)  NOT NULL,



        FOREIGN KEY (job_ID)
        REFERENCES job_department(job_ID),

        FOREIGN KEY (salary_ID)
        REFERENCES salary_bonus(salary_ID),

        CHECK (gender IN ('M', 'F'))
);




-- TABLE: QUALIFICATION

CREATE TABLE qualification (
    qual_ID       NUMBER(10)    PRIMARY KEY,
    emp_ID        NUMBER(10) NOT NULL,
    position_name VARCHAR2(100) NOT NULL,
    date_in       DATE NOT NULL,


        FOREIGN KEY (emp_ID)
        REFERENCES employee(emp_ID)
);




-- TABLE: QUALIFICATION_REQUIREMENTS

CREATE TABLE qualification_requirements (
    qual_ID      NUMBER(10) NOT NULL        PRIMARY KEY,
    requirement  VARCHAR2(200) NOT NULL,


        FOREIGN KEY (qual_ID)
        REFERENCES qualification(qual_ID)
);




-- TABLE: LEAVE

CREATE TABLE leave (
    leave_ID    NUMBER(10)      PRIMARY KEY,
    emp_ID      NUMBER(10) NOT NULL,
    start_date  DATE NOT NULL,
    end_date    DATE NOT NULL,
    reason      VARCHAR2(255) NOT NULL,


        FOREIGN KEY (emp_ID)
        REFERENCES employee(emp_ID),

        CHECK (end_date >= start_date)
);





-- TABLE: PAYROLL

CREATE TABLE payroll (
    payroll_ID    NUMBER(10)        PRIMARY KEY,
    emp_ID        NUMBER(10) NOT NULL,
    job_ID        NUMBER(10) NOT NULL,
    salary_ID     NUMBER(10) NOT NULL,
    report        VARCHAR2(500),
    payroll_date  DATE NOT NULL,
    total_amount  NUMBER(10,2) NOT NULL,

        FOREIGN KEY (emp_ID)
        REFERENCES employee(emp_ID),

        FOREIGN KEY (job_ID)
        REFERENCES job_department(job_ID),

        FOREIGN KEY (salary_ID)
        REFERENCES salary_bonus(salary_ID),

        CHECK (total_amount >= 0)
);

