import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Screens/username_screen/controller/username_controller.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/Strings.dart';
import 'package:task_management_app/core/values/colors.dart';
import 'package:task_management_app/core/values/styles.dart';

class UsernameScreen extends StatelessWidget {
  UsernameScreen({Key? key}) : super(key: key);

  final UsernameController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: Get.height,
            child: SafeArea(
              child: Padding(
                padding: kDefaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 110.rh),
                    SvgPicture.asset(
                      'assets/illustrations/welcome2.svg',
                    ),
                    SizedBox(height: 70.rh),
                    Text(
                      usernameScreenTitle,
                      textAlign: TextAlign.start,
                      style: headingTextStyle,
                    ),
                    SizedBox(height: 40.rh),
                    GetBuilder<UsernameController>(builder: (controller) {
                      return Form(
                        key: userController.usernameFormKey,
                        child: TextFormField(
                          controller: userController.textController,
                          validator: userController.validateUser,
                          onChanged: (value) {
                            userController.toggleUnderline(value);
                          },
                          cursorColor: kDarkAccent,
                          style: textStyle,
                          decoration: InputDecoration(
                            icon: SvgPicture.asset(
                              'assets/icons/username.svg',
                              color: kDarkAccent.withOpacity(0.7),
                            ),
                            hintText: 'Username',
                            hintStyle: hintTextStyle,
                            enabledBorder: userController.decoration,
                            focusedBorder: focusedBorderStyle,
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 105.rh),
                    TextButton(
                      onPressed: () async {
                        userController.registerUser();
                      },
                      child: const Text('Get Started'),
                      style: welcomeButtonStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
