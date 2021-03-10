
import 'package:coleman/domain/models/company_provider.dart';

class TargetCompanyModel {
  TargetCompanyModel(this.id, this.name, this.isPublic, this.ticker,
      this.isGovernment, this.hasPublicDebt, this.companyProvider);

  int id;
  String name;
  bool isPublic;
  String? ticker;
  bool isGovernment;
  bool hasPublicDebt;
  CompanyProviderModel? companyProvider;
}

