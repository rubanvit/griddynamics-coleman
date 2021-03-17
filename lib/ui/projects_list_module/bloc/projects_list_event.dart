
import 'package:freezed_annotation/freezed_annotation.dart';
part 'projects_list_event.freezed.dart';

@freezed
class ProjectsListEvent with _$ProjectsListEvent {
  const factory ProjectsListEvent.search(String searchText) = ProjectsListEventSearch;
  const factory ProjectsListEvent.clearSearch() = ProjectsListEventClearSearch;
  const factory ProjectsListEvent.showDetails() = ProjectsListEventShowDetails;
  const factory ProjectsListEvent.create() = ProjectsListEventCreate;
}
