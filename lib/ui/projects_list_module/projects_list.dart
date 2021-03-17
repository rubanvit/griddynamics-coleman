import 'package:coleman/injection.dart';
import 'package:coleman/ui/projects_list_module/bloc/projects_list_bloc.dart';
import 'package:coleman/ui/projects_list_module/widgets/project_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProjectsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt.get<ProjectsListBloc>(),
      child: ProjectsListView(),
    );
  }
}
