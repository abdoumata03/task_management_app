import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/controller/animation_controller.dart';
import 'package:task_management_app/Screens/home/controller/tasks_controller.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/colors.dart';

TasksController tasksController = Get.find();
AnimateController animationCtrl = Get.put(AnimateController());

class TaskTile extends StatelessWidget {
  final int currentIndex;
  TaskTile({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: tasksController.tasks[currentIndex].isCompleted
                ? kAccentColor
                : Colors.white,
          );
    return SlideTransition(
      position: animationCtrl.offset,
      child: Container(
        key: UniqueKey(),
          margin: EdgeInsets.only(bottom: 10.rh, right: 30.rw, left: 30.rw),
          decoration: boxDecoration,
          child: ListTile(
            title: Text(
              tasksController.tasks[currentIndex].title,
              style: (tasksController.tasks[currentIndex].isCompleted)
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
            enabled: !tasksController.tasks[currentIndex].isCompleted,
            onTap: () {
              tasksController.toggleTasktile(tasksController.tasks[currentIndex]);
            },
            horizontalTitleGap: 5.rw,
            leading: Checkbox(
              value: tasksController.tasks[currentIndex].isCompleted,
              onChanged: (val) {
                tasksController
                    .toggleTasktile(tasksController.tasks[currentIndex]);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              fillColor: MaterialStateProperty.all<Color>(kSecondaryColor),
            ),
          )),
    );
  }
}
