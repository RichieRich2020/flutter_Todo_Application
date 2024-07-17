import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>((event, emit) {
      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        emit(TodoLoaded(todos: [
          ...currentState.todos,
          {'task': event.task}
        ]));
      } else {
        emit(TodoLoaded(todos: [
          {'task': event.task}
        ]));
      }
    });
  }
}
