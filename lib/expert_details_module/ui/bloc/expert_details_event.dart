import 'package:coleman/domain/models/expert_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'expert_details_event.freezed.dart';

@freezed
class ExpertDetailsEvent with _$ExpertDetailsEvent {
  const factory ExpertDetailsEvent.timeSelected(ExpertDetailsTime detailsTime) =
      ExpertDetailsEventTimeSelected;
}
