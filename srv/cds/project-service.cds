@endpoints: [
{path : '/api/v1/projects', protocol: 'odata-v4'}, // -> /odata/v4/api/v1/projects
{path : '/api/v1/projects', protocol: 'odata-v2'} // -> /odata/v2/api/v1/projects
]
@Core.SchemaVersion : '1.0'
service ProjectService {

     type ProjectDto {
        id: Integer;
        name: String;
    }

    function getProjects(employeeId: Integer not null) returns array of ProjectDto;
}