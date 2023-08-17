namespace com.andreis.pet.project.capodata;

using { cuid, managed } from '@sap/cds/common';
using com.andreis.pet.project.capodata.Projects from './project';
using com.andreis.pet.project.capodata.Employees from './employee';

@assert.unique: {projectEmployee: [project, employee]}
entity Reports : cuid, managed {
    project: Association to Projects @mandatory @assert.target;
    employee: Association to Employees @mandatory @assert.target;
    description: String;
}

annotate Reports with
@PersonalData : {
    DataSubjectRole : 'Report',
    EntitySemantics : 'DataSubject'
}
{
  ID    @PersonalData.FieldSemantics : 'DataSubjectID';
};

annotate Reports with
@AuditLog.Operation : { Read : true, Insert : true, Update : true, Delete : true };