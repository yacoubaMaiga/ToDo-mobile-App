import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/widgets/task.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var tasks = [
    Task(
      id: 1,
      title: 'Title 1',
      description: 'description of task 1',
      status: true,
      createdAt: DateTime.now(),
    ),
    Task(
      id: 2,
      title: 'Title 2',
      description: 'description of task 2',
      status: true,
      createdAt: DateTime.now(),
    ),
    Task(
      id: 3,
      title: 'Title 3',
      description: 'description of task 3',
      status: true,
      createdAt: DateTime.now(),
    ),
    Task(
      id: 4,
      title: 'Title 4',
      description: 'description of task 4',
      status: true,
      createdAt: DateTime.now(),
    ),
  ];
  createTask() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title'),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Title',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Description'),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Type something',
                        ),
                        maxLines: 5,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Create'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
