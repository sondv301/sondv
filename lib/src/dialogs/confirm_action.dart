import 'package:flutter/material.dart';

Future<bool> showConfirmAction(
  BuildContext context, {
  String title = "Confirm",
  String message = "message",
  String? actionTitle,
  VoidCallback? action,
  bool notCancel = false,
  bool useRootNavigator = false,
  bool barrierDismissible = false,
  TextStyle? titleStyle,
  TextStyle? contentStyle,
  double borderRadiusValue = 12,
  Color backgroundColorCancel = Colors.grey,
  Color textColorCancel = Colors.black,
  Color backgroundColorConfirm = Colors.green,
  Color textColorConfirm = Colors.white,
}) async {
  var result = await showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      builder: (contextDialog) {
        return AlertDialog(
          title: Text(
            title,
            style: titleStyle,
          ),
          content: Text(
            message,
            style: contentStyle,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          actionsAlignment: notCancel
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          actions: [
            if (notCancel == false)
              MaterialButton(
                onPressed: () => Navigator.pop(contextDialog, false),
                color: backgroundColorCancel,
                textColor: textColorCancel,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Huỷ"),
                ),
              ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(contextDialog, true);
                action?.call();
              },
              color: backgroundColorConfirm,
              textColor: textColorConfirm,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(actionTitle ?? "Đồng ý"),
              ),
            )
          ],
        );
      });
  return result;
}
