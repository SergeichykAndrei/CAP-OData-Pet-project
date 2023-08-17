
DROP VIEW IF EXISTS ReportService_Employees;
DROP VIEW IF EXISTS ReportService_Projects;
DROP VIEW IF EXISTS ReportService_ReportsModel;
DROP VIEW IF EXISTS ProjectService_Projects;
DROP TABLE IF EXISTS com_andreis_pet_project_capodata_Employees;
DROP TABLE IF EXISTS com_andreis_pet_project_capodata_EmployeesProjects;
DROP TABLE IF EXISTS com_andreis_pet_project_capodata_Projects;
DROP TABLE IF EXISTS com_andreis_pet_project_capodata_Reports;

CREATE TABLE com_andreis_pet_project_capodata_Reports (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  project_ID NVARCHAR(36),
  employee_ID NVARCHAR(36),
  description NVARCHAR(255),
  PRIMARY KEY(ID),
  CONSTRAINT com_andreis_pet_project_capodata_Reports_projectEmployee UNIQUE (project_ID, employee_ID)
); 

CREATE TABLE com_andreis_pet_project_capodata_Projects (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  name NVARCHAR(50),
  PRIMARY KEY(ID),
  CONSTRAINT com_andreis_pet_project_capodata_Projects_projectName UNIQUE (name)
); 

CREATE TABLE com_andreis_pet_project_capodata_EmployeesProjects (
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  project_ID NVARCHAR(36) NOT NULL,
  employee_ID NVARCHAR(36) NOT NULL,
  role INTEGER,
  PRIMARY KEY(project_ID, employee_ID)
); 

CREATE TABLE com_andreis_pet_project_capodata_Employees (
  ID NVARCHAR(36) NOT NULL,
  createdAt TIMESTAMP(7),
  createdBy NVARCHAR(255),
  modifiedAt TIMESTAMP(7),
  modifiedBy NVARCHAR(255),
  name NVARCHAR(50),
  PRIMARY KEY(ID),
  CONSTRAINT com_andreis_pet_project_capodata_Employees_employeeName UNIQUE (name)
); 

CREATE VIEW ProjectService_Projects AS SELECT
  Projects_0.ID,
  Projects_0.createdAt,
  Projects_0.modifiedAt,
  Projects_0.name
FROM com_andreis_pet_project_capodata_Projects AS Projects_0; 

CREATE VIEW ReportService_ReportsModel AS SELECT
  Reports_0.ID,
  Reports_0.createdAt,
  Reports_0.createdBy,
  Reports_0.modifiedAt,
  Reports_0.modifiedBy,
  Reports_0.project_ID,
  Reports_0.employee_ID,
  Reports_0.description
FROM com_andreis_pet_project_capodata_Reports AS Reports_0; 

CREATE VIEW ReportService_Projects AS SELECT
  Projects_0.ID,
  Projects_0.createdAt,
  Projects_0.modifiedAt,
  Projects_0.name
FROM com_andreis_pet_project_capodata_Projects AS Projects_0; 

CREATE VIEW ReportService_Employees AS SELECT
  Employees_0.ID,
  Employees_0.createdAt,
  Employees_0.modifiedAt,
  Employees_0.name
FROM com_andreis_pet_project_capodata_Employees AS Employees_0; 

