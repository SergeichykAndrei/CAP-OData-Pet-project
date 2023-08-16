
DROP VIEW IF EXISTS ReportService_ReportsModel;
DROP TABLE IF EXISTS com_andreis_pet_project_capodata_Reports;
DROP TABLE IF EXISTS com_andreis_pet_project_capodata_EmployeesProjects;
DROP TABLE IF EXISTS com_andreis_pet_project_capodata_Employees;
DROP TABLE IF EXISTS com_andreis_pet_project_capodata_Projects;

CREATE TABLE com_andreis_pet_project_capodata_Projects (
  id INTEGER NOT NULL,
  name NVARCHAR(50),
  PRIMARY KEY(id)
); 

CREATE TABLE com_andreis_pet_project_capodata_Employees (
  id INTEGER NOT NULL,
  name NVARCHAR(50),
  PRIMARY KEY(id)
); 

CREATE TABLE com_andreis_pet_project_capodata_EmployeesProjects (
  project_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  role NVARCHAR(50),
  PRIMARY KEY(project_id, employee_id)
); 

CREATE TABLE com_andreis_pet_project_capodata_Reports (
  id INTEGER NOT NULL,
  project_id INTEGER,
  employee_id INTEGER,
  createdAt TIMESTAMP(0),
  description NVARCHAR(255),
  PRIMARY KEY(id)
); 

CREATE VIEW ReportService_ReportsModel AS SELECT
  Reports_0.id,
  Reports_0.project_id,
  Reports_0.employee_id,
  Reports_0.createdAt,
  Reports_0.description
FROM com_andreis_pet_project_capodata_Reports AS Reports_0; 

