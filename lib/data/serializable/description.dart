import 'package:coleman/domain/models/description.dart';
import 'package:json_annotation/json_annotation.dart';

part 'description.g.dart';

@JsonSerializable()
class Description {
  Description(this.internal);

  String internal;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);

  DescriptionModel toDomain() {
    return DescriptionModel(internal);
  }
}
