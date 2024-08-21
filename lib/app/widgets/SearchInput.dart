import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchInput extends StatelessWidget {
  final onChanged;
  final String placeholder;
  const SearchInput(
      {super.key, required this.onChanged, this.placeholder = 'Search'});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          hintText: placeholder,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
