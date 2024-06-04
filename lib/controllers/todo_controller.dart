import 'package:lesson_49/models/todo/todo.dart';

class TodoController {
  List<Todo> todos = [
    Todo(
      title: "Suzish",
      description: "2 soat",
      isComplete: false,
    ),
    Todo(
      title: "Kitob o'qish",
      description: "50 bet",
      isComplete: true,
    ),
  ];
}
