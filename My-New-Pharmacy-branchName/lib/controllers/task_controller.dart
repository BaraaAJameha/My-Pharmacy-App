// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:reminder/db/db_helper.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var tasklist = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return DBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    print(tasks);
    tasklist.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delete(task);
    getTasks();
  }

  void markTAskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
