package customer.cap_odata.service;

import cds.gen.com.andreis.pet.project.capodata.Projects;
import jakarta.validation.constraints.NotNull;

import java.util.List;

public interface ProjectService {

    List<Projects> getProjects(@NotNull Integer employeeId);
}
