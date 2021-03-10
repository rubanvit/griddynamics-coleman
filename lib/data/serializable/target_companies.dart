import 'package:coleman/data/serializable/company_provider.dart';
import 'package:coleman/domain/models/target_companies.dart';
import 'package:json_annotation/json_annotation.dart';

part 'target_companies.g.dart';

@JsonSerializable()
class TargetCompany {
  TargetCompany(this.id, this.name, this.isPublic, this.ticker,
      this.isGovernment, this.hasPublicDebt, this.companyProvider);

  int id;
  String name;
  bool isPublic;
  String? ticker;
  bool isGovernment;
  bool hasPublicDebt;
  CompanyProvider? companyProvider;

  factory TargetCompany.fromJson(Map<String, dynamic> json) =>
      _$TargetCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$TargetCompanyToJson(this);

  TargetCompanyModel toDomain() {
    return TargetCompanyModel(id, name, isPublic, ticker, isGovernment,
        hasPublicDebt, companyProvider?.toDomain());
  }
}
