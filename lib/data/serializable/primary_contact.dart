import 'package:coleman/domain/models/primary_contact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'primary_contact.g.dart';

@JsonSerializable()
class PrimaryContact {
  PrimaryContact(this.id, this.fullName, this.timezoneId);

  int id;
  String fullName;
  int timezoneId;

  factory PrimaryContact.fromJson(Map<String, dynamic> json) =>
      _$PrimaryContactFromJson(json);

  Map<String, dynamic> toJson() => _$PrimaryContactToJson(this);

  PrimaryContactModel toDomain() {
    return PrimaryContactModel(id, fullName, timezoneId);
  }
}
