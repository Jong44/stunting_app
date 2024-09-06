import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Text('Fitur ini belum tersedia'),
        ),
      ),
    );
  }
}
