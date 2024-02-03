import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomProgressIndicator {
  static final CustomProgressIndicator _singleton =
      CustomProgressIndicator._internal();
  late BuildContext _context;
  bool isDisplayed = false;

  factory CustomProgressIndicator() {
    return _singleton;
  }

  bool getDisplayStatus() {
    return isDisplayed;
  }

  CustomProgressIndicator._internal();

  show(BuildContext context) {
    if (isDisplayed) {
      return;
    }
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          isDisplayed = true;
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          );
        });
  }

  dismiss() {
    if (isDisplayed) {
      Navigator.of(_context).pop();
      isDisplayed = false;
    }
  }
}
