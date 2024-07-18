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
          {'task': event.task, 'donecheck': 0}
        ]));
      } else {
        emit(TodoLoaded(todos: [
          {'task': event.task, 'donecheck': 0}
        ]));
      }
    });

    on<UpdateTodo>((event, emit) {
      if (state is TodoLoaded) {
        print(event.index);
        final currentState = state as TodoLoaded;
        if (currentState.todos[event.index]["donecheck"] == 1) {
          currentState.todos[event.index]["donecheck"] = 0;
        } else {
          currentState.todos[event.index]["donecheck"] = 1;
        }

        emit(TodoLoaded(todos: [...currentState.todos]));
      }
    });
  }
}
