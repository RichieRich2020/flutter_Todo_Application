import 'package:flutter/material.dart';

class Toolbox extends StatefulWidget {
  const Toolbox({super.key});

  @override
  State<Toolbox> createState() => _ToolboxState();
}

class _ToolboxState extends State<Toolbox> {
  bool doneCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.create_outlined),
        InkWell(
          onTap: () {
            setState(() {
              doneCheck = !doneCheck;
            });
          },
          child: doneCheck
              ? const Icon(
                  Icons.done_all_rounded,
                  color: Colors.greenAccent,
                )
              : const Text("X",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red)),
        ),
      ],
    );
  }
}
