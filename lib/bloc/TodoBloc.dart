import 'dart:async';
import '../database/database_service.dart';

class TodoBloc {
  final _databaseService = DatabaseService();
  List<Map<String, dynamic>> _todos = [];

  List<Map<String, dynamic>> get todos => _todos;

  Future<void> fetchTodos() async {
    _todos = await _databaseService.getTodos();
  }

  Future<void> addTodo(String task) async {
    print("$task lllllllllllllllll");
    final newTodo = {"task": task, "donecheck": 0};
    await _databaseService.insertTodo(newTodo);
    await fetchTodos();
  }
}
