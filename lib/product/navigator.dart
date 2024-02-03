import 'package:flutter/material.dart';

class PNavigator {
  
  static nextPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static backPage(BuildContext context) {
    Navigator.pop(context);
  }

  static backPageWithData(BuildContext context, dynamic data) {
    Navigator.pop(context, data);
  }

  static nextPageAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
}
