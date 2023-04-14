import 'package:fit_track/domain/repository/crud_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'editing_training_state.dart';

class EditingTrainingCubit extends Cubit<EditingTrainingState> {
  EditingTrainingCubit() : super(EditingTrainingInitial());

  final _crudRepository = TrackingCRUD();

  Future<void> editWorkout({
    required String workoutName,
    required String workoutTime,
    required String day,
    required String documentID,
  }) async {
    emit(EditingTrainingLoading());
    await _crudRepository
        .updateTraining(
            workoutName: workoutName,
            workoutTime: workoutTime,
            day: day,
            documentID: documentID)
        .then((value) {
      emit(EditingTrainingSuccess(value.message!));
    }).catchError(
      (error, stackTrace) {
        emit(EditingTrainingError(error.toString()));
      },
    );
  }
}
