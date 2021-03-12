import 'package:coleman/domain/models/expert.dart';
import 'package:coleman/resources/colors.dart';
import 'package:coleman/resources/text_styles.dart';
import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:coleman/resources/project_resources.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpertsListWidget extends StatelessWidget {
  final ExpertsStateSuccessful _state;
  late String projectName;

  ExpertsListWidget(this.projectName, this._state);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        itemCount: _state.expertsList.length,
        itemBuilder: (context, index) {
          final expert = _state.expertsList[index];
          return _getTile(context, expert);
        },
      ),
    );
  }

  Widget _getTile(BuildContext context, ExpertModel expert) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context, expert),
            const Divider(),
            ..._middlePart(context, expert),
            const SizedBox(height: 16),
            _columnPart(context, expert),
            const SizedBox(height: 8),
            _scheduleButton(context, expert),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context, ExpertModel expert) {
    return Row(
      children: [
        const Icon(
          Icons.bookmark_border,
          color: AppColors.bookmarkIconColor,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            '${expert.firstName} ${expert.lastName}',
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _label(context, expert),
      ],
    );
  }

  Widget _label(BuildContext context, ExpertModel expert) {
    return OutlinedButton(
      onPressed: null,
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: AppColors.blue)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expert.status.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              _getStatusDateFormatted(expert),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: AppColors.gray3),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  String _getStatusDateFormatted(ExpertModel expert) {
    final startDate = expert.statusDateModified;
    return DateFormat(DateFormat.ABBR_MONTH_DAY).format(startDate) +
        " • " +
        DateFormat.jm().format(startDate);
  }

  List<Widget> _middlePart(BuildContext context, ExpertModel expert) {
    return [
      Text(
        expert.topEmployment.corporation.name,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        expert.topEmployment.title,
        style: Theme.of(context).textTheme.bodyText2,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        _getDateFormatted(expert),
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: AppColors.gray3),
        overflow: TextOverflow.ellipsis,
      ),
    ];
  }

  Widget _columnPart(BuildContext context, ExpertModel expert) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ProjectResources.type.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: AppColors.gray3),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  expert.angle?.name ?? ProjectResources.unassigned,
                  style: Theme.of(context).textTheme.bodyText2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const VerticalDivider(width: 32),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ProjectResources.location.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: AppColors.gray3),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  expert.country,
                  style: Theme.of(context).textTheme.bodyText2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _getDateFormatted(ExpertModel expert) {
    final startDate = expert.topEmployment.startDate;
    final endDate = expert.topEmployment.endDate;
    final startDateString = DateFormat.yMd().format(startDate);
    final String endDateString = endDate == null
        ? ProjectResources.present
        : DateFormat.yMd().format(endDate);
    return '$startDateString - $endDateString';
  }

  Widget _scheduleButton(BuildContext context, ExpertModel expert) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: AppStyles.redButtonStyle(context),
        child: Text(
          ProjectResources.schedule,
          style: AppStyles.redButtonTextStyle(context),
        ),
      ),
    );
  }
}
