import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/colors.dart';

class EmptyListPlaceholder extends StatelessWidget {
  const EmptyListPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 90.rw,
      height: 250.rh,
      padding: EdgeInsets.only(bottom: 100.rh),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.8,
            child: SvgPicture.asset(
              'assets/illustrations/AddNotes.svg',
              height: 115.rh,
            ),
          ),
          SizedBox(
            height: 20.rh,
          ),
          Text(
            'You can add new tasks here. \nAll clear for now ✨',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.rh,
              color: kDarkAccent,
            ),
          ),
        ],
      ),
    );
  }
}
