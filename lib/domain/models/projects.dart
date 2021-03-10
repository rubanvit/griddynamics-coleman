
import 'package:coleman/domain/models/description.dart';
import 'package:coleman/domain/models/industries.dart';
import 'package:coleman/domain/models/primary_contact.dart';
import 'package:coleman/domain/models/project_lead.dart';
import 'package:coleman/domain/models/status.dart';
import 'package:coleman/domain/models/target_companies.dart';

class ProjectModel {
  ProjectModel(
      this.id,
      this.name,
      this.status,
      this.description,
      this.primaryContact,
      this.projectLead,
      this.createdOn,
      this.targetCompanies,
      this.industries);

  int id;
  String name;
  StatusModel status;
  DescriptionModel description;
  PrimaryContactModel primaryContact;
  ProjectLeadModel projectLead;
  DateTime createdOn;
  List<TargetCompanyModel> targetCompanies;
  List<IndustryModel> industries;
}
