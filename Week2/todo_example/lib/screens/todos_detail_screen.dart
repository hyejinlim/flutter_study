import 'package:flutter/material.dart';
import 'package:todo_example/model/todos.dart';

class TodosDetailScreen extends StatelessWidget {
  const TodosDetailScreen({
    Key? key,
    // #basic
    // required this.todo,
  }) : super(key: key);

  // #basic
  // final Todo todo;

  @override
  Widget build(BuildContext context) {
    // #using RouteSettings
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
