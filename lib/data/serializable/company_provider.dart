import 'package:coleman/domain/models/company_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_provider.g.dart';

@JsonSerializable()
class CompanyProvider {
  CompanyProvider(this.value, this.name, this.displayName);

  int value;
  String name;
  String displayName;

  factory CompanyProvider.fromJson(Map<String, dynamic> json) =>
      _$CompanyProviderFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyProviderToJson(this);

  CompanyProviderModel toDomain() {
    return CompanyProviderModel(value, name, displayName);
  }
}
