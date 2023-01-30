import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Icon? icon,
  Color? backgroundColor,
  Duration? duration,
  TextStyle? styleMessage,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(milliseconds: 1500),
        content: Row(
          children: [
            if (icon != null) icon,
            if (icon != null) const SizedBox(width: 8),
            Text(
              message,
              style: styleMessage,
            ),
          ],
        ),
      ),
    );
}
