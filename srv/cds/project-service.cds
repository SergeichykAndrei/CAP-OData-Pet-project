using com.andreis.pet.project.capodata as my from '../../db/index';

@endpoints: [
{path : '/api/v1/projects', protocol: 'odata-v4'}, // -> /odata/v4/api/v1/projects
{path : '/api/v1/projects', protocol: 'odata-v2'} // -> /odata/v2/api/v1/projects
]
@Core.SchemaVersion : '1.0'
service ProjectService {

    @readonly
    entity Projects as projection on my.Projects excluding {
        createdBy,
        modifiedBy
    }

    @(requires: 'Display')
    function getProjects(employeeId: String not null) returns array of ProjectDto;

    type ProjectDto {
        id: String;
        name: String;
    }
}