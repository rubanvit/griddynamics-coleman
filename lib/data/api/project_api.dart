import 'package:coleman/data/serializable/experts_list.dart';
import 'package:coleman/data/serializable/projects.dart';
import 'package:coleman/data/serializable/projects_list.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ProjectApi {

  Future<Project?> getProjectById(int id) async {
    final String stringResult = await rootBundle.loadString('assets/mocks/projects.json');
    final ProjectsList projectsList = ProjectsList.fromJson(json.decode(stringResult));
    final result = projectsList.projects.firstWhere((element) => element.id==id);
    return result;
  }

  Future<ProjectsList> loadProjects() async {
    final String stringResult = await rootBundle.loadString('assets/mocks/projects.json');
    final ProjectsList result = ProjectsList.fromJson(json.decode(stringResult));
    return result;
  }

  Future<ExpertsList> loadExperts() async {
    final String stringResult = await rootBundle.loadString('assets/mocks/experts.json');
    final ExpertsList result = ExpertsList.fromJson(json.decode(stringResult));
    return result;
  }
}
