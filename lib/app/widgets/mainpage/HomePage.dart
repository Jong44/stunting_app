import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeArtikel.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeEvent.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeKomunitas.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeMenu.dart';
import 'package:stunting_app/app/widgets/mainpage/pages/homepage/HomeProfileAnak.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Iconify(Ph.map_pin_light),
                const SizedBox(width: 5),
                Text(
                  "Jakarta",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.chevron_down,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Iconify(
                Ph.envelope_light,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Iconify(
                Ph.bell_light,
                size: 28,
              ),
            ),
            const SizedBox(width: 5),
          ],
          leadingWidth: 200,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  HomeProfileAnak(),
                  const SizedBox(height: 25),
                  HomeMenu(),
                  const SizedBox(height: 15),
                  HomeEvent(),
                  const SizedBox(height: 15),
                  HomeKomunitas(),
                  const SizedBox(height: 15),
                  HomeArtikel(),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ));
  }
}
