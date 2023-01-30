import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

void showLog(dynamic object, {String flags = "App Logs"}) {
  if (kDebugMode) {
    print(
        "===[${DateFormat("HH:mm:ss").format(DateTime.now())}]$flags: $object");
  }
}

void showLogWithoutTime(dynamic object, {String flags = "App Logs"}) {
  if (kDebugMode) {
    print("===$flags: $object");
  }
}
