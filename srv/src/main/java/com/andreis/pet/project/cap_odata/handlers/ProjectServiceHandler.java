package com.andreis.pet.project.cap_odata.handlers;

import cds.gen.com.andreis.pet.project.capodata.Projects;
import cds.gen.projectservice.GetProjectsContext;
import cds.gen.projectservice.ProjectDto;
import cds.gen.projectservice.ProjectService_;
import com.andreis.pet.project.cap_odata.service.ProjectService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Component
@RequiredArgsConstructor
@ServiceName(ProjectService_.CDS_NAME)
public class ProjectServiceHandler implements EventHandler {

    private final ProjectService projectService;

    @On(event = GetProjectsContext.CDS_NAME)
    public void getProjects(GetProjectsContext context) {
        List<ProjectDto> projects = projectService.getProjects(context.getEmployeeId())
                .stream().map(this::convertToProjectDto)
                .collect(Collectors.toList());

        context.setResult(projects);
        context.setCompleted();
    }

    private ProjectDto convertToProjectDto(Projects project) {
        ProjectDto projectDto = ProjectDto.create();
        projectDto.setId(project.getId());
        projectDto.setName(project.getName());
        return projectDto;
    }
}
