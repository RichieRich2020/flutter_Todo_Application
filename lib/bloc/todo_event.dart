part of 'todo_bloc.dart';

sealed class TodoEvent {}

class AddTodo extends TodoEvent {
  final String task;

  AddTodo({required this.task});
}
