import 'package:coleman/data/serializable/description.dart';
import 'package:coleman/data/serializable/industries.dart';
import 'package:coleman/data/serializable/primary_contact.dart';
import 'package:coleman/data/serializable/project_lead.dart';
import 'package:coleman/data/serializable/status.dart';
import 'package:coleman/data/serializable/target_companies.dart';
import 'package:coleman/domain/models/projects.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projects.g.dart';

@JsonSerializable()
class Project {
  Project(
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
  Status status;
  Description description;
  PrimaryContact primaryContact;
  ProjectLead projectLead;
  String createdOn;
  List<TargetCompany> targetCompanies;
  List<Industry> industries;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  ProjectModel toDomain() {
    return ProjectModel(
        id,
        name,
        status.toDomain(),
        description.toDomain(),
        primaryContact.toDomain(),
        projectLead.toDomain(),
        //"2021-02-28T20:57:55.045508+00:00"
        DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(createdOn),
        targetCompanies.map((i) => i.toDomain()).toList(),
        industries.map((i) => i.toDomain()).toList());
  }
}
