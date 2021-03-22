import 'package:coleman/common/platform_util.dart';
import 'package:coleman/data/utils.dart';
import 'package:coleman/domain/models/expert.dart';
import 'package:coleman/navigation/navigation.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/resources.dart';
import 'package:coleman/ui/common/styles.dart';
import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpertsListWidget extends StatelessWidget {
  final ExpertsStateSuccessful _state;
  late String projectName;
  bool _isWideScreen = false;

  ExpertsListWidget(this.projectName, this._state);

  @override
  Widget build(BuildContext context) {
    _isWideScreen = PlatformUtil.isBigScreen(context);
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: PlatformUtil.isWeb() ? const ClampingScrollPhysics() : null,
        // shrinkWrap: true,
        itemCount: _state.expertsList.length,
        itemBuilder: (context, index) {
          final expert = _state.expertsList[index];
          return _isWideScreen
              ? _getTileForBigScreen(context, expert)
              : _getTileForSmallScreen(context, expert);
        },
      ),
    );
  }

  Widget _getTileForBigScreen(BuildContext context, ExpertModel expert) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_headerForBigScreen(context, expert)],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [..._middlePart(context, expert)],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [..._typeWidgets(context, expert)],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: _label(context, expert),
              ),
              SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: _scheduleButton(context, expert),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTileForSmallScreen(BuildContext context, ExpertModel expert) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerForSmallScreen(context, expert),
              const Divider(height: 32),
              ..._middlePart(context, expert),
              const SizedBox(height: 16),
              _columnPart(context, expert),
              const SizedBox(height: 8),
              Container(
                  width: double.infinity,
                  child: _scheduleButton(context, expert)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerForSmallScreen(BuildContext context, ExpertModel expert) {
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
            maxLines: 5,
          ),
        ),
        _label(context, expert),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _headerForBigScreen(BuildContext context, ExpertModel expert) {
    return Row(
      children: [
        const Icon(
          Icons.bookmark_border,
          color: AppColors.bookmarkIconColor,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            '${expert.firstName} ${expert.lastName}',
            style: Theme.of(context).textTheme.headline6,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ),
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
        DateFormat.jm(Utils.enLocale).format(startDate);
  }

  List<Widget> _middlePart(BuildContext context, ExpertModel expert) {
    return [
      Text(
        expert.topEmployment.corporation.name,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      Text(
        expert.topEmployment.title,
        style: Theme.of(context).textTheme.bodyText2,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
      Text(
        _getDateFormatted(expert),
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: AppColors.gray3),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
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
              children: [..._typeWidgets(context, expert)],
            ),
          ),
          const VerticalDivider(width: 32),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [..._locationWidgets(context, expert)],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _typeWidgets(BuildContext context, ExpertModel expert) {
    return [
      Text(
        Resources.experts_type.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: AppColors.gray3),
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 8),
      Text(
        expert.angle?.name ?? Resources.experts_unassigned,
        style: Theme.of(context).textTheme.bodyText2,
        overflow: TextOverflow.ellipsis,
      )
    ];
  }

  List<Widget> _locationWidgets(BuildContext context, ExpertModel expert) {
    return [
      Text(
        Resources.experts_location.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: AppColors.gray3),
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 8),
      Text(
        expert.country,
        style: Theme.of(context).textTheme.bodyText2,
        overflow: TextOverflow.ellipsis,
      )
    ];
  }

  String _getDateFormatted(ExpertModel expert) {
    final startDate = expert.topEmployment.startDate;
    final endDate = expert.topEmployment.endDate;
    final startDateString = DateFormat.yMd(Utils.enLocale).format(startDate);
    final String endDateString = endDate == null
        ? Resources.experts_present
        : DateFormat.yMd(Utils.enLocale).format(endDate);
    return '$startDateString - $endDateString';
  }

  Widget _scheduleButton(BuildContext context, ExpertModel expert) {
    return ElevatedButton(
      onPressed: () {
        _openProjectExpertDetailsScreen(projectName, context);
      },
      style: AppStyles.redButtonStyle(context),
      child: Text(
        Resources.experts_schedule,
        style: AppStyles.redButtonTextStyle(context),
      ),
    );
  }

  void _openProjectExpertDetailsScreen(String name, BuildContext context) {
    Navigator.pushNamed(context, AppNavigation.EXPERTS_DETAILS,
        arguments: name);
  }
}
