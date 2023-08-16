using com.andreis.pet.project.capodata as my from '../../db/data-model';

@endpoints: [
{path : '/api/v1/reporting', protocol: 'odata-v4'}, // -> /odata/v4/api/v1/reporting
{path : '/api/v1/reporting', protocol: 'odata-v2'} // -> /odata/v2/api/v1/reporting
]
@Core.SchemaVersion : '1.0'
service ReportService {
    entity ReportsModel as projection on my.Reports
    {
        key id;
        property project_id @odata.bindable: true;
        property employee_id @odata.bindable: true;
        property createdAt @Validation.Minimum("2023-01-01T00:00:00Z") @Validation.Maximum("2023-12-31T23:59:59Z");
        property description @Validation.Required;
    }
}