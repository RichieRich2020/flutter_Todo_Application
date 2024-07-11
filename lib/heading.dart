import 'package:flutter/material.dart';

class Heading extends StatefulWidget {
  const Heading({super.key});

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  TextEditingController todoText = TextEditingController();
  List<Map<String, dynamic>> todolist = [
    {"task": "Task 1", "donecheck": false},
    {"task": "Task 2", "donecheck": false},
    {"task": "Task 3", "donecheck": false}
  ];

  void addtodofunc() {
    setState(() {
      todolist.add({"task": todoText.text, "donecheck": false});
    });
  }

  void doneCheck(int index) {
    setState(() {
      todolist[index]["donecheck"] = !todolist[index]["donecheck"];
    });
  }

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
                itemCount: todolist.length,
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
                          todolist[index]["task"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: todolist[index]["donecheck"]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                color: todolist[index]["donecheck"]
                                    ? Colors.green
                                    : Colors.red,
                                todolist[index]["donecheck"]
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                              onPressed: () => doneCheck(index),
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
