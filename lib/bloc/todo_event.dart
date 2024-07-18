part of 'todo_bloc.dart';

sealed class TodoEvent {}

class AddTodo extends TodoEvent {
  final String task;

  AddTodo({required this.task});
}

class UpdateTodo extends TodoEvent {
  final int index;

  UpdateTodo({required this.index});
}

class DeleteTodo extends TodoEvent {
  final int index;

  DeleteTodo({required this.index});
}
