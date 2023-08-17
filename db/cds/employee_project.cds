namespace com.andreis.pet.project.capodata;

using { cuid, managed } from '@sap/cds/common';
using com.andreis.pet.project.capodata.Projects from './project';
using com.andreis.pet.project.capodata.Employees from './employee';

entity EmployeesProjects : managed {
    key project : Association to Projects @mandatory @assert.target;
    key employee : Association to Employees @mandatory @assert.target;
    role : Role;
}

type Role : Integer enum {
    Developer  = 1;
    Manager  = 2;
}