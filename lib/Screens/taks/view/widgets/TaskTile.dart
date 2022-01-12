import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/controller/tasks_controller.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/colors.dart';

TasksController tasksController = Get.find();

class TaskTile extends StatelessWidget {
  final int? currentIndex;
  TaskTile({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.rh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1.5, color: kAccentColor),
        color: tasksController.tasks![currentIndex!].isCompleted? kAccentColor:null,
      ),
      child: ListTile(
        title: Text(tasksController.tasks![currentIndex!].title!),
        onTap: () {
          tasksController.toggleTasktile(tasksController.tasks![currentIndex!]);
        },
        contentPadding: EdgeInsets.only(left: 25.rw, right: 10.rw),
        trailing: Checkbox(
          value: tasksController.tasks![currentIndex!].isCompleted,
          onChanged: (val) {
            tasksController.toggleTasktile(tasksController.tasks![currentIndex!]);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          fillColor: MaterialStateProperty.all<Color>(kSecondaryColor),
        ),
        
      ),
    );
  }
}
