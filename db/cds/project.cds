namespace com.andreis.pet.project.capodata;

using { cuid, managed } from '@sap/cds/common';
using com.andreis.pet.project.capodata.EmployeesProjects from './employee_project';

@assert.unique: {projectName: [name]}
entity Projects : cuid, managed {
    name  : String(50) @mandatory;
    discription : String(50);
    employees : association to many EmployeesProjects on employees.project = $self;
}