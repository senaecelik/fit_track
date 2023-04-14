import 'package:fit_track/domain/model/workout.dart';
import 'package:fit_track/domain/repository/crud_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'list_training_state.dart';

class ListTrainingCubit extends Cubit<ListTrainingState> {
  ListTrainingCubit() : super(ListTrainingInitial());

  final _crudRepository = TrackingCRUD();

  Future<void> getTraining({required String day}) async {
    emit(ListTrainingLoading());
    await _crudRepository.getTraining(day: day).then((value) {
      if (value.isNotEmpty) {
        emit(ListTrainingDisplay(value));
      } else {
        emit(ListTrainingNotFound());
      }
    }).catchError(
      (error, stackTrace) {
        emit(ListTrainingError(error.toString()));
      },
    );
  }

  Future<void> deleteTraining(
      {required String day, required String documentID}) async {
    await _crudRepository
        .deleteTraining(day: day, documentID: documentID)
        .then((value) {
      emit(ListTrainingSuccess(value.message.toString()));
      if (state is ListTrainingSuccess) {
        getTraining(day: day);
      }
    }).catchError(
      (error, stackTrace) {
        emit(ListTrainingError(error.toString()));
      },
    );
  }
}

