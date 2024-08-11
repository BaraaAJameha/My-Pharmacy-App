// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder/models/task.dart';
import 'package:reminder/db/db_helper.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  late Map<DateTime, List<Task>> _events = {};

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  void _fetchTasks() async {
    await DBHelper.initDb(); // Initialize the database

    List<Map<String, dynamic>> tasksData = await DBHelper.query();
    setState(() {
      _events = tasksData.fold<Map<DateTime, List<Task>>>({}, (events, data) {
        Task task = Task.fromJson(data);
        DateTime date;
        try {
          date = DateFormat.yMd().parse(task.date!);
        } catch (e) {
          print('Invalid date format: ${task.date}');
          return events; // Skip this task if the date format is invalid
        }

        events[date] ??= [];
        events[date]!.add(task);
        return events;
      });
    });

    // Print tasks to the console
    tasksData.forEach((data) {
      Task task = Task.fromJson(data);
      print('Title: ${task.title}');
      print('Description: ${task.note}');
      print('Date: ${task.date}');
      print('Is Completed: ${task.isCompleted}');
      print('-----------------------');
    });
  }

  Widget _buildTaskList(DateTime selectedDay) {
    String formattedSelectedDay = DateFormat('M/d/yyyy').format(selectedDay);

    List<Task> tasks = [];

    for (var eventTasks in _events.values) {
      tasks.addAll(eventTasks);
    }

    List<Task> selectedDayTasks =
        tasks.where((task) => task.date == formattedSelectedDay).toList();

    if (selectedDayTasks.isEmpty) {
      return Text("No tasks for the selected day");
    } else {
      // Find the color of the task from the data provider helper based on the task's color code
      Color getTaskColor(int colorCode) {
        // Add your logic here to map color codes to actual colors
        // You can use a switch statement or a map to define the mapping
        // For example:
        switch (colorCode) {
          case 0:
            return Color(0XFFFFBD59);

          default:
            return Color(0XFFFFBD59);
        }
      }

      // Get the color code from the task (assuming it's stored as an int in the Task object)
      int? taskColorCode = selectedDayTasks.first.color;
      Color taskColor =
          taskColorCode != null ? getTaskColor(taskColorCode) : Colors.grey;

      return Column(
        children: selectedDayTasks.map((task) {
          int? taskColorCode = task.color;
          Color taskColor =
              taskColorCode != null ? getTaskColor(taskColorCode) : Colors.grey;

          return Container(
            color: taskColor,
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListTile(
                title: Text(task.title ?? '',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                subtitle: Text(task.note ?? '', style: TextStyle(fontSize: 14)),
                trailing: Checkbox(
                  value: task.isCompleted == 1,
                  onChanged: (bool? value) {
                    setState(() {
                      task.isCompleted = value! ? 1 : 0;
                    });
                  },
                ),
              ),
            ),
          );
        }).toList(),
      );
    }
  }

  Widget _buildMarkerIcon(
      BuildContext context, DateTime day, List<Task> tasks) {
    List<Task> completedTasks = [];
    List<Task> incompleteTasks = [];

    for (var eventTasks in _events.values) {
      tasks.addAll(eventTasks);
    }

    for (Task task in tasks) {
      if (task.isCompleted == 1) {
        completedTasks.add(task);
      } else {
        incompleteTasks.add(task);
      }
    }

    String formattedDay = DateFormat('M/d/yyyy').format(day);

    List<Widget> markers = [];

    for (Task task in completedTasks) {
      if (task.date == formattedDay) {
        markers.add(
          Positioned(
            bottom: 5,
            left: markers.length * 12.0,
            child: Icon(Icons.circle, color: Colors.green, size: 10),
          ),
        );
      }
    }

    for (Task task in incompleteTasks) {
      if (task.date == formattedDay) {
        markers.add(
          Positioned(
            bottom: 5,
            left: markers.length * 12.0,
            child: Icon(Icons.circle, color: Colors.red, size: 10),
          ),
        );
      }
    }

    return Stack(
      children: markers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) {
              return _events.keys.any((eventDay) {
                return day.year == eventDay.year &&
                    day.month == eventDay.month &&
                    day.day == eventDay.day;
              });
            },
            calendarStyle: CalendarStyle(
              markersAlignment: Alignment.bottomCenter,
              markerDecoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: _buildMarkerIcon,
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
              print("object");
            },
          ),
          Expanded(child: _buildTaskList(_selectedDay))
        ],
      ),
    );
  }
}
