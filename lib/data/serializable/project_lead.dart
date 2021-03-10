import 'package:coleman/domain/models/project_lead.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_lead.g.dart';

@JsonSerializable()
class ProjectLead {
  ProjectLead(this.id, this.fullName, this.email);

  int id;
  String fullName;
  String email;

  factory ProjectLead.fromJson(Map<String, dynamic> json) =>
      _$ProjectLeadFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectLeadToJson(this);

  ProjectLeadModel toDomain() {
    return ProjectLeadModel(id, fullName, email);
  }
}
