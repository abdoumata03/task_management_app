import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/username_screen/controller/username_controller.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({ Key? key }) : super(key: key);
  UsernameController userController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${userController.readUsername()}\'s Profile'),
    );
  }
}