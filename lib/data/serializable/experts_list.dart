import 'package:coleman/data/serializable/expert.dart';
import 'package:coleman/domain/models/experts_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'experts_list.g.dart';

@JsonSerializable()
class ExpertsList {
  ExpertsList(this.experts);

  List<Expert> experts;

  factory ExpertsList.fromJson(Map<String, dynamic> json) =>
      _$ExpertsListFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertsListToJson(this);

  ExpertsListModel toDomain() {
    return ExpertsListModel(experts.map((e) => e.toDomain()).toList());
  }
}
