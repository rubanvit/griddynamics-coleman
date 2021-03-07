import 'package:coleman/data/api/project_api.dart';
import 'package:coleman/domain/models/project.dart';
import 'package:coleman/domain/repositories/project_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProjectRepository)
@dev
class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectApi projectApi = ProjectApi();

  @override
  Future<Project> getProjectById(int id) async {
    return await projectApi.getProjectById(id);
  }
}
