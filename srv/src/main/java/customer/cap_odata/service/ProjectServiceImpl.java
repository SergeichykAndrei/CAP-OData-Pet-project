package customer.cap_odata.service;

import cds.gen.com.andreis.pet.project.capodata.Projects;
import cds.gen.com.andreis.pet.project.capodata.Projects_;
import com.sap.cds.ql.Select;
import com.sap.cds.services.persistence.PersistenceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final PersistenceService persistenceService;


    @Override
    public List<Projects> getProjects(Integer employeeId) {
        return persistenceService
                .run(
                        Select.from(Projects_.class)
                                .where(
                                        project ->
                                                project.employees().employee_id()
                                                        .eq(employeeId)))
                .listOf(Projects.class);
    }
}
