
import 'package:coleman/domain/models/experts_list.dart';
import 'package:coleman/domain/models/projects.dart';
import 'package:coleman/domain/models/projects_list.dart';

abstract class ProjectRepository {

  Future<ProjectModel?> getProjectById(int id);

  Future<ProjectsListModel> loadProjects();

  Future<ExpertsListModel> loadExperts();
}
