import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coleman/domain/models/expert_details.dart';
import 'package:coleman/domain/repositories/expert_details_repository.dart';
import 'package:injectable/injectable.dart';

import 'expert_details_event.dart';
import 'expert_details_state.dart';

@singleton
class ExpertDetailsBloc extends Bloc<ExpertDetailsEvent, ExpertDetailsState> {
  final IExpertDetailsRepository _expertRepository;
  late ExpertDetails _expertDetails;

  ExpertDetailsBloc(IExpertDetailsRepository expertRepository)
      : _expertRepository = expertRepository,
        super(const ExpertDetailsState.progress()) {
    _expertRepository.getExpertDetails().then((value) {
      _expertDetails = value;
      emit(ExpertDetailsState.initial(value));
    });
  }

  @override
  Stream<ExpertDetailsState> mapEventToState(
    ExpertDetailsEvent event,
  ) async* {
    yield* event.when(timeSelected: (timeSelected) async* {
      yield ExpertDetailsState.timeSelected(timeSelected);
      yield ExpertDetailsState.initial(_expertDetails);
    });
  }
}
