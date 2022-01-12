import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/view/pages/profile_screen.dart';
import 'package:task_management_app/Screens/home/view/pages/Tasks_body.dart';

class HomeController extends GetxController {
  List<Widget>? _screens;
  List<Widget>? get screens => _screens;
  int? bottomNavigationItemIndex = 0;

  HomeController() {
    _screens = [TasksBody(), ProfileBody()];
  }

   void changeBottomNavPageIndex(int index) {
   bottomNavigationItemIndex = index;
   update();
 }
}
