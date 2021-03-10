import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:coleman/ui/project_module/project_resources.dart';
import 'package:coleman/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class ExpertsListWidget extends StatelessWidget {
  final ExpertsStateSuccessful _state;

  ExpertsListWidget(this._state);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _state.expertsList.length,
        itemBuilder: (context, index) {
          final expert = _state.expertsList[index];
          return Card(
            elevation: 2,
            child: ListTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        color: UIConstants.bookmarkIconColor,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          '${expert.firstName} ${expert.lastName}',
                          style: Theme.of(context).textTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(BorderSide(
                              color: UIConstants.outlinedButtonColor)),
                        ),
                        child: Text(
                          ProjectResources.schedule,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: UIConstants.outlinedButtonColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
