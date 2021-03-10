import 'package:freezed_annotation/freezed_annotation.dart';
part 'experts_event.freezed.dart';

@freezed
abstract class ExpertsEvent  with _$ExpertsEvent{
  const factory ExpertsEvent.search(String searchKey) = LoginEventSearch;
}
