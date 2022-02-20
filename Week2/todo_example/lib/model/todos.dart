class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

final List<Todo> todos = List.generate(
  20,
  (index) => Todo(
    'Todo $index',
    'A description of what needs to be done for Todo $index',
  ),
);
