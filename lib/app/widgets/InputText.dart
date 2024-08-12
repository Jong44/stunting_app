import 'package:flutter/material.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';

class InputText extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final onChange;
  const InputText({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 14,
        ),
        onChanged: onChange,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorConfig.primaryColor,
            ),
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
