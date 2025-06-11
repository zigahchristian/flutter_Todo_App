import 'package:hive/hive.dart';

class TodoDbatabse {
  List toDoList = [];
  // refrence our box (database)
  final todos = Hive.box('todos');

  // create Initial Todo for the first time
  void createInitialData() {
    toDoList = [
      ["Make Tutorials", false],
      ["Do Exercise", false],
    ];
  }

  // Load Data from the database
  void loadData() {
    toDoList = todos.get("TODOLIST");
  }

  // Update Data in database
  void updateDatabase() {
    todos.put("TODOLIST", toDoList);
  }
}
