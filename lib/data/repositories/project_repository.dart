import 'package:coleman/data/api/project_api.dart';
import 'package:coleman/domain/models/experts_list.dart';
import 'package:coleman/domain/models/projects.dart';
import 'package:coleman/domain/models/projects_list.dart';
import 'package:coleman/domain/repositories/project_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProjectRepository)
class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectApi projectApi = ProjectApi();

  @override
  Future<ProjectModel?> getProjectById(int id) async {
    final apiResult = await projectApi.getProjectById(id);
    return apiResult?.toDomain();
  }

  @override
  Future<ProjectsListModel> loadProjects() async {
    final apiResult = await projectApi.loadProjects();
    return apiResult.toDomain();
  }

  @override
  Future<ExpertsListModel> loadExperts() async {
    final apiResult = await projectApi.loadExperts();
    return apiResult.toDomain();
  }
}
