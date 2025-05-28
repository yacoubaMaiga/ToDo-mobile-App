import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/widgets/task.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tasks = [
    Task(
      title: 'Title 1',
      content: 'Content of task 1',
      status: true,
      createdAt: DateTime.now(),
    ),
    Task(
      title: 'Title 2',
      content: 'Content of task 2',
      status: true,
      createdAt: DateTime.now(),
    ),
    Task(
      title: 'Title 3',
      content: 'Content of task 3',
      status: true,
      createdAt: DateTime.now(),
    ),
    Task(
      title: 'Title 4',
      content: 'Content of task 4',
      status: true,
      createdAt: DateTime.now(),
    ),
  ];

  createTask() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 400,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Hello')],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('ToDo Now'),
        backgroundColor: Colors.amber[400],
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 5,
              bottom: 10,
            ),
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: Row(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskWidget(task: tasks[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          // Home
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          // Tasks
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[400],
        onPressed: () {
          createTask();
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
