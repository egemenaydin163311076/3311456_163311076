import 'package:flutter/material.dart';
import '../model/db_model.dart';
import '../model/todo_model.dart';
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var db = DatabaseConnect();

  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SİFRE EKLE'),
      ),
      backgroundColor: const Color(0xFFF5EBFF),
      body: Column(
        children: [
          Todolist(insertFunction: addItem, deleteFunction: deleteItem),
          UserInput(insertFunction: addItem),
        ],
      ),
    );
  }
}
