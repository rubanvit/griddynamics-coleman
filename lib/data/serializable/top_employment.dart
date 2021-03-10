import 'package:coleman/data/serializable/corporation.dart';
import 'package:coleman/domain/models/top_employment.dart';
import 'package:intl/intl.dart';
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
    return TopEmploymentModel(
        id,
        title,
        //"2021-03-03T00:20:17.0554299+00:00",
        DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(startDate),
        endDate == null ? null :  DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(endDate!),
        loc,
        isSelfEmployed,
        corporation.toDomain());
  }
}
