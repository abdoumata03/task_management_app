import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SizeConfig on int {

 double get rw => (Get.width * (this / 428));
 double get rh => (Get.height * (this / 926));

}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}