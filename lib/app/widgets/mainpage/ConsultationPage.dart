import 'package:flutter/material.dart';
import 'package:stunting_app/app/widgets/SearchInput.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/consultationpage/ConsulAllConsul.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/consultationpage/ConsulRecomendedConsul.dart';

class ConsultationPage extends StatelessWidget {
  const ConsultationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SearchInput(
                onChanged: (value) {
                  print(value);
                },
              ),
              const SizedBox(height: 20),
              ConsulRecomendedConsul(),
              const SizedBox(height: 20),
              ConsulAllConsul(),
            ],
          ),
        ),
      ),
    ));
  }
}
