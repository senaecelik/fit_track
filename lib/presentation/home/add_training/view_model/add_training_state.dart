part of 'add_training_cubit.dart';

abstract class AddTrainingState {}

class AddTrainingInitial extends AddTrainingState {}

class AddTrainingLoading extends AddTrainingState {}

class AddTrainingSuccess extends AddTrainingState {
  final String title;

  AddTrainingSuccess(this.title);
}

class AddTrainingError extends AddTrainingState {
  final String title;

  AddTrainingError(this.title);
}
