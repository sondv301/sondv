import 'package:flutter/material.dart';

class ConfirmInputDialog extends StatelessWidget {
  final String title;
  final String? message;
  final String hintText;
  final String? labelInput;
  final String textAction;
  final TextInputType? keyboardType;
  final int? maxLineInput;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final TextStyle? inputStyle;
  final double borderRadiusValue;
  final Color backgroundColorCancel;
  final Color textColorCancel;
  final Color backgroundColorConfirm;
  final Color textColorConfirm;
  const ConfirmInputDialog({
    Key? key,
    this.textAction = "Xác nhận",
    this.title = "Input",
    this.hintText = "Input",
    this.keyboardType,
    this.message,
    this.labelInput,
    this.maxLineInput,
    this.textColorConfirm = Colors.white,
    this.backgroundColorConfirm = Colors.green,
    this.textColorCancel = Colors.black,
    this.backgroundColorCancel = Colors.grey,
    this.titleStyle,
    this.borderRadiusValue = 12,
    this.contentStyle,
    this.inputStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrlInput = TextEditingController();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusValue),
      ),
      title: Text(
        title,
        style: titleStyle,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            message == null
                ? Container()
                : Text(message ?? "", style: contentStyle),
            TextField(
              controller: ctrlInput,
              maxLines: maxLineInput,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                label: labelInput == null ? null : Text(labelInput ?? ""),
              ),
              style: inputStyle,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context, null),
          color: backgroundColorCancel,
          textColor: textColorCancel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Cancel"),
          ),
        ),
        MaterialButton(
          onPressed: () async {
            String data = ctrlInput.text.trim();
            Navigator.pop(context, data);
          },
          color: backgroundColorConfirm,
          textColor: textColorConfirm,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(textAction),
          ),
        )
      ],
    );
  }
}

Future<String?> showConfirmInputDialog(
  BuildContext context, {
  String title = "Input",
  String hintText = "Input",
  String textAction = "Action",
  TextInputType? keyboardType,
  String? message,
  String? labelInput,
  int? maxLineInput,
  bool useRootNavigator = false,
  bool barrierDismissible = false,
  TextStyle? titleStyle,
  TextStyle? contentStyle,
  TextStyle? inputStyle,
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
    builder: (context) => ConfirmInputDialog(
      title: title,
      hintText: hintText,
      textAction: textAction,
      keyboardType: keyboardType,
      message: message,
      labelInput: labelInput,
      maxLineInput: maxLineInput,
      titleStyle: titleStyle,
      contentStyle: contentStyle,
      inputStyle: inputStyle,
      borderRadiusValue: borderRadiusValue,
      backgroundColorCancel: backgroundColorCancel,
      backgroundColorConfirm: backgroundColorConfirm,
      textColorCancel: textColorCancel,
      textColorConfirm: textColorConfirm,
    ),
  );
  return result;
}
