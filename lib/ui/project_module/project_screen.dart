import 'package:coleman/injection.dart';
import 'package:coleman/resources/colors.dart';
import 'package:coleman/resources/project_resources.dart';
import 'package:coleman/ui/project_module/bloc/experts_bloc.dart';
import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:coleman/ui/project_module/widgets/template_list_widget.dart';
import 'package:coleman/ui/project_module/widgets/experts_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/ui_constants.dart';

class ProjectScreen extends StatelessWidget {
  late String projectName;

  ProjectScreen(this.projectName);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: UIConstants.materialTheme,
        home: SafeArea(
          child: Scaffold(
              appBar: _getAppBar(context),
              body: BlocProvider(
                  lazy: false,
                  create: (context) => getIt<ExpertsCubit>(),
                  child: _getPageContent())),
        ));
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: AppColors.appbarMenuButtonColor,
        onPressed: () {},
      ),
      centerTitle: true,
      title: Container(
          height: 24, child: Image.asset('assets/images/logo_coleman.png')),
      bottom: _getPageHeader(context),
    );
  }

  AppBar _getPageHeader(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.white,
        title: Text(projectName),
        leading: Container(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.black),
                color: AppColors.appbarMenuButtonColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              VerticalDivider(width: 8, thickness: 1, endIndent: 8, indent: 8),
            ],
          ),
        ));
  }

  Widget _getPageContent() {
    return BlocBuilder<ExpertsCubit, ExpertsState>(builder: (_, state) {
      if (state is ExpertsStateEmpty) {
        return TemplateExpertsList.asEmpty(projectName);
      } else if (state is ExpertsStateProcessing) {
        return TemplateExpertsList.asProgress(projectName);
      } else if (state is ExpertsStateSuccessful) {
        return TemplateExpertsList.withResults(projectName, state);
      } else {
        return TemplateExpertsList.asError(projectName);
      }
    });
  }
}
