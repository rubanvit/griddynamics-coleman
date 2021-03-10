
import 'package:coleman/domain/models/top_employment.dart';

class ExpertModel {
  ExpertModel(
      this.expertId,
      this.firstName,
      this.lastName,
      this.status,
      this.statusDateModified,
      this.country,
      this.topEmployment);

  int expertId;
  String firstName;
  String lastName;
  String status;
  DateTime statusDateModified;
  String country;
  TopEmploymentModel topEmployment;
}
