import 'package:coleman/ui/project_module/project_resources.dart';
import 'package:coleman/ui/ui_helper.dart';
import 'package:flutter/material.dart';

import '../ui_constants.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getHomeWidget(context);
  }

  Widget _getHomeWidget(BuildContext context) {
    return MaterialApp(
      theme: UIConstants.materialTheme,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: _getTabBar(context),
            title: Text(ProjectResources.appName),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }

  TabBar _getTabBar(BuildContext context){
   return TabBar(
      tabs: [
        Tab(
            child: FittedBox(
              child: Text(
                ProjectResources.suggestedExperts.toUpperCase(),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline3,
              ),
            )),
        Tab(
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
            )),
      ],
    );
  }
}
