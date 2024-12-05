// ignore_for_file: deprecated_member_use, prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable, duplicate_ignore, no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reminder/Ui/theme.dart';
import 'package:reminder/Ui/widgets/button.dart';
import 'package:reminder/Ui/widgets/input_field.dart';
import 'package:reminder/controllers/task_controller.dart';
import 'package:reminder/models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController =Get.put(TaskController());
final TextEditingController _titleController=TextEditingController();
final TextEditingController _noteController =TextEditingController();
  DateTime _selectDate=DateTime.now();
  String _endTime="9:30 PM";
  String _startTime=DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind=5;
  List<int> remindList=[5,10,15,20];
    String _selectedRepeat="None";
  List<String> repeatList=["None","Daily","Weekly","Monthly"];
  int _selectedColor=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:context.theme.backgroundColor,
      appBar:_appBar(context) ,
      body: Container(
padding: const EdgeInsets.only(left: 20, right: 20),
child: SingleChildScrollView(
  child:   Column(
    children: [
      Text("Add Drug",style: HeadingStyle,),
       MyInputField(title: "Drug Name", hint: "Enter your title" ,controller: _titleController,),
        MyInputField(title: "Note", hint: "Enter your note",controller: _noteController,),
        MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectDate),
        
        widget:IconButton(
          icon: const Icon(Icons.calendar_today_outlined,
          color: Colors.grey,),
          onPressed: (){
         

            _getDateFromUser();
        },
       ),
     
        ),
      Row(
            children: [
          Expanded(
            child:MyInputField(title: "Start Date", hint:_startTime,widget:IconButton(
              onPressed: () {
                
                _getTimeFromUser(isStartTime: true);
              },
              icon: Icon(
                Icons.access_time_rounded,
                color: Colors.grey,
              ),
            ) , ),) ,

            SizedBox(width: 10,),
             Expanded(
            child:MyInputField(title: "End Date", hint:_endTime,widget:IconButton(
              onPressed: () {
                   _getTimeFromUser(isStartTime: false);
              },
              icon: Icon(
                Icons.access_time_rounded,
                color: Colors.grey,
              ),
            ) , ),) 
        ],
      ),
      MyInputField(title:"Remind", hint: "$_selectedRemind minutes early",
      widget: DropdownButton(

        icon: Icon(Icons.keyboard_arrow_down,
        color: Colors.grey,),
        iconSize: 32,
        elevation: 4,
        style: subTitleStyle,
        underline: Container(height: 0),
        onChanged: (String? newvalue){
          setState(() {
            _selectedRemind=int.parse(newvalue!);
          });
        },
        items: remindList.map<DropdownMenuItem<String>>((int value){
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(value.toString()),

          );
        }
        ).toList(),
      ),),





    MyInputField(title:"Repeat", hint: "$_selectedRepeat",
      widget: DropdownButton(

        icon: Icon(Icons.keyboard_arrow_down,
        color: Colors.grey,),
        iconSize: 32,
        elevation: 4,
        style: subTitleStyle,
        underline: Container(height: 0),
        onChanged: (String? newvalue){
          setState(() {
            _selectedRepeat=newvalue!;
          });
        },
        items: repeatList.map<DropdownMenuItem<String>>((String? value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value!,style:TextStyle(color:Colors.grey)),

          );
        }
        ).toList(),
      ),),
      
      SizedBox(height: 18,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      _colorPallete(),
      MyButton(label: "Create", onTap: ()=>_validateDate())
        ],
      ),
    ],
  ),
),


      ),
    );
  }



_validateDate(){
  if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
    //add to database
    _addTaskToDb();
    Get.back();
  }
  else if(_titleController.text.isEmpty||_noteController.text.isNotEmpty){
    Get.snackbar("Required", "All fields are required!",
    snackPosition:SnackPosition.BOTTOM,
backgroundColor: Colors.white,
colorText: Color.fromARGB(255, 255, 19, 19),
icon:Icon(Icons.warning_amber_rounded)
    );
  }

}

_addTaskToDb() async {
  int value =await _taskController.addTask(
     task: Task(
    note: _noteController.text,
    title: _titleController.text,
    date: DateFormat.yMd().format(_selectDate),
    startTime: _startTime,
    endTime: _endTime,
    remind: _selectedRemind,
    repeat: _selectedRepeat,
    color: _selectedColor,
    isCompleted: 0,



  )
  );
 

}
_colorPallete(){
  return     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color",style: titleStyle,),
              SizedBox(height: 8.0,),
              Wrap(
                children: List<Widget>.generate(
                  3,
                  (int index){
                    // ignore: prefer_const_constructors
                    return GestureDetector(
                      onTap: (){
                   setState(() {
                      _selectedColor=index;
                      print("$index");
                   });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        // ignore: prefer_const_constructors
                        child: CircleAvatar(
                          radius:14,
                          backgroundColor:index==0?Color.fromARGB(255, 117, 109, 163):index==1?Colors.pink:Color.fromARGB(255, 255, 173, 65),
                      child: _selectedColor==index?Icon(Icons.done,color:Colors.white,size: 16,):Container(),
                        ),
                      ),
                    );
                  }
                ),
              )
            ],
          );
}

    _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
          
        },
        child: Icon(Icons.arrow_back_ios,
         
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/male.png"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }


  _getDateFromUser() async {
    DateTime? _pickerDate=await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2015),
       lastDate: DateTime(2121),
  
    );
    if(_pickerDate!=null){
    setState(() {
        _selectDate=_pickerDate;
        print(_selectDate);
      
    });
    }
      else{
        print("it's null or something is wrong");
      }
    
  }
  _getTimeFromUser({required bool isStartTime}) async {
   var pickedTime=await  _showTimePicker();
   String _formatedTime=pickedTime.format(context);
   if(pickedTime==null){
    print("Time canceld");


   }
   else if(isStartTime==true){

setState(() {
  _startTime=_formatedTime;
});
   }
   else if(isStartTime==false){
    setState(() {
      _endTime=_formatedTime;
    });


   }
}
_showTimePicker(){
     return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input ,
      
      context: context, initialTime: 
      TimeOfDay(
        hour: int.parse(_startTime.split(":")[0])
        , minute: int.parse(_startTime.split(":")[1].split(" ")[0])
        ));

}
}
