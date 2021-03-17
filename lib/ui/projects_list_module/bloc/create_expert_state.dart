import 'package:coleman/domain/models/projects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_expert_state.freezed.dart';

@freezed
class CreateExpertState with _$CreateExpertState {
  factory CreateExpertState.initial(List<ProjectModel> projectList) = CreateExpertStateInitial;
  const factory CreateExpertState.progress() = CreateExpertStateProgress;
  const factory CreateExpertState.error() = CreateExpertStateError;
}

