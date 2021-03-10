import 'package:coleman/injection.dart';
import 'package:coleman/ui/project_module/bloc/experts_bloc.dart';
import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:coleman/ui/project_module/project_resources.dart';
import 'package:coleman/ui/project_module/widgets/empty_list_widget.dart';
import 'package:coleman/ui/project_module/widgets/error_widget.dart';
import 'package:coleman/ui/project_module/widgets/experts_list_widget.dart';
import 'package:coleman/ui/project_module/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui_constants.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: UIConstants.materialTheme,
        home: Scaffold(
            appBar: _getAppBar(),
            body: BlocProvider(
                lazy: false,
                create: (context) => getIt<ExpertsCubit>(),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: _getLeftTabBarView(),
                ))));
  }

  AppBar _getAppBar() {
    return AppBar(
      title: Text(ProjectResources.appName),
    );
  }

  Widget _getLeftTabBarView() {
    return BlocBuilder<ExpertsCubit, ExpertsState>(builder: (_, state) {
      if (state is ExpertsStateEmpty) {
        return EmptyExpertsList();
      } else if (state is ExpertsStateProcessing) {
        return ProgressExpertsList();
      } else if (state is ExpertsStateSuccessful) {
        return ExpertsListWidget(state);
      } else {
        return ErrorExpertsList();
      }
    });
  }
}
