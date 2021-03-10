import 'package:coleman/domain/models/expert.dart';
import 'package:coleman/domain/models/experts_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'experts_state.freezed.dart';

@freezed
class ExpertsState  with _$ExpertsState  {
  const factory ExpertsState.processing() = ExpertsStateProcessing;
  const factory ExpertsState.error() = ExpertsStateError;
  const factory ExpertsState.empty() = ExpertsStateEmpty;
  const factory ExpertsState(List<ExpertModel> expertsList) = ExpertsStateSuccessful;
}
