import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SizeConfig on int {

 double get rw => (Get.width * (this / 428));
 double get rh => (Get.height * (this / 926));

}

