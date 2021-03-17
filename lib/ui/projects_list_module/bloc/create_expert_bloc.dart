import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coleman/domain/models/projects.dart';
import 'package:coleman/domain/repositories/project_repository.dart';
import 'package:injectable/injectable.dart';

import 'create_expert_event.dart';
import 'create_expert_state.dart';

@singleton
class CreateExpertBloc extends Bloc<CreateExpertEvent, CreateExpertState> {
  final ProjectRepository _projectRepository;
  List<ProjectModel> projects = [];

  CreateExpertBloc(ProjectRepository projectRepository)
      : _projectRepository = projectRepository,
        super(const CreateExpertState.progress()) {
     _projectRepository.loadProjects().then((value) {
      projects = value.projects;
      emit(CreateExpertState.initial(projects));
    });
  }

  @override
  Stream<CreateExpertState> mapEventToState(
    CreateExpertEvent event,
  ) async* {
    yield* event.when(
        search: (searchText) async* {
          final filteredList = projects.where((element) => element.name.toLowerCase().contains(searchText.toLowerCase())).toList();
          yield CreateExpertState.initial(filteredList);
        },
        clearSearch: () async* {},
        showDetails: () async* {},
        create: () async* {});
  }
}
