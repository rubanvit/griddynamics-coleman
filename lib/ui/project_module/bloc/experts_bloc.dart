
import 'package:bloc/bloc.dart';
import 'package:coleman/domain/models/expert.dart';
import 'package:coleman/domain/models/experts_list.dart';
import 'package:coleman/domain/repositories/project_repository.dart';
import 'package:coleman/ui/project_module/bloc/experts_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class ExpertsCubit extends Cubit<ExpertsState> {
  final ProjectRepository _repository;
  String lastSearchText = '';
  List<ExpertModel> _experts = [];

  ExpertsCubit(ProjectRepository repository) :
        _repository = repository,
        super(const ExpertsStateProcessing()){
    _repository.loadExperts().then((value) {
      _experts = value.experts;
      if (_experts.isEmpty){
        emit(const ExpertsStateEmpty());
      }else{
        emit(ExpertsStateSuccessful(_experts));
      }
    });
  }

  void setProcessing(){
    emit(const ExpertsStateProcessing());
  }

  void setError(){
    emit(const ExpertsStateError());
  }

  void setEmpty(){
    emit(const ExpertsStateEmpty());
  }
}
