import 'package:coleman/domain/models/expert.dart';
import 'package:coleman/resources/project_resources.dart';
import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:coleman/ui/project_module/widgets/experts_list_widget.dart';
import 'package:flutter/material.dart';

class TemplateExpertsList extends StatelessWidget {
  late String projectName;
  bool _isProgress = false;
  bool _withResults = false;
  bool _isError = false;
  bool _isEmpty = false;
  late ExpertsStateSuccessful _state;

  TemplateExpertsList.asEmpty(this.projectName) {
    _isEmpty = true;
  }

  TemplateExpertsList.asError(this.projectName) {
    _isError = true;
  }

  TemplateExpertsList.asProgress(this.projectName) {
    _isProgress = true;
  }

  TemplateExpertsList.withResults(this.projectName, this._state) {
    _withResults = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 16),
            Card(
              margin: EdgeInsets.zero,
              elevation: 4,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Text(ProjectResources.experts_list_header,
                    style: Theme.of(context).appBarTheme.textTheme?.title),
              ),
            ),
            SizedBox(height: 16),
            Flexible(
              flex: 1,
              child: Center(
                child: _isProgress
                    ? CircularProgressIndicator()
                    : _isEmpty
                        ? Text(ProjectResources.experts_empty_list,
                            style: Theme.of(context).textTheme.headline5)
                        : _isError
                            ? Text(ProjectResources.experts_error_list,
                                style: Theme.of(context).textTheme.headline5)
                            : _withResults
                                ? ExpertsListWidget(projectName, _state)
                                : Text(ProjectResources.experts_empty_list,
                                    style:
                                        Theme.of(context).textTheme.headline5),
              ),
            ),
          ],
        ));
  }
}
