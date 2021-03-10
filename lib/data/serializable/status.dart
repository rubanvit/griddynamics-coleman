import 'package:coleman/domain/models/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable()
class Status {
  Status(this.value, this.name, this.displayName);

  int value;
  String name;
  String displayName;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  StatusModel toDomain() {
    return StatusModel(value, name, displayName);
  }
}
