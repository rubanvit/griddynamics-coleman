import 'package:coleman/domain/models/industries.dart';
import 'package:json_annotation/json_annotation.dart';

part 'industries.g.dart';

@JsonSerializable()
class Industry {
  Industry(this.id, this.name);

  int id;
  String name;

  factory Industry.fromJson(Map<String, dynamic> json) =>
      _$IndustryFromJson(json);

  Map<String, dynamic> toJson() => _$IndustryToJson(this);

  IndustryModel toDomain() {
    return IndustryModel(id, name);
  }
}
