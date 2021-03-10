import 'package:coleman/data/serializable/projects.dart';
import 'package:coleman/domain/models/projects_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projects_list.g.dart';

@JsonSerializable()
class ProjectsList {
  ProjectsList(this.projects);

  @JsonKey(name: 'projects')
  List<Project> projects;

  factory ProjectsList.fromJson(Map<String, dynamic> json) =>
      _$ProjectsListFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsListToJson(this);

  ProjectsListModel toDomain() {
    return ProjectsListModel(projects.map((e) => e.toDomain()).toList());
  }
}
