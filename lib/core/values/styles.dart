import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/extensions.dart';
import 'package:task_management_app/core/values/colors.dart';

var kDefaultPadding = EdgeInsets.symmetric(horizontal: 30.rw);

var headingTextStyle = TextStyle(
  color: kDark,
  fontSize: 28.rh,
  fontWeight: FontWeight.w800,
);

var paragraphTextStyle = TextStyle(
  color: kDarkAccent,
  fontSize: 16.rh,
  fontWeight: FontWeight.w600,
);

var welcomeButtonStyle = TextButton.styleFrom(
  primary: Colors.white,
  textStyle: TextStyle(
    fontSize: 18.rh,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w600,
  ),
  backgroundColor: Colors.indigo,
  minimumSize: Size.fromHeight(60.rh),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18),
  ),
);

var textStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 20.rh,
);
var hintTextStyle = TextStyle(
  color: kDarkAccent.withOpacity(0.7),
  fontWeight: FontWeight.w600,
);

var enabledBorderStyle = UnderlineInputBorder(
  borderSide: BorderSide(
    color: kDarkAccent.withOpacity(0.3),
    width: 1.7,
  ),
);
var focusedBorderStyle = UnderlineInputBorder(
  borderSide: BorderSide(
    color: kDark,
    width: 1.7,
  ),
);
