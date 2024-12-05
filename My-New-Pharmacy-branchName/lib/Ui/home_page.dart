// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:reminder/Ui/theme.dart';
import 'package:reminder/Ui/widgets/TaskTile.dart';
import 'package:reminder/Ui/widgets/add_task_bar.dart';
import 'package:reminder/Ui/widgets/button.dart';
import 'package:reminder/controllers/task_controller.dart';

import 'package:reminder/services/notification_servicdes.dart';

import '../models/task.dart';
import '../services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.tasklist.length,
            itemBuilder: (_, index) {
              Task task = _taskController.tasklist[index];
              //  print(task.toJson());
              if (task.repeat == 'Daily') {
                DateTime date =
                    DateFormat.jm().parse(task.startTime.toString());
                var myTime = DateFormat('HH:mm').format(date);
                notifyHelper.scheduledNotification(
                    int.parse(myTime.toString().split(":")[0]),
                    int.parse(myTime.toString().split(":")[1]),
                    task);
                print(myTime);
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, task);
                              },
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    ));
              }
              if (task.date == DateFormat.yMd().format(_selectDate)) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, task);
                              },
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    ));
              } else {
                return Container();
              }
            });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color: Get.isDarkMode ? Colors.blueGrey : Colors.white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
            ),
          ),
          Spacer(),
          task.isCompleted == 1
              ? Container()
              : _bottomSheetButton(
                  label: "Task Completed",
                  onTap: () {
                    _taskController.markTAskCompleted(task.id!);
                    Get.back();
                  },
                  clr: Color.fromARGB(255, 161, 79, 255),
                  context: context,
                ),
          // SizedBox(height: 20,),
          _bottomSheetButton(
            label: "Delete Task",
            onTap: () {
              _taskController.delete(task);

              Get.back();
            },
            clr: Color.fromARGB(255, 223, 57, 57),
            context: context,
          ),
          SizedBox(
            height: 20,
          ),
          _bottomSheetButton(
            label: "Close",
            onTap: () {
              Get.back();
            },
            clr: Color.fromARGB(255, 255, 255, 255),
            isClose: true,
            context: context,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        // color: isClose==true?Colors.red:Color.fromARGB(255, 162, 113, 241),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose == true
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : Color.fromARGB(255, 162, 113, 241)),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true
              ? Colors.transparent
              : Color.fromARGB(255, 162, 113, 241),
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10),
        child: DatePicker(
          DateTime.now(),
          height: 95,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: Color.fromARGB(255, 101, 109, 180),
          selectedTextColor: Colors.white,
          dateTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          )),
          dayTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          )),
          monthTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          )),
          onDateChange: (date) {
            setState(() {
              _selectDate = date;
            });
          },
        ));
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text("Today", style: HeadingStyle),
              ],
            ),
          ),
          MyButton(
              label: "Add Drug",
              onTap: () async {
                await Get.to(() => AddTaskPage());
                _taskController.getTasks();
              })
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode
                ? "Activated Light Theme"
                : "Activated Dark Theme",
          );
          //   notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/male.png"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
