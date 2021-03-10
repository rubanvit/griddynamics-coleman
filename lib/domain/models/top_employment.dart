
import 'package:coleman/domain/models/corporation.dart';

class TopEmploymentModel {
  TopEmploymentModel(
      this.id,
      this.title,
      this.startDate,
      this.endDate,
      this.loc,
      this.isSelfEmployed,
      this.corporation);

  int id;
  String title;
  String startDate;
  String? endDate;
  bool loc;
  bool isSelfEmployed;
  CorporationModel corporation;
}
