import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _ProcessingWidget extends StatelessWidget {
  final String message;
  final Widget? icon;
  final TextStyle? messageStyle;
  final Color? backgroundColor;
  final double? borderRadiusValue;
  final double? width;
  final double? height;
  const _ProcessingWidget({
    Key? key,
    this.message = "Processing",
    this.icon,
    this.messageStyle,
    this.backgroundColor,
    this.borderRadiusValue,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: backgroundColor ?? const Color(0xfff2f2f2).withOpacity(0.8),
                borderRadius: BorderRadius.circular(borderRadiusValue ?? 14)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? const CupertinoActivityIndicator(),
                const SizedBox(height: 16),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: messageStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showProcessingDialogSDV(BuildContext context, {String message = "Processing"}) {
  showDialog(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (context) => _ProcessingWidget(message: message),
  );
}
