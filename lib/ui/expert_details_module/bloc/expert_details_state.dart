import 'package:coleman/domain/models/expert_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'expert_details_state.freezed.dart';

@freezed
class ExpertDetailsState with _$ExpertDetailsState {
  const factory ExpertDetailsState.initial(ExpertDetails expertDetails) = ExpertDetailsStateInitial;
  const factory ExpertDetailsState.progress() = ExpertDetailsStateProgress;
  const factory ExpertDetailsState.timeSelected(ExpertDetailsTime selectedTime) = ExpertDetailsStateTimeSelected;
}


