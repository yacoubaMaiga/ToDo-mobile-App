import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  Task task;

  TaskWidget({super.key, required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(
                0.1,
              ), // Couleur de l’ombre avec opacité
              offset: Offset(0, 4), // Décalage vertical de l’ombre
              blurRadius: 8, // Flou de l’ombre
              spreadRadius: 1, // Expansion de l’ombre
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.task.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.edit),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                widget.task.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(
                    'MMM dd, yyyy – kk:mm',
                  ).format(widget.task.createdAt),
                ),
                Row(
                  children: [
                    Text('Mark as complete'),
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
