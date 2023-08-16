namespace com.andreis.pet.project.capodata;

entity Projects {
    key id : Integer;
    name  : String(50);
    employees : association to many EmployeesProjects on employees.project = $self;
}

entity Employees {
    key id : Integer;
    name : String(50);
    projects : association to many EmployeesProjects on projects.employee = $self;
}

entity EmployeesProjects {
    key project : Association to Projects;
    key employee : Association to Employees;
    role : String(50);
}

entity Reports {
    key id: Integer;
    project: Association to Projects;
    employee: Association to Employees;
    createdAt: DateTime;
    description: String;
}