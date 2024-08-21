import 'package:flutter/material.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  String text;
  Widget child;

  PrimaryButton({
    super.key,
    required this.onPressed,
    this.text = "",
    this.child = const Text(""),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 0),
        backgroundColor: ColorConfig.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: text == ""
          ? child
          : Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
    );
  }
}
