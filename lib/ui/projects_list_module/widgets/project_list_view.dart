import 'package:coleman/common/platform_util.dart';
import 'package:coleman/domain/models/projects.dart';
import 'package:coleman/navigation/navigation.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/dimens.dart';
import 'package:coleman/ui/common/icons.dart';
import 'package:coleman/ui/common/resources.dart';
import 'package:coleman/ui/common/styles.dart';
import 'package:coleman/ui/common/constants.dart';
import 'package:coleman/ui/projects_list_module/bloc/projects_list_bloc.dart';
import 'package:coleman/ui/projects_list_module/bloc/projects_list_state.dart';
import 'package:coleman/ui/projects_list_module/widgets/project_widget.dart';
import 'package:coleman/ui/projects_list_module/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsListBloc, ProjectsListState>(
        builder: (ctx, state) {
          return MaterialApp(
            theme: UIConstants.materialTheme,
            home: Scaffold(
              appBar: _getAppBar(context),
              body: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    SearchWidget.getWidget(context, state),
                    const SizedBox(height: 10),
                    state.when(initial: (List<ProjectModel> projectList) {
                      return _projectsListWidget(projectList, context);
                    }, progress: () {
                      return const CircularProgressIndicator();
                    }, error: () {
                      return const Text(Resources.projects_error);
                    }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Container(height: 24, child: Image.asset(AppIcons.logo_url)),
      bottom: _headerWidget(context),
    );
  }

  AppBar _headerWidget(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(Dimens.normal),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.small),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(Resources.projects_header),
                ElevatedButton(
                  onPressed: () {
                    print('On Pressed');
                  },
                  child: Text(
                    Resources.projects_create_project,
                    style: AppStyles.redButtonTextStyle(context),
                  ),
                  style: AppStyles.redButtonStyle(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _projectsListWidget(
      List<ProjectModel> projectList, BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: projectList.length,
        physics: PlatformUtil.isWeb() ? const ClampingScrollPhysics() : null,
        itemBuilder: (ctx, index) {
          return ProjectWidget(projectList[index], context, _openProjectExpertsScreen);
        },
      ),
    );
  }

  void _openProjectExpertsScreen(String name, BuildContext context) {
    FocusScope.of(context).focusedChild?.unfocus();
    Navigator.pushNamed(
      context,
      AppNavigation.EXPERTS,
      arguments: name,
    );
  }
}