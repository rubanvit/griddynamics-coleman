import 'package:coleman/data/serializable/company_provider.dart';
import 'package:coleman/domain/models/corporation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'corporation.g.dart';

@JsonSerializable()
class Corporation {
  Corporation(this.id, this.name, this.isPublic, this.ticker, this.isGovernment,
      this.hasPublicDebt, this.companyProvider);

  int id;
  String name;
  bool isPublic;
  String? ticker;
  bool isGovernment;
  bool hasPublicDebt;
  CompanyProvider? companyProvider;

  factory Corporation.fromJson(Map<String, dynamic> json) =>
      _$CorporationFromJson(json);

  Map<String, dynamic> toJson() => _$CorporationToJson(this);

  CorporationModel toDomain() {
    return CorporationModel(id, name, isPublic, ticker, isGovernment,
        hasPublicDebt, companyProvider?.toDomain());
  }
}
