import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_management_app/Screens/username_screen/controller/username_controller.dart';
import 'package:task_management_app/core/values/colors.dart';
import 'package:task_management_app/routes/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  UsernameController userController = Get.put(UsernameController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kDark,
              displayColor: kDark,
              fontFamily: 'Nunito',
            ),
      ),
      title: 'Task Management',
      initialRoute: userController.setInitialRoute(),
      getPages: Routes.routes,
    );
  }
}
