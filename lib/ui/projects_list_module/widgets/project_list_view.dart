import 'package:coleman/common/platform_util.dart';
import 'package:coleman/domain/models/projects.dart';
import 'package:coleman/navigation/navigation.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/dimens.dart';
import 'package:coleman/ui/common/icons.dart';
import 'package:coleman/ui/common/resources.dart';
import 'package:coleman/ui/common/styles.dart';
import 'package:coleman/ui/common/constants.dart';
import 'package:coleman/ui/projects_list_module/bloc/create_expert_bloc.dart';
import 'package:coleman/ui/projects_list_module/bloc/create_expert_event.dart';
import 'package:coleman/ui/projects_list_module/bloc/create_expert_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateExpertBloc, CreateExpertState>(
        builder: (ctx, state) {
          return MaterialApp(
            theme: UIConstants.materialTheme,
            home: Scaffold(
              appBar: _getAppBar(context),
              body: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    _searchWidget(context: context, state: state),
                    state.when(initial: (List<ProjectModel> projectList) {
                      return _projectsListWidget(projectList, context);
                    }, progress: () {
                      return const CircularProgressIndicator();
                    }, error: () {
                      return Text(Resources.projects_error);
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
                Text(Resources.projects_header),
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

  Widget _searchWidget(
      {required BuildContext context, required CreateExpertState state}) {
    return Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(Dimens.big),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.small),
            color: Colors.white,
          ),
          child: IgnorePointer(
            ignoring: state is! CreateExpertStateInitial,
            child: TextFormField(
              onChanged: (value) {
                context
                    .read<CreateExpertBloc>()
                    .add(CreateExpertEvent.search(value));
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: Resources.projects_search_hint,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: AppColors.light_gray,
                ),
                enabledBorder:
                _buildOutLineBorder(color: AppColors.light_purple),
                focusedBorder:
                _buildOutLineBorder(color: AppColors.light_purple),
              ),
            ),
          ),
        ));
  }

  Widget _projectsListWidget(
      List<ProjectModel> projectList, BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: projectList.length,
        physics: PlatformUtil.isWeb() ? const ClampingScrollPhysics() : null,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(top: Dimens.normal),
              child: _projectWidget(projectList[index], context),
            );
          } else {
            return _projectWidget(projectList[index], context);
          }
        },
      ),
    );
  }

  Widget _projectWidget(ProjectModel project, BuildContext context) {
    return GestureDetector(
        onTap: () {
          _openProjectExpertsScreen(project.name, context);
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.small),
          ),
          margin: const EdgeInsets.only(bottom: Dimens.normal),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.big),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        const BorderSide(color: AppColors.outlinedButtonColor)),
                  ),
                  child: Text(
                    '${project.status.name.toUpperCase()}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onPressed: null,
                ),
                const SizedBox(height: Dimens.small),
                Text(
                  '${project.name}',
                  style: AppStyles.headerBoldBlack(context),
                ),
                const SizedBox(height: Dimens.small),
                Text(Resources.projects_created_on +
                    '${project.createdOn}'),
                const SizedBox(height: Dimens.small),
                Text('${project.description.internal}'),
                const SizedBox(height: Dimens.medium),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(Resources.projects_primary_contact),
                            const SizedBox(height: Dimens.small),
                            Text('${project.primaryContact.fullName}'),
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(Resources.projects_industry),
                            const SizedBox(height: Dimens.small),
                            ...project.industries.map((e) {
                              return Text(
                                '${e.name}',
                                style: const TextStyle(height: 1.3),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 32),
                const Text(Resources.projects_visible_to),
                const SizedBox(height: Dimens.small),
                Text(
                  '${project.projectLead.fullName}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: AppColors.blue),
                ),
                const SizedBox(height: Dimens.medium),
              ],
            ),
          ),
        ));
  }

  OutlineInputBorder _buildOutLineBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.micro),
      borderSide: BorderSide(color: color),
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