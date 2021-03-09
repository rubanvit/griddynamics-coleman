import 'package:coleman/domain/models/project.dart';
import 'package:intl/intl.dart';

class ProjectApi {
  late Project _mockProject;

  ProjectApi() {
    final Expert _kristinWatson = Expert(
      firstName: 'Kristin',
      lastName: 'Watson',
      companyName: 'Avon Products Inc.',
      status: 'Public',
      type: 'Experts in US',
      location: 'United States',
      position: 'Executive Director - Customer Insight Center',
      startDate: DateFormat.yMEd().parse('Thu, 5/23/2013 10:21:47 AM'),
      endDate: DateFormat.yMEd().parse('Thu, 5/23/2013 10:21:47 AM'),
    );

    final Expert _darlenRobertson =
        _kristinWatson.copyWith(firstName: 'Darlen', lastName: 'Robertson');

    _mockProject = Project.detailed(
      id: 123,
      title: 'New PR_TG',
      description: 'sdasd',
      date: DateFormat.yMEd().parse('Thu, 5/23/2013 10:21:47 AM'),
      industry: 'Oilseed farms',
      primaryContact: User('Alex', 'Kimball'),
      users: [User('Amal', 'Kamal')],
      allExperts: [_kristinWatson, _darlenRobertson],
    );
  }

  Future<Project> getProjectById(int id) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return _mockProject;
  }
}
