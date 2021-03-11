import 'package:coleman/domain/models/angle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'angle.g.dart';

@JsonSerializable()
class Angle {
  Angle(this.id, this.name);

  int id;
  String name;

  factory Angle.fromJson(Map<String, dynamic> json) =>
      _$AngleFromJson(json);

  Map<String, dynamic> toJson() => _$AngleToJson(this);

  AngleModel toDomain() {
    return AngleModel(id, name);
  }
}
