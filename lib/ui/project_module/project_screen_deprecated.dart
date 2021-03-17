import 'package:coleman/injection.dart';
import 'package:coleman/ui/common/colors.dart';
import 'package:coleman/ui/common/constants.dart';
import 'package:coleman/ui/common/resources.dart';
import 'package:coleman/ui/common/search_bar.dart';
import 'package:coleman/ui/project_module/bloc/experts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectScreenDeprecated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StackOver();
  }
}

class StackOver extends StatefulWidget {
  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: UIConstants.materialTheme,
        home: Scaffold(
            appBar: _getAppBar(),
            body: BlocProvider(
                lazy: false,
                create: (context) => getIt<ExpertsCubit>(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      _getTabs(),
                      _getSearchBar(),
                      _getBanner(context),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _getLeftTabBarView(),
                            _getRightTabBarView()
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text(Resources.appName),
    );
  }

  Widget _getTabs() {
    return Card(
      elevation: 4,
      child: Container(
        height: 64,
        color: AppColors.appbarBackground,
        child: TabBar(
          controller: _tabController,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: AppColors.blue,
              ),
            ),
          ),
          tabs: [_getLeftTab(), _getRightTab()],
        ),
      ),
    );
  }

  Tab _getLeftTab() {
    return Tab(
        child: FittedBox(
      child: Text(
        Resources.experts_suggestedExperts.toUpperCase(),
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline3,
      ),
    ));
  }

  Tab _getRightTab() {
    return Tab(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FittedBox(
          child: Text(
            Resources.experts_projectExperts.toUpperCase(),
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: AppColors.blue),
          ),
        ),
        Text(
          Resources.experts_expertsCount,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    ));
  }

  Widget _getLeftTabBarView() {
    return const CircularProgressIndicator();
    // return BlocBuilder<ExpertsCubit, ExpertsState>(builder: (_, state) {
    // if (state is ExpertsStateEmpty) {
    //   return TemplateExpertsList("", ProjectResources.experts_empty_list);
    // } else if (state is ExpertsStateProcessing) {
    //   return TemplateExpertsList.asProgress("");
    // } else if (state is ExpertsStateSuccessful) {
    //   return ExpertsListWidget(state, "");
    // } else {
    //   return TemplateExpertsList("", ProjectResources.experts_error_list);
    // }
    // });
  }

  Widget _getRightTabBarView() {
    return _getLeftTabBarView();
  }

  Widget _getSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SearchBar(),
    );
  }

  Widget _getBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: AppColors.lightOrange,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColors.orange, width: 1.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Row(
              children: [
                const Icon(Icons.people, size: 40, color: AppColors.orange),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Resources.experts_qualifiedExperts,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: Resources.experts_banner1,
                          style: Theme.of(context).textTheme.bodyText2,
                          children: const <TextSpan>[
                            TextSpan(
                                text: Resources.experts_banner2,
                                style: TextStyle(color: AppColors.blue)),
                            TextSpan(text: Resources.experts_banner3),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
