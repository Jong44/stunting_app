import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownInput extends StatelessWidget {
  final onChange;
  final List items;
  final String hintText;
  const DropdownInput({
    super.key,
    required this.onChange,
    required this.items,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: Container(),
        hint: Text(
          hintText,
          style: TextStyle(fontSize: 14.0),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            child: Text(item),
            value: item,
          );
        }).toList(),
        onChanged: (value) {
          onChange(value);
        },
      ),
    );
  }
}
