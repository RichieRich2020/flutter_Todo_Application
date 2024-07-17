part of 'todo_bloc.dart';

sealed class TodoState {}

final class TodoInitial extends TodoState {}

class TodoSuccess extends TodoState {
  final String task;

  TodoSuccess({required this.task});
}

class TodoFailure extends TodoState {
  final String error;

  TodoFailure({required this.error});
}

class TodoLoaded extends TodoState {
  final List<Map<String, dynamic>> todos;

  TodoLoaded({required this.todos});
}
