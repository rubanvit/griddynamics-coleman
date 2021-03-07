import 'package:coleman/domain/models/project.dart';

abstract class ProjectRepository {
  Future<Project> getProjectById(int id);
}
