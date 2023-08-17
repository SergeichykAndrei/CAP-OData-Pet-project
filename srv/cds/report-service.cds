using com.andreis.pet.project.capodata as my from '../../db/index';

@endpoints: [
{path : '/api/v1/reporting', protocol: 'odata-v4'}, // -> /odata/v4/api/v1/reporting
{path : '/api/v1/reporting', protocol: 'odata-v2'} // -> /odata/v2/api/v1/reporting
]
@Core.SchemaVersion : '1.0'
service ReportService @(requires: 'any') {
    entity ReportsModel as projection on my.Reports;

    @readonly
    entity Projects as projection on my.Projects excluding {
        createdBy,
        modifiedBy
    }

    @readonly
    entity Employees as projection on my.Employees excluding {
        createdBy,
        modifiedBy
    }
}