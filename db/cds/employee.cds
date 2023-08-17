namespace com.andreis.pet.project.capodata;

using { cuid, managed } from '@sap/cds/common';
using com.andreis.pet.project.capodata.EmployeesProjects from './employee_project';

@assert.unique: {employeeName: [name]}
entity Employees : cuid, managed {
    name : String(50) @mandatory;
    projects : association to many EmployeesProjects on projects.employee = $self;
}