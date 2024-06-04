import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_49/controllers/todo_controller.dart';
import 'package:lesson_49/models/todo/todo.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  final todosController = TodoController();
  late List<Todo> todos = todosController.todos;
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  String titleError = "";
  String subtitleError = "";


  addingNewtask(String title, String subtitle) {
    todos.add(
      Todo(
        title: title,
        description: subtitle,
        isComplete: false,
      ),
    );
  }

  checking() {
    if (titleController.text.isEmpty) {
      titleError = "Task nomi bo'sh bo'lishi mumkin emas";
    } else {
      titleError = "";
    }
    if (subtitleController.text.isEmpty) {
      subtitleError = "Task bo'sh bo'lishi mumkin emas";
    } else {
      subtitleError = "";
    }
    if (subtitleError.isEmpty && titleError.isEmpty) {
      addingNewtask(titleController.text, subtitleController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: const Text(
          "To Do tasks",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (var i = 0; i < todos.length; i++)
              Column(
                children: [
                  ListTile(
                    tileColor: Colors.green.shade100,
                    leading: IconButton(
                      onPressed: () {
                        setState(() {
                          todos[i].isComplete = !todos[i].isComplete;
                        });
                      },
                      icon: Icon(
                        todos[i].isComplete
                            ? Icons.check
                            : Icons.circle_outlined,
                      ),
                    ),
                    title: Text(
                      todos[i].title,
                    ),
                    subtitle: Text(
                      todos[i].description,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            todos.remove(todos[i]);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                  const Gap(30),
                ],
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Adding new Task",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const Gap(20),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'New title',
                          border: const OutlineInputBorder(),
                          errorText: titleError,
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: subtitleController,
                        decoration: InputDecoration(
                          labelText: 'New description',
                          border: const OutlineInputBorder(),
                          errorText: subtitleError,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        checking();
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Add",
                      ),
                    )
                  ],
                );
              });
        },
        backgroundColor: Colors.teal.shade400,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
