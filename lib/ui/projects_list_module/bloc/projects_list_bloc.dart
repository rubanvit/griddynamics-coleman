import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coleman/domain/models/projects.dart';
import 'package:coleman/domain/repositories/project_repository.dart';
import 'package:injectable/injectable.dart';

import 'projects_list_event.dart';
import 'projects_list_state.dart';

@singleton
class ProjectsListBloc extends Bloc<ProjectsListEvent, ProjectsListState> {
  final ProjectRepository _projectRepository;
  List<ProjectModel> projects = [];

  ProjectsListBloc(ProjectRepository projectRepository)
      : _projectRepository = projectRepository,
        super(const ProjectsListState.progress()) {
     _projectRepository.loadProjects().then((value) {
      projects = value.projects;
      emit(ProjectsListState.initial(projects));
    });
  }

  @override
  Stream<ProjectsListState> mapEventToState(
    ProjectsListEvent event,
  ) async* {
    yield* event.when(
        search: (searchText) async* {
          final filteredList = projects.where((element) => element.name.toLowerCase().contains(searchText.toLowerCase())).toList();
          yield ProjectsListState.initial(filteredList);
        },
        clearSearch: () async* {},
        showDetails: () async* {},
        create: () async* {});
  }
}
