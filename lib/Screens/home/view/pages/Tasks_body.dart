import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/controller/tasks_controller.dart';
import 'package:task_management_app/Screens/home/view/widgets/list_placeholder.dart';
import 'package:task_management_app/Screens/home/view/widgets/tasks_list.dart';
import 'package:task_management_app/Screens/username_screen/controller/username_controller.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/styles.dart';

class TasksBody extends StatelessWidget {
  TasksBody({
    Key? key,
  }) : super(key: key);

  UsernameController userController = Get.find();
  TasksController tasksController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30.rh),
                Text(
                  'Daily Tasks',
                  style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 22.rh),
                ),
                SizedBox(height: 23.rh),
              ],
            ),
          ),
          GetBuilder<TasksController>(
            builder: (context) {
              return Expanded(
                child: (tasksController.tasks.isEmpty)
                    ? const EmptyListPlaceholder()
                    : TasksList(),
              );
            }
          ),
        ],
      ),
    );
  }
}
