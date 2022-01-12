import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_management_app/core/values/styles.dart';

class UsernameController extends GetxController {
  String value = '';
  UnderlineInputBorder? decoration;
  TextEditingController textController = TextEditingController();
  GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();

  final username = GetStorage();

  void toggleUnderline(String val) {
    value = val;
    update();
    if (value.isNotEmpty) {
      decoration = focusedBorderStyle;
    } else {
      decoration = enabledBorderStyle;
    }
  }

  String? validateUser(String? val) {
    if (textController.text.isEmpty || textController.text == null) {
      return 'Please enter a username';
    }
    ;
    return null;
  }

  void registerUser() {
    if (usernameFormKey.currentState!.validate()) {
      usernameFormKey.currentState!.reset();
      username.write('username', textController.text);
      username.write('onBoard', '1');
      Get.toNamed('/Home');
    }
  }

  String setInitialRoute() {
    var isOnBoard = username.read('onBoard');
    if (isOnBoard == null) {
      return '/';
    } else {
      return '/Home';
    }
  }

  String readUsername() {
    return username.read('username');
  }
}
