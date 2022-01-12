import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/models/task_model.dart';

class TasksController extends GetxController {
 
 List<Task>? _tasks;
 List<Task>? get tasks => _tasks;
 TextEditingController taskController = TextEditingController();
 final addTaskFormKey = GlobalKey<FormState>();


 TasksController() {
   _tasks = [
     Task(id: '1', title: 'Go Play with the boys', isCompleted: false),
      Task(id: '2', title: 'Debug Code', isCompleted: false),
   ];

 }

 void addTask(Task task, BuildContext context) {
   if(addTaskFormKey.currentState!.validate()) {
     
     _tasks!.add(task);
     update();
     addTaskFormKey.currentState!.reset();
     Navigator.pop(context);
   };
 }



  String? validateTask(String? val) {
    if (taskController.text.isEmpty || taskController.text == null) {
      return 'Please add a title to your task';
    };
    return null;
  }

 void toggleTasktile(Task task) {
   int index = _tasks!.indexOf(task);
   tasks![index].isCompleted = !tasks![index].isCompleted;
   update();
 }

}