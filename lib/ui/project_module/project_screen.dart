import 'package:coleman/ui/project_module/project_resources.dart';
import 'package:coleman/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(ProjectResources.appName),
    );

    return UIHelper.defaultMaterialApp(appBar: appbar, home: _getHomeWidget());
  }

  Widget _getHomeWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          Text('Tabs'),
          Text('Search'),
          Text('Yellow banner'),
          Text('List of experts'),
        ],
      ),
    );
  }
}
