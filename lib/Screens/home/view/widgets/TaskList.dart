import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/controller/tasks_controller.dart';
import 'package:task_management_app/Screens/home/view/widgets/TaskTile.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/colors.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TasksController tasksController = Get.find();
    return GetBuilder<TasksController>(builder: (TasksController controller) {
      return ClipRRect(
        child: ListView.builder(
            itemCount: tasksController.tasks.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return (tasksController.tasks[index].isCompleted)
                  ? Dismissible(
                      key: UniqueKey(),
                      onDismissed: (_) {
                       tasksController.dissmissTask(index);
                      },
                      child: TaskTile(
                        currentIndex: index,
                      ),
                    )
                  : TaskTile(
                      currentIndex: index,
                    );
            }),
      );
    });
  }
}
