import 'package:coleman/data/serializable/corporation.dart';
import 'package:coleman/domain/models/top_employment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_employment.g.dart';

@JsonSerializable()
class TopEmployment {
  TopEmployment(this.id, this.title, this.startDate, this.endDate, this.loc,
      this.isSelfEmployed, this.corporation);

  int id;
  String title;
  String startDate;
  String? endDate;
  bool loc;
  bool isSelfEmployed;
  Corporation corporation;

  factory TopEmployment.fromJson(Map<String, dynamic> json) =>
      _$TopEmploymentFromJson(json);

  Map<String, dynamic> toJson() => _$TopEmploymentToJson(this);

  TopEmploymentModel toDomain() {
    return TopEmploymentModel(id, title, startDate, endDate, loc,
        isSelfEmployed, corporation.toDomain());
  }
}
