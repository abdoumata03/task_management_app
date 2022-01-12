import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/view/widgets/TaskList.dart';
import 'package:task_management_app/Screens/username_screen/controller/username_controller.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/colors.dart';
import 'package:task_management_app/core/values/styles.dart';

class TasksBody extends StatelessWidget {
  TasksBody({
    Key? key,
  }) : super(key: key);

  UsernameController userController = Get.find();

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
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/illustrations/Sample.svg',
                      width: 50.rw,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Hello, ${userController.readUsername()}',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18.rh,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40.rh),
                Text(
                  'Daily Tasks',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 22.rh),
                ),
                SizedBox(height: 23.rh),
              ],
            ),
          ),
          Expanded(
            child: TasksList(),
          ),
        ],
      ),
    );
  }
}
