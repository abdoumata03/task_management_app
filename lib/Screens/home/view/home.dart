import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/controller/home_controller.dart';
import 'package:task_management_app/Screens/home/controller/tasks_controller.dart';
import 'package:task_management_app/Screens/home/models/task_model.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/colors.dart';
import 'package:task_management_app/core/values/styles.dart';

class HomeScreen extends StatelessWidget {

  TasksController tasksController = Get.put(TasksController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctx) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: (homeController.bottomNavigationItemIndex == 0)
            ? FloatingActionButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  showAddTask(context);
                },
                child: const Icon(Icons.add),
                backgroundColor: kSecondaryColor,
              )
            : null,
        body:
            homeController.screens![homeController.bottomNavigationItemIndex!],
        bottomNavigationBar: buildBottomNavigationBar(),
      );
    });
  }

  Container buildBottomNavigationBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: kGrey.withOpacity(0.2),
            spreadRadius: 12,
            blurRadius: 12,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: GetBuilder<HomeController>(builder: (context) {
          return BottomNavigationBar(
            currentIndex: homeController.bottomNavigationItemIndex!,
            onTap: (index) {
              homeController.changeBottomNavPageIndex(index);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: SvgPicture.asset('assets/illustrations/HomeIcon.svg'),
                activeIcon: SvgPicture.asset(
                    'assets/illustrations/SelectedHomeIcon.svg'),
              ),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon:
                      SvgPicture.asset('assets/illustrations/ProfileIcon.svg'),
                  activeIcon: SvgPicture.asset(
                      'assets/illustrations/SelectedProfileIcon.svg'))
            ],
          );
        }),
      ),
    );
  }

  Future<dynamic> showAddTask(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 30.rw,
            left: 30.rw,
            bottom: MediaQuery.of(context).viewInsets.bottom + 30.rh,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 35.rh),
              Text(
                'Add New Task',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25.rh,
                  color: kDark,
                ),
              ),
              SizedBox(height: 20.rh),
              Form(
                key: tasksController.addTaskFormKey,
                child: TextFormField(
                  autofocus: true,
                  controller: tasksController.taskController,
                  validator: tasksController.validateTask,
                  maxLength: 25,
                  cursorColor: kSecondaryColor,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: kSecondaryColor,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: kSecondaryColor,
                          width: 2,
                        ),
                      )),
                ),
              ),
              SizedBox(height: 20.rh),
              TextButton(
                onPressed: () {
                  tasksController.addTask(
                    Task(title: tasksController.taskController.text),
                    context,
                  );
                },
                child: const Text('Add Task'),
                style: welcomeButtonStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
