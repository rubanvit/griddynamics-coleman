import 'package:coleman/create_expert/ui/bloc/create_expert_bloc.dart';
import 'package:coleman/domain/models/projects.dart';
import 'package:coleman/injection.dart';
import 'package:coleman/resources/colors.dart';
import 'package:coleman/resources/dimens.dart';
import 'package:coleman/resources/text_styles.dart';
import 'package:coleman/ui/project_module/project_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/create_expert_bloc.dart';
import 'bloc/create_expert_event.dart';
import 'bloc/create_expert_state.dart';

class CreateExpertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt.get<CreateExpertBloc>(),
      child: CreateExpertView(),
    );
  }
}

class CreateExpertView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateExpertBloc, CreateExpertState>(
        builder: (ctx, state) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _headerWidget(),
              _searchWidget(context: context, state: state),
              state.when(initial: (List<ProjectModel> projectList) {
                return _projectsListWidget(projectList, context);
              }, progress: () {
                return const CircularProgressIndicator();
              }, error: () {
                return const Text('error Happent');
              }),
            ],
          ),
        ),
      );
    });
  }

  Widget _headerWidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(Dimens.big),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.small),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Projects',
                style: AppTextStyle.headerBoldBlack,
              ),
              ElevatedButton(
                onPressed: () {
                  print('On Preseed');
                },
                child: const Text('Create Project'),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.dark_red,
                    textStyle: AppTextStyle.bodyBoldWhite),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _searchWidget(
      {required BuildContext context, required CreateExpertState state}) {
    return Container(
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
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
              color: AppColors.light_gray,
            ),
            enabledBorder: _buildOutLineBorder(color: AppColors.light_purple),
            focusedBorder: _buildOutLineBorder(color: AppColors.light_purple),
          ),
        ),
      ),
    );
  }

  Widget _projectsListWidget(List<ProjectModel> projectList, BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: projectList.length,
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
      onTap: (){_openProjectExpertsScreen(project.name, context);},
    child: Card(
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
                    BorderSide(color: AppColors.outlinedButtonColor)),
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
              style: AppTextStyle.headerBoldBlack,
            ),
            const SizedBox(height: Dimens.small),
            Text('CREATED ON: ${project.createdOn}'),
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
                        const Text('PRIMARY CONTACT'),
                        const SizedBox(height: Dimens.small),
                        Text('${project.primaryContact.fullName}'),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('INDUSTRY'),
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
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: Dimens.small),
            const Text('PROJECT VISIBLE TO:'),
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
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProjectScreen(name))
    );
  }
}
