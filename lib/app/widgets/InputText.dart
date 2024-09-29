import 'package:flutter/material.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';

class InputText extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final onChange;
  final onClick;
  final fontSize;
  final typeInput;
  final textController;
  final maxLines;

  const InputText({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.onChange,
    this.onClick,
    this.fontSize = 14.0,
    this.typeInput = TextInputType.text,
    this.textController,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: textController,
        onTap: onClick,
        style: TextStyle(
          fontSize: fontSize,
        ),
        onChanged: onChange,
        obscureText: isPassword,
        keyboardType: typeInput,
        maxLines: maxLines,
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
