import 'dart:async' show Future;
import 'dart:convert';
import 'package:coleman/data/serializable/experts_list.dart';
import 'package:coleman/data/serializable/projects.dart';
import 'package:coleman/data/serializable/projects_list.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProjectApi {
  Future<Project?> getProjectById(int id) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    final String stringResult =
        await rootBundle.loadString('assets/mocks/projects.json');
    final ProjectsList projectsList = ProjectsList.fromJson(
        json.decode(stringResult) as Map<String, dynamic>);
    final result =
        projectsList.projects.firstWhere((element) => element.id == id);
    return result;
  }

  Future<ProjectsList> loadProjects() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    final String stringResult =
        await rootBundle.loadString('assets/mocks/projects.json');
    final ProjectsList result = ProjectsList.fromJson(
        json.decode(stringResult) as Map<String, dynamic>);
    return result;
  }

  Future<ExpertsList> loadExperts() async {
    await Future<void>.delayed(const Duration(seconds: 4));
    final String stringResult =
        await rootBundle.loadString('assets/mocks/experts.json');
    final ExpertsList result =
        ExpertsList.fromJson(json.decode(stringResult) as Map<String, dynamic>);
    return result;
  }
}
