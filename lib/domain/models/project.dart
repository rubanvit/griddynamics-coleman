class Project {
  int id = -1;
  String title = '';
  DateTime? date;
  String? description;
  String industry = '';
  User primaryContact = User.EMPTY;
  List<User> users = [];
  List<Expert> allExperts = [];

  Project.detailed(
      {required this.id,
      required this.title,
      this.date,
      this.description,
      required this.industry,
      required this.primaryContact,
      required this.users,
      required this.allExperts});

  Project.byDefault();
}

class User {
  final String firstName;
  final String lastName;

  User(this.firstName, this.lastName);

  static var EMPTY = User('', '');
}

class Expert {
  String firstName;
  String lastName;
  String companyName;
  String status;
  String type;
  String location;
  String position;
  DateTime? startDate;
  DateTime? endDate;

  Expert({
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.status,
    required this.type,
    required this.location,
    required this.position,
    this.startDate,
    this.endDate,
  });

  Expert copyWith({
    String? firstName,
    String? lastName,
    String? companyName,
    String? status,
    String? type,
    String? location,
    String? position,
    DateTime? startDate,
    DateTime? endDate,
  }){
    return Expert(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      companyName: companyName ?? this.companyName,
      status: status ?? this.status,
      type: type ?? this.type,
      location: location ?? this.location,
      position: position ?? this.position,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
