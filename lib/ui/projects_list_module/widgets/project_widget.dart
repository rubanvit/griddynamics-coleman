import 'package:coleman/domain/models/projects.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/dimens.dart';
import 'package:coleman/ui/common/resources.dart';
import 'package:coleman/ui/common/styles.dart';
import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  ProjectModel project;
  Function(String name, BuildContext context) onItemClickCallback;
  BuildContext navigationContext;
  bool isWideScreen;

  ProjectWidget(
      {required this.project,
      required this.navigationContext,
      required this.onItemClickCallback,
      required this.isWideScreen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onItemClickCallback(project.name, navigationContext);
        },
        child: isWideScreen
            ? _getBigScreenLayout(context)
            : _getSmallScreenLayout(context));
  }

  Widget _getSmallScreenLayout(BuildContext context) {
    return Card(
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
            _getOpenButton(context),
            const SizedBox(height: Dimens.small),
            _getProjectName(context),
            const SizedBox(height: Dimens.small),
            _getDates(context),
            const SizedBox(height: Dimens.small),
            _getDescription(context),
            const SizedBox(height: Dimens.medium),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: _getPromaryContact(context)),
                  const VerticalDivider(),
                  Expanded(child: _getIndustries(context)),
                ],
              ),
            ),
            const Divider(height: 32),
            _progectVisibility(context),
            const SizedBox(height: Dimens.medium),
          ],
        ),
      ),
    );
  }

  Widget _getBigScreenLayout(BuildContext context) {
    return Card(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _getProjectName(context),
                Expanded(child: SizedBox(width: 10)),
                _getOpenButton(context),
              ],
            ),
            const SizedBox(height: Dimens.small),
            _getDates(context),
            const SizedBox(height: Dimens.small),
            _getDescription(context),
            const SizedBox(height: Dimens.big),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ..._getItems(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getItems(BuildContext context){
    final List<Widget> widgets=[];
    if (_hasTargetCompany()){
      widgets.add(Expanded(child: _getTargetCompany(context)));
      widgets.add(const VerticalDivider());
    }
    widgets.add(Expanded(child: _getPromaryContact(context)));
    widgets.add(const VerticalDivider());
    widgets.add(Expanded(child: _getIndustries(context)));
    widgets.add(const VerticalDivider());
    widgets.add(Expanded(child: _progectVisibility(context)));
    if (!_hasTargetCompany()){
      widgets.add(Expanded(child: SizedBox(height: 1)));
    }
    return widgets;
  }

  bool _hasTargetCompany() => project.targetCompanies.isNotEmpty;

  Widget _getOpenButton(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            const BorderSide(color: AppColors.outlinedButtonColor)),
      ),
      child: Text(
        '${project.status.name.toUpperCase()}',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onPressed: null,
    );
  }

  Widget _getProjectName(BuildContext context) {
    return Text(
      '${project.name}',
      style: AppStyles.headerBoldBlack(context),
    );
  }

  Widget _getDates(BuildContext context) {
    return Text(Resources.projects_created_on + '${project.createdOn}');
  }

  Widget _getDescription(BuildContext context) {
    return Text('${project.description.internal}');
  }

  Widget _getTargetCompany(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(Resources.projects_target_company),
        const SizedBox(height: Dimens.small),
        Text('${project.targetCompanies[0].name}'),
      ],
    );
  }

  Widget _getPromaryContact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(Resources.projects_primary_contact),
        const SizedBox(height: Dimens.small),
        Text('${project.primaryContact.fullName}'),
      ],
    );
  }

  Widget _getIndustries(BuildContext context) {
    return Column(
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
    );
  }

  Widget _progectVisibility(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(Resources.projects_visible_to),
      const SizedBox(height: Dimens.small),
      Text(
        '${project.projectLead.fullName}',
        style:
            const TextStyle(fontWeight: FontWeight.w500, color: AppColors.blue),
      )
    ]);
  }
}
