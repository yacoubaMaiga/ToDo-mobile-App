import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/utils/db_helper.dart';
import 'package:todoapp/widgets/task.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  SqlHelper sqlHelper = SqlHelper();
  bool isLoading = true;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    List<Task> allTasks = await sqlHelper.tasks();

    setState(() {
      isLoading = true;
    });

    setState(() {
      tasks = allTasks;
      isLoading = false;
    });
  }

  ShowCreateTaskForm() {
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
                        controller: titleController,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Title',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Description'),
                      TextFormField(
                        controller: descriptionController,
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
                            saveTask();
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

  saveTask() async {
    Task task = Task(
      title: '',
      description: '',
      status: false,
      createdAt: DateTime.now(),
    );

    task.title = titleController.text;
    task.description = descriptionController.text;

    // INSERT et récupérer l'id
    int insertedId = await sqlHelper.insertTask(task);

    // mettre à jour l'objet
    task.id = insertedId;

    Navigator.pop(context);

    loadTasks();

    titleController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('ToDo Now'),
        backgroundColor: Colors.amber[400],
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              await sqlHelper.deleteAllTasks();
              await loadTasks(); // recharge après suppression
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 5,
              bottom: 10,
            ),
            // child: Container(
            //   width: double.infinity,
            //   height: 30,
            //   decoration: BoxDecoration(color: Colors.lightBlue),
            //   child: Row(),
            // ),
            child: Text('Task of day', style: TextStyle(fontSize: 25)),
          ),
          Expanded(
            child:
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : tasks.isEmpty
                    ? Center(
                      child: Text(
                        "No task available.",
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                    : ListView.builder(
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
          ShowCreateTaskForm();
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
