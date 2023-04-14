part of 'list_training_cubit.dart';

abstract class ListTrainingState {}

class ListTrainingInitial extends ListTrainingState {}

class ListTrainingLoading extends ListTrainingState {}

class ListTrainingDisplay extends ListTrainingState {
  final List<Workout> workoutList;

  ListTrainingDisplay(this.workoutList);
}

class ListTrainingError extends ListTrainingState {
  final String title;

  ListTrainingError(this.title);
}

class ListTrainingNotFound extends ListTrainingState {}
class ListTrainingSuccess extends ListTrainingState {
   final String title;

  ListTrainingSuccess(this.title);
}

