import 'dart:math';

import 'package:coleman/domain/models/expert_details.dart';
import 'package:coleman/domain/repositories/expert_details_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IExpertDetailsRepository)
class ExpertDetailsRepository extends IExpertDetailsRepository {
  final random = Random();

  @override
  Future<ExpertDetails> getExpertDetails() async {
    final possibleTimes = [
      ExpertDetailsTime(time: '9:00 AM', available: random.nextBool()),
      ExpertDetailsTime(time: '9:30 AM', available: random.nextBool()),
      ExpertDetailsTime(time: '10:00 AM', available: random.nextBool()),
      ExpertDetailsTime(time: '10:30 AM', available: random.nextBool()),
      ExpertDetailsTime(time: '11:00 AM', available: random.nextBool()),
      ExpertDetailsTime(time: '11:30 AM', available: random.nextBool()),
      ExpertDetailsTime(time: '12:00 PM', available: random.nextBool()),
      ExpertDetailsTime(time: '12:30 PM', available: random.nextBool()),
      ExpertDetailsTime(time: '1:00 PM', available: random.nextBool()),
      ExpertDetailsTime(time: '1:30 PM', available: random.nextBool()),
      ExpertDetailsTime(time: '2:00 PM', available: random.nextBool()),
      ExpertDetailsTime(time: '2:30 PM', available: random.nextBool()),
      ExpertDetailsTime(time: '3:00 PM', available: random.nextBool()),
      ExpertDetailsTime(time: '3:30 PM', available: random.nextBool()),
      ExpertDetailsTime(time: '4:00 PM', available: random.nextBool()),
    // ExpertDetailsTime(time: '4:30 PM', available: random.nextBool()),
      //ExpertDetailsTime(time: '5:00 PM', available: random.nextBool()),
    ];

    return ExpertDetails(times: possibleTimes);
  }
}

//'9:30 AM',
//'10:00 AM',
//'10:30 AM',
//'11:00 AM',
//'11:30 AM',
//'12:00 PM',
//'12:30 PM',
//'1:00 PM',
//'1:30 PM',
//'2:00 PM',
//'2:30 PM',
//'3:00 PM',
//'3:30 PM',
//'4:00 PM',
//'4:30 PM'