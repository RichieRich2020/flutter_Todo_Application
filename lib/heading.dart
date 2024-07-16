import 'package:flutter/material.dart';
import 'dart:convert'; // Import for JSON encoding/decoding
import 'package:http/http.dart' as http;
import 'package:my_flutter_todoapplication/bloc/TodoBloc.dart';
import './database/database_service.dart';
import './bloc/TodoBloc.dart';

class Heading extends StatefulWidget {
  const Heading({super.key});

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  TextEditingController todoText = TextEditingController();
  final TodoBloc Bloctodo = TodoBloc();
  // List<Map<String, dynamic>> todolist = [
  //   {"task": "Task 1", "donecheck": false},
  //   {"task": "Task 2", "donecheck": false},
  //   {"task": "Task 3", "donecheck": false}
  // ];

  // List<Map<String, dynamic>> todolist = [];

  // final DatabaseService _databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
    Bloctodo.fetchTodos().then((_) {
      setState(() {});
    });
  }

  Future<void> addtodofunc() async {
    await Bloctodo.addTodo(todoText.text);
    // Bloctodo.fetchTodos();
    setState(() {
      Bloctodo.fetchTodos();
    });
  }

  // Future<void> fetchTodos() async {
  //   final todo = await _databaseService.getTodos();
  //   setState(() {
  //     todolist = todo;
  //   });
  //   print("$todolist todolist");
  // }

  // Future<void> addtodofunc() async {
  //   final newTodo = {"task": todoText.text, "donecheck": 0};
  //   await _databaseService.insertTodo(newTodo);
  //   fetchTodos();
  // }

  Future<void> updatetodofunc(int index) async {
    // await _databaseService.updateTodo(index);
    // fetchTodos();
  }

  // Future<void> fetchTodos() async {
  //   final response =
  //       await http.get(Uri.parse('http://10.0.2.2:5000/api/todos'));
  //   print(json.decode(response.body));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       todolist = List<Map<String, dynamic>>.from(json.decode(response.body));
  //     });
  //   } else {
  //     throw Exception('Failed to load todos');
  //   }
  //   print("$todolist todolist");
  // }

  // void addtodofunc() {
  //   setState(() {
  //     todolist.add({"task": todoText.text, "donecheck": false});
  //   });
  // }

  // Future<void> addtodofunc() async {
  //   final response = await http.post(
  //     Uri.parse('http://10.0.2.2:5000/api/todos'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'task': todoText.text,
  //       'donecheck': false,
  //     }),
  //   );

  //   if (response.statusCode == 201) {
  //     setState(() {
  //       todolist.add({"task": todoText.text, "donecheck": false});
  //     });
  //   } else {
  //     throw Exception('Failed to add todo');
  //   }
  // }

  // void doneCheck(int index) {
  //   setState(() {
  //     todolist[index]["donecheck"] = todolist[index]["donecheck"] == 1 ? 0 : 1;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 130, 75, 196),
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: todoText,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: addtodofunc,
                child: const Text(
                  "Add Your Task",
                  style: TextStyle(
                      color: Color.fromARGB(255, 130, 75, 196),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Bloctodo.todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 173, 132, 244)),
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text((index + 1).toString()),
                        Text(
                          Bloctodo.todos[index]["task"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: Bloctodo.todos[index]["donecheck"] == 1
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                color: Bloctodo.todos[index]["donecheck"] == 1
                                    ? Colors.green
                                    : Colors.red,
                                Bloctodo.todos[index]["donecheck"] == 1
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                              onPressed: () => updatetodofunc(index),
                            ),
                            Icon(Icons.create_outlined)
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {}
