import 'package:flutter/material.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  String text;
  Widget child;
  final backgroundColor;
  final Color textColor;

  PrimaryButton({
    super.key,
    required this.onPressed,
    this.text = "",
    this.child = const Text(""),
    this.backgroundColor = ColorConfig.primaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 0),
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: text == ""
          ? child
          : Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
    );
  }
}
