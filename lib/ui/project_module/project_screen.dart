import 'package:coleman/injection.dart';
import 'package:coleman/navigation/navigation.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/icons.dart';
import 'package:coleman/ui/common/constants.dart';
import 'package:coleman/ui/project_module/bloc/experts_bloc.dart';
import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:coleman/ui/project_module/widgets/template_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectScreen extends StatelessWidget {
  static const routeName = AppNavigation.EXPERTS;

  late String projectName = "";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    projectName = arguments == null ? "" : arguments as String;

    return MaterialApp(
        theme: UIConstants.materialTheme,
        home: Scaffold(
            appBar: _getAppBar(context),
            body: SafeArea(
              child: BlocProvider(
                  lazy: false,
                  create: (context) => getIt<ExpertsCubit>(),
                  child: _getPageContent()),
            )));
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Container(
          height: 24, child: Image.asset(AppIcons.logo_url)),
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
                icon: const Icon(Icons.arrow_back, color: AppColors.black),
                color: AppColors.appbarMenuButtonColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const VerticalDivider(width: 8, thickness: 1, endIndent: 8, indent: 8),
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
