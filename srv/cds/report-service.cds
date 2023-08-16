using com.andreis.pet.project.capodata as my from '../../db/data-model';

@endpoints: [
{path : '/api/v1/reporting', protocol: 'odata-v4'}, // -> /odata/v4/api/v1/reporting
{path : '/api/v1/reporting', protocol: 'odata-v2'} // -> /odata/v2/api/v1/reporting
]
@Core.SchemaVersion : '1.0'
service ReportService {
    entity ReportsModel as projection on my.Reports
}