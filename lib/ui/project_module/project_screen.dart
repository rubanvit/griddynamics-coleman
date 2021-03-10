import 'package:coleman/domain/repositories/project_repository.dart';
import 'package:coleman/injection.dart';
import 'package:coleman/ui/common/search_bar.dart';
import 'package:coleman/ui/project_module/bloc/experts_bloc.dart';
import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:coleman/ui/project_module/project_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui_constants.dart';

class ProjectScreen extends StatelessWidget {
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
                  padding: EdgeInsets.only(top: 8.0),
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
      title: Text(ProjectResources.appName),
    );
  }

  Widget _getTabs() {
    return Card(
      elevation: 4,
      child: Container(
        height: 64,
        color: UIConstants.appbarBackground,
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: UIConstants.blue,
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
        ProjectResources.suggestedExperts.toUpperCase(),
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
            ProjectResources.projectExperts.toUpperCase(),
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: UIConstants.blue),
          ),
        ),
        Text(
          ProjectResources.expertsCount,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    ));
  }

  Widget _getLeftTabBarView() {
    return BlocBuilder<ExpertsCubit, ExpertsState>(builder: (_, state) {
      if (state is ExpertsStateEmpty) {
        return Center(child: Text('list is empty'));
      } else if (state is ExpertsStateProcessing) {
        return Center(child: Text('processing'));
      } else if (state is ExpertsStateSuccessful) {
        return Center(child: Text('list of ${state.expertsList.length} items'));
      } else {
        return Center(child: Text('error'));
      }
    });
  }

  Widget _getRightTabBarView() {
    return Center(
      child: Text(
        'Buy Now',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _getSearchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: SearchBar(),
    );
  }

  Widget _getBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: UIConstants.lightOrange,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: UIConstants.orange, width: 1.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Row(
              children: [
                Icon(Icons.people, size: 40, color: UIConstants.orange),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ProjectResources.qualifiedExperts,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          text: ProjectResources.banner1,
                          style: Theme.of(context).textTheme.bodyText2,
                          children: <TextSpan>[
                            TextSpan(
                                text: ProjectResources.banner2,
                                style: TextStyle(color: UIConstants.blue)),
                            TextSpan(text: ProjectResources.banner3),
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
