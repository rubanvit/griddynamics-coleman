import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/dimens.dart';
import 'package:coleman/ui/common/styles.dart';
import 'package:coleman/ui/projects_list_module/bloc/projects_list_bloc.dart';
import 'package:coleman/ui/projects_list_module/bloc/projects_list_event.dart';
import 'package:coleman/ui/projects_list_module/bloc/projects_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchWidget {
  static Widget getWidget(BuildContext context, ProjectsListState state) {
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
            ignoring: state is! ProjectsListStateInitial,
            child: TextFormField(
              onChanged: (value) {
                context.read<ProjectsListBloc>().add(ProjectsListEvent.search(value));
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: 'projects_search_hint'.tr(),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: AppColors.light_gray,
                ),
                enabledBorder:
                    AppStyles.buildOutLineBorder(color: AppColors.light_purple),
                focusedBorder:
                    AppStyles.buildOutLineBorder(color: AppColors.light_purple),
              ),
            ),
          ),
        ));
  }
}
