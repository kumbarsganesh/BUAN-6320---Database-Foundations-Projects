Create database gpa;
use gpa;
drop database gpa;
CREATE TABLE `customer` (
  `Customer_id` varchar(255) PRIMARY KEY,
  `Customer_name` varchar(255),
  `Customer_address` varchar(255),
  `Customer_phno` integer,
  `Customer_State_id` long,
  `Emergency_contact` integer,
  `created_at` timestamp
);

CREATE TABLE `employees` (
  `Employee_id` varchar(255) PRIMARY KEY,
  `Employee_name` varchar(255),
  `Employee_address` varchar(255),
  `Employee_Phno` integer,
  `Employee_SSN` varchar(255),
  `Employee_type` varchar(255),
  `Joining_date` date,
  `Emergency_contact` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `membership` (
  `membership_id` VARCHAR(255) PRIMARY KEY,
  `Customer_id` varchar(255),
  `Joining_date` date,
  `Membership_type` varchar(255),
  `Expiry_date` date,
  `created_at` timestamp
);

CREATE TABLE `Inventory` (
  `Serial_no` varchar(255) PRIMARY KEY,
  `Product_id` varchar(255),
  `Product_type` varchar(255),
  `gun_id` varchar(255),
  `Product_quantity` integer,
  `Employee_id` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `gun` (
  `Gun_ID` varchar(255) PRIMARY KEY,
  `Issue_date` date,
  `Model` varchar(255),
  `Caliber` varchar(255),
  `Fire_type` varchar(255),
  `Advance_paid` integer,
  `created_at` timestamp
);

CREATE TABLE `gun_service` (
  `Service_id` varchar(255) PRIMARY KEY,
  `Service_date` date,
  `Service_time` integer,
  `Gun_ID` varchar(255),
  `Bill_id` varchar(255),
  `next_service_date` date,
  `created_at` timestamp
);

CREATE TABLE `customer_Register` (
  `Booking_id` varchar(255) PRIMARY KEY,
  `Customer_id` varchar(255),
  `gun_id` varchar(255),
  `Register_date` datetime,
  `in_time` timestamp,
  `out_time` timestamp
);

CREATE TABLE `Management_register` (
  `Employee_id` varchar(255) PRIMARY KEY,
  `Register_date` datetime,
  `in_time` timestamp,
  `out_time` timestamp
);

CREATE TABLE `Appointments` (
  `Booking_id` varchar(255) PRIMARY KEY,
  `customer_id` varchar(255),
  `Appointment_date` date,
  `Appointment_time` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `Payment` (
  `Payment_id` varchar(255) PRIMARY KEY,
  `Booking_id` varchar(255),
  `bill_amount` integer,
  `balance_amount` integer,
  `Payment_type` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `Salaries` (
  `Instructor_id` varchar(255) PRIMARY KEY,
  `Employee_id` varchar(255),
  `Instructor_name` varchar(255),
  `Emergency_contact` integer,
  `Instructor_type` varchar(255),
  `Experience` integer,
  `created_at` timestamp
);

CREATE TABLE `Instructor` (
  `Instructor_id` varchar(255) PRIMARY KEY,
  `Instructor_name` varchar(255),
  `Employee_id` varchar(255),
  `Customer_id` varchar(255),
  `Emergency_contact` integer,
  `Instructor_type` varchar(255),
  `Experience` integer,
  `created_at` timestamp
);

ALTER TABLE `membership` ADD FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`);

ALTER TABLE `customer_Register` ADD FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`);

ALTER TABLE `Appointments` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`Customer_id`);

ALTER TABLE `Management_register` ADD FOREIGN KEY (`Employee_id`) REFERENCES `employees` (`Employee_id`);

ALTER TABLE `Salaries` ADD FOREIGN KEY (`Employee_id`) REFERENCES `employees` (`Employee_id`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`booking_id`) REFERENCES `customer_Register` (`Booking_id`);

ALTER TABLE `gun_service` ADD FOREIGN KEY (`Gun_ID`) REFERENCES `gun` (`Gun_ID`);

ALTER TABLE `Inventory` ADD FOREIGN KEY (`gun_id`) REFERENCES `gun` (`Gun_ID`);

ALTER TABLE `customer_register` ADD FOREIGN KEY (`gun_id`) REFERENCES `gun` (`Gun_ID`);


ALTER TABLE `Instructor` ADD FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`);

ALTER TABLE `Instructor` ADD FOREIGN KEY (`Employee_id`) REFERENCES `employees` (`Employee_id`);
SELECT 'mysql' dbms,t.TABLE_SCHEMA,t.TABLE_NAME,c.COLUMN_NAME,c.ORDINAL_POSITION,c.DATA_TYPE,c.CHARACTER_MAXIMUM_LENGTH,n.CONSTRAINT_TYPE,k.REFERENCED_TABLE_SCHEMA,k.REFERENCED_TABLE_NAME,k.REFERENCED_COLUMN_NAME FROM INFORMATION_SCHEMA.TABLES t LEFT JOIN INFORMATION_SCHEMA.COLUMNS c ON t.TABLE_SCHEMA=c.TABLE_SCHEMA AND t.TABLE_NAME=c.TABLE_NAME LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE k ON c.TABLE_SCHEMA=k.TABLE_SCHEMA AND c.TABLE_NAME=k.TABLE_NAME AND c.COLUMN_NAME=k.COLUMN_NAME LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS n ON k.CONSTRAINT_SCHEMA=n.CONSTRAINT_SCHEMA AND k.CONSTRAINT_NAME=n.CONSTRAINT_NAME AND k.TABLE_SCHEMA=n.TABLE_SCHEMA AND k.TABLE_NAME=n.TABLE_NAME WHERE t.TABLE_TYPE='BASE TABLE' AND t.TABLE_SCHEMA NOT IN('INFORMATION_SCHEMA','mysql','performance_schema');