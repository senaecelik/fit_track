import 'package:fit_track/domain/repository/crud_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_training_state.dart';

class AddTrainingCubit extends Cubit<AddTrainingState> {
  AddTrainingCubit() : super(AddTrainingInitial());

  final _crudRepository = TrackingCRUD();

  Future<void> addWorkout(
      {required String workoutName,
      required String workoutTime,
      required String date}) async {
    emit(AddTrainingLoading());
    await _crudRepository
        .addTraining(
      workoutName: workoutName,
      workoutTime: workoutTime,
      dateTime: date,
    )
        .then((value) {
      emit(AddTrainingSuccess(value.message.toString()));
    
    }).catchError(
      (error, stackTrace) {
        emit(AddTrainingError(error.toString()));
      },
    );
  }

  // Future<void> getWorkout({required String day}) async {
  //   emit(HomeLoading());
  //   await _crudRepository.getWorkout(dateTime: day).then((value) {
  //     if (value.isNotEmpty) {
  //       emit(WorkoutDisplay(value));
  //     }
  //   }).catchError(
  //     (error, stackTrace) {
  //       emit(HomeError(error.toString()));
  //     },
  //   );
  // }
}
