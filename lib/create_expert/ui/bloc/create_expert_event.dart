
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_expert_event.freezed.dart';

@freezed
class CreateExpertEvent with _$CreateExpertEvent {
  const factory CreateExpertEvent.search(String searchText) = CreateExpertEventSearch;
  const factory CreateExpertEvent.clearSearch() = CreateExpertEventClearSearch;
  const factory CreateExpertEvent.showDetails() = CreateExpertEventShowDetails;
  const factory CreateExpertEvent.create() = CreateExpertEventCreate;
}
