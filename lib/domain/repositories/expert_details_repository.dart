import 'package:coleman/domain/models/expert_details.dart';

abstract class IExpertDetailsRepository{
  Future<ExpertDetails> getExpertDetails();
}