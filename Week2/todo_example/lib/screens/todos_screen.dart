import 'package:flutter/material.dart';
import 'package:todo_example/model/todos.dart';
import 'package:todo_example/screens/todos_detail_screen.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // #basic
                  // builder: (context) => TodosDetailScreen(todo: todos[index]),
                  builder: (context) => const TodosDetailScreen(),

                  // #using RouteSettings
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
            title: Text(todos[index].title),
          );
        },
      ),
    );
  }
}
