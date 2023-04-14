part of 'editing_training_cubit.dart';

abstract class EditingTrainingState {}

class EditingTrainingInitial extends EditingTrainingState {}

class EditingTrainingLoading extends EditingTrainingState {}

class EditingTrainingSuccess extends EditingTrainingState {
  final String? title;

  EditingTrainingSuccess(this.title);

}

class EditingTrainingError extends EditingTrainingState {
  final String title;

  EditingTrainingError(this.title);
}
