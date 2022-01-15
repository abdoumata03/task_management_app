import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:task_management_app/Screens/home/controller/profile_controller.dart';
import 'package:task_management_app/Screens/username_screen/controller/username_controller.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/colors.dart';
import 'package:task_management_app/core/values/styles.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({Key? key}) : super(key: key);
  UsernameController userController = Get.find();
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    int _currentTasks = profileController.countCurrentTasks();
    int _completedTasks = profileController.countCompletedTasks();
    int _pendingTasks = profileController.countPendingTasks();
    String percent = profileController.calcCompletionRate();

   
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.rh),
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
            SizedBox(height: 20.rh),
            Row(
              children: [
                buildNumberStatusCard(_completedTasks, 'Completed Tasks'),
                SizedBox(width: 15.rw),
                buildNumberStatusCard(_pendingTasks, 'Pending Tasks')
              ],
            ),
            SizedBox(height: 15.rh),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.rw),
              height: 70.rh,
              decoration: profileCardDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Created Tasks:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 17.rh)),
                  Text(
                    _currentTasks.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 18.rh),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.rh),
            Container(
              padding: const EdgeInsets.all(45),
              height: Get.width - 60.rw,
              decoration: profileCardDecoration,
              child: CircularStepProgressIndicator(
                totalSteps: (_currentTasks == 0) ? 1 : _currentTasks,
                currentStep: _completedTasks,
                stepSize: 18,
                selectedColor: Colors.green,
                padding: 0,
                roundedCap: (_, __) => true,
                unselectedColor: Colors.grey[200],
                selectedStepSize: 22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$percent%',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 30.rh),
                    ),
                    Text(
                      'Efficiency',
                      style: TextStyle(color: kDarkAccent),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildNumberStatusCard(int value, String title) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      height: 150.rh,
      decoration: profileCardDecoration,
      child: Column(
        children: [
          Text(
            value.toString(),
            style: TextStyle(fontSize: 35.rh, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 8.rh),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ));
  }
}
