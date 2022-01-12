import 'package:get/get.dart';
import 'package:task_management_app/Screens/home/view/home.dart';
import 'package:task_management_app/Screens/home/view/home.dart';
import 'package:task_management_app/Screens/username_screen/view/username.dart';
import 'package:task_management_app/Screens/welcome/welcome.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: '/Username',
      page: () => UsernameScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/Home',
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
