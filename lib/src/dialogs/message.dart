import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showMessageDialog(
  BuildContext context, {
  String title = "Notification",
  String message = "Message",
  String textAction = "Confirm",
  bool useRootNavigator = false,
  bool barrierDismissible = false,
  TextStyle? titleStyle,
  TextStyle? contentStyle,
  double borderRadiusValue = 12,
  Color backgroundColorConfirm = Colors.green,
  Color textColorConfirm = Colors.white,
}) {
  showDialog(
    context: context,
    useRootNavigator: useRootNavigator,
    barrierDismissible: barrierDismissible,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        style: titleStyle,
      ),
      content: Text(
        message,
        style: contentStyle,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue)),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          color: backgroundColorConfirm,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(textAction),
          ),
        )
      ],
    ),
  );
}
