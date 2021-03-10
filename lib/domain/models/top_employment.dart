
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
  DateTime startDate;
  DateTime? endDate;
  bool loc;
  bool isSelfEmployed;
  CorporationModel corporation;
}
