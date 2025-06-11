import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/db/db.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/todo_tile.dart';

class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  State<TODO> createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  // text controller
  final controller = TextEditingController();
  final todos = Hive.box('todos');

  TodoDbatabse db = TodoDbatabse();

  @override
  void initState() {
    super.initState();
    // App open for the first time ever
    if (todos.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // Database box contain some data
      db.loadData();
    }
  }

  // method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateDatabase();
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDatabase();
    });
  }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // save newTask
  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      Navigator.of(context).pop();
      controller.clear();
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createNewTask,
        icon: Icon(Icons.add),
        label: Text('Add New Task'),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
