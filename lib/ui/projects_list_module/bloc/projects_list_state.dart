import 'package:coleman/domain/models/projects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'projects_list_state.freezed.dart';

@freezed
class ProjectsListState with _$ProjectsListState {
  factory ProjectsListState.initial(List<ProjectModel> projectList) = ProjectsListStateInitial;
  const factory ProjectsListState.progress() = ProjectsListStateProgress;
  const factory ProjectsListState.error() = ProjectsListStateError;
}

