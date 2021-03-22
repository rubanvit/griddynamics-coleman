import 'package:coleman/common/platform_util.dart';
import 'package:coleman/domain/models/expert_details.dart';
import 'package:coleman/injection.dart';
import 'package:coleman/navigation/navigation.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/dimens.dart';
import 'package:coleman/ui/common/icons.dart';
import 'package:coleman/ui/common/styles.dart';
import 'package:coleman/ui/expert_details_module/bloc/expert_details_bloc.dart';
import 'package:coleman/ui/expert_details_module/bloc/expert_details_event.dart';
import 'package:coleman/ui/expert_details_module/bloc/expert_details_state.dart';
import 'package:coleman/ui/expert_details_module/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:coleman/ui/expert_details_module/mapper/data_to_ui_mapper.dart';
import 'package:easy_localization/easy_localization.dart';

class ExpertDetailsScreen extends StatelessWidget {
  String _projectName = "";
  String _expertName = "";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as ProjectExpertBundle?;
    _projectName = arguments == null ? "" : arguments.projectName;
    _expertName = arguments == null ? "" : arguments.expertName;

    return BlocProvider<ExpertDetailsBloc>(
      create: (ctx) => getIt.get<ExpertDetailsBloc>(),
      child: _ExpertDetailsView(_projectName, _expertName),
    );
  }
}

class _ExpertDetailsView extends StatelessWidget {
  final String projectName;
  final String expertName;

  _ExpertDetailsView(this.projectName, this.expertName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showConfirmedDialog(ExpertDetailsTime selectedTime) {
      showDialog<void>(
          barrierDismissible: false,
          context: context,
          builder: (ctx) {
            final currentDate = DateTime.now();
            final String formatter = DateFormat('yMMMMd').format(currentDate);
            final String alertMessage = '$formatter ${selectedTime.localTime}';

            return AppDialog(
                title: 'expert_details_alert_header'.tr(),
                title2: alertMessage,
                actionButtonTitle: 'common_ok'.tr(),
                onPressed: () {
                  Navigator.of(context).popUntil(
                      (route) => route.settings.name == AppNavigation.HOME);
                });
          });
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
                const VerticalDivider(
                    width: 8, thickness: 1, endIndent: 8, indent: 8),
              ],
            ),
          ));
    }

    AppBar _getAppBar(BuildContext context) {
      return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(height: 24, child: Image.asset(AppIcons.logo_url)),
        bottom: _getPageHeader(context),
      );
    }

    return Scaffold(
      appBar: _getAppBar(context),
      body: SafeArea(
        child: BlocConsumer<ExpertDetailsBloc, ExpertDetailsState>(
          listener: (ctx, state) {
            if (state is ExpertDetailsStateTimeSelected) {
              showConfirmedDialog(state.selectedTime);
            }
          },
          builder: (ctx, state) => SingleChildScrollView(
            physics:
                PlatformUtil.isWeb() ? const ClampingScrollPhysics() : null,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _expertDescriptionWidgets(context),
                  _expertNameWidget(context),
                  _availabilityContentWidget(context),
                  _timePickerWidget(context, state),
                  _scheduleButton(context),
                  const SizedBox(height: Dimens.normal)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _expertDescriptionWidgets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.large, right: Dimens.large, top: Dimens.normal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'expert_details_header'.tr(),
            style: AppStyles.headerBoldBlack(context),
          ),
          const SizedBox(height: Dimens.normal),
          Text(
            expertName + 'expert_details_sub_header'.tr(),
            style: AppStyles.bodyGrey(context),
          ),
          const SizedBox(height: Dimens.small),
        ],
      ),
    );
  }

  Widget _expertNameWidget(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.normal, horizontal: Dimens.large),
        child: Text(
          expertName,
          style: AppStyles.headerBoldBlack(context),
        ),
      ),
    );
  }

  Widget _availabilityContentWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.large, right: Dimens.large, top: Dimens.normal),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'expert_details_current_date_mock'.tr(),
          style: AppStyles.body2BoldBlack(context),
        ),
        const SizedBox(height: Dimens.micro),
        Text('expert_details_scheduling_time_mock'.tr(),
            style: AppStyles.body2W400Green(context)),
        const SizedBox(height: Dimens.micro),
        Text('expert_details_availability_time_mock'.tr(),
            style: AppStyles.body2W400Black(context)),
      ]),
    );
  }

  Widget _timePickerWidget(BuildContext context, ExpertDetailsState state) {
    if (state is ExpertDetailsStateInitial)
      return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.normal, horizontal: Dimens.large),
        child: GridView.count(
          primary: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2.2,
          crossAxisCount: PlatformUtil.isBigScreen(context)
              ? 6
              : PlatformUtil.isLandscapeOrientation(context)
                  ? 4
                  : 3,
          crossAxisSpacing: Dimens.small,
          mainAxisSpacing: 6,
          children: state.expertDetails.times
              .map(
                (ExpertDetailsTime e) => e.toWidget(
                  onPressed: (ExpertDetailsTime time) {
                    context
                        .read<ExpertDetailsBloc>()
                        .add(ExpertDetailsEvent.timeSelected(e));
                  },
                ),
              )
              .toList(),
        ),
      );
    else
      return const SizedBox(height: Dimens.micro);
  }

  Widget _scheduleButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.large),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: null,
          style: AppStyles.redButtonStyle(context),
          child: Text(
            'experts_schedule'.tr(),
            style: AppStyles.redButtonTextStyle(context),
          ),
        ),
      ),
    );
  }
}
