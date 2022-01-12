import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/Strings.dart';
import 'package:task_management_app/core/values/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 110.rh),
              SvgPicture.asset(
                'assets/illustrations/welcome1.svg',
              ),
              SizedBox(height: 70.rh),
              Text(
                welcomeScreenTitle,
                style: headingTextStyle,
              ),
              SizedBox(height: 13.rh),
              Text(
                welcomeScreenParagraph,
                style: paragraphTextStyle,
              ),
              SizedBox(height: 125.rh),
              TextButton(
                onPressed: () {
                  Get.toNamed('/Username');
                },
                child: Text('Continue'),
                style: welcomeButtonStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
