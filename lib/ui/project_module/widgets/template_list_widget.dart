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
    return Column(
      children: [
        const SizedBox(height: 16),
        Card(
          margin: EdgeInsets.zero,
          elevation: 4,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(ProjectResources.experts_list_header,
                style: Theme.of(context).appBarTheme.textTheme?.title),
          ),
        ),
        const SizedBox(height: 16),
        _getContent(context),
      ],
    );
  }

  Widget _getContent(BuildContext context) {
    if (_isProgress)
      return _getProgressWidget();
    else if (_isEmpty)
      return _getEmptyListWidget(context);
    else if (_isError)
      return _getErrorWidget(context);
    else if (_withResults && _state.expertsList.isEmpty)
      return _getEmptyListWidget(context);
    else if (_withResults)
      return ExpertsListWidget(projectName, _state);
    else
      return _getEmptyListWidget(context);
  }

  Widget _getProgressWidget() {
    return const Flexible(child: Center(child: CircularProgressIndicator()));
  }

  Widget _getEmptyListWidget(BuildContext context) {
    return Flexible(
      child: Center(
        child: Text(ProjectResources.experts_empty_list,
            style: Theme.of(context).textTheme.headline5),
      ),
    );
  }

  Widget _getErrorWidget(BuildContext context) {
    return Flexible(
      child: Center(
        child: Text(ProjectResources.experts_error_list,
            style: Theme.of(context).textTheme.headline5),
      ),
    );
  }
}
