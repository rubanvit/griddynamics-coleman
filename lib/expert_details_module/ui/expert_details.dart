import 'package:coleman/domain/models/expert_details.dart';
import 'package:coleman/expert_details_module/ui/bloc/expert_details_bloc.dart';
import 'package:coleman/expert_details_module/ui/mapper/data_to_ui_mapper.dart';
import 'package:coleman/expert_details_module/ui/widgets/dialogs.dart';
import 'package:coleman/injection.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/constants.dart';
import 'package:coleman/ui/common/dimens.dart';
import 'package:coleman/ui/common/icons.dart';
import 'package:coleman/ui/common/resources.dart';
import 'package:coleman/ui/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/expert_details_event.dart';
import 'bloc/expert_details_state.dart';

class ExpertDetailsScreen extends StatelessWidget {
  String projectName = "";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    projectName = arguments == null ? "" : arguments as String;

    return BlocProvider<ExpertDetailsBloc>(
      create: (ctx) => getIt.get<ExpertDetailsBloc>(),
      child: _ExpertDetailsView(projectName),
    );
  }
}

class _ExpertDetailsView extends StatelessWidget {
  final String projectName;

  _ExpertDetailsView(this.projectName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showConfirmedDialog(ExpertDetailsTime selectedTime) {
      showDialog<void>(
          barrierDismissible: false,
          context: context,
          builder: (ctx) {
            final currentDate = DateTime.now();
            String formatter = DateFormat('yMMMMd').format(currentDate);
            String alertMessage = '$formatter ${selectedTime.localTime}';

            return AppDialog(
                title: Resources.expert_details_alert_header,
                title2: alertMessage,
                actionButtonTitle: Resources.common_ok,
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).pop();
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
          builder: (ctx, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _expertDescriptionWidgets(context),
              _expertNameWidget(context),
              _availabilityContentWidget(),
              _timePickerWidget(context, state),
              _scheduleButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _expertDescriptionWidgets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.normal, right: Dimens.normal, top: Dimens.normal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Resources.expert_details_header,
            style: AppStyles.headerBoldBlack(context),
          ),
          const SizedBox(
            height: Dimens.normal,
          ),
          const Text(
            Resources.expert_details_sub_header,
            style: AppStyles.bodyW400Grey,
          ),
          const SizedBox(
            height: Dimens.small,
          ),
        ],
      ),
    );
  }

  Widget _expertNameWidget(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.normal),
        child: Text(
          Resources.expert_details_expert_name,
          style: AppStyles.headerBoldBlack(context),
        ),
      ),
    );
  }

  Widget _availabilityContentWidget() {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.normal, right: Dimens.normal, top: Dimens.normal),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text(
          Resources.expert_details_current_date_mock,
          style: AppStyles.body2BoldBlack,
        ),
        SizedBox(
          height: Dimens.micro,
        ),
        Text(Resources.expert_details_scheduling_time_mock,
            style: AppStyles.body2W400Green),
        SizedBox(
          height: Dimens.micro,
        ),
        Text(Resources.expert_details_availability_time_mock,
            style: AppStyles.body2W400Black),
      ]),
    );
  }

  Widget _timePickerWidget(BuildContext context, ExpertDetailsState state) {
    if (state is ExpertDetailsStateInitial)
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.normal),
          child: GridView.count(
            shrinkWrap: true,
            childAspectRatio: 2,
            crossAxisCount: 3,
            crossAxisSpacing: Dimens.normal,
            mainAxisSpacing: Dimens.normal,
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
        ),
      );
    else
      return const SizedBox();
  }

  Widget _scheduleButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.normal),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.buttonColor)),
          child: Text(
            Resources.experts_schedule,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
