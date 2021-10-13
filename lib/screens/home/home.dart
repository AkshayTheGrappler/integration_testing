import 'package:flutter/material.dart';
import 'package:integration_demo/res/models/taskmodel.dart';
import 'package:integration_demo/screens/home/add_task.dart';
import 'package:integration_demo/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: Key("addfab"),
        backgroundColor: Colors.brown[500],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        },
        child: Icon(
          Icons.add,
          size: 24,
          color: Colors.white,
        ),
      ),
      body: StreamProvider<List<TaskModel>>.value(
        value: DatabaseService().getListOfTask,
        initialData: [],
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text(
              'ToDoApp',
              key: Key("toDoKey"),
            ),
            backgroundColor: Colors.brown[400],
          ),
          body: Container(child: _TaskList()),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class _TaskList extends StatefulWidget {
  @override
  __TaskListState createState() => __TaskListState();
}

class __TaskListState extends State<_TaskList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<List<TaskModel>>(context) ?? [];
    return ListView.builder(
      itemCount: provider.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(provider[index].task),
        );
      },
    );
  }
}
