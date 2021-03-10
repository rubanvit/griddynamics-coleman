import 'package:coleman/data/serializable/top_employment.dart';
import 'package:coleman/domain/models/expert.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expert.g.dart';

@JsonSerializable()
class Expert {
  Expert(this.expertId, this.firstName, this.lastName, this.status,
      this.statusDateModified, this.country, this.topEmployment);

  int expertId;
  String firstName;
  String lastName;
  String status;
  String statusDateModified;
  String country;
  TopEmployment topEmployment;

  factory Expert.fromJson(Map<String, dynamic> json) => _$ExpertFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertToJson(this);

  ExpertModel toDomain() {
    return ExpertModel(
        expertId,
        firstName,
        lastName,
        status,
        //"01/21/2021 10:46:19"
        DateFormat.yMd().add_Hm().parse(statusDateModified),
        country,
        topEmployment.toDomain());
  }
}
