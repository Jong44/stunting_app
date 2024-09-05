import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/raphael.dart';
import 'package:stunting_app/app/config/ColorConfig.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/ProfileController.dart';
import 'package:stunting_app/app/widgets/menu/profile/DisplayProfilePage.dart';
import 'package:stunting_app/app/widgets/menu/profile/EditProfilePage.dart';

class DetailProfilePage extends StatelessWidget {
  const DetailProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Info Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Obx(() {
                          if (controller.newImage.value.path != "") {
                            return CircleAvatar(
                              radius: 55,
                              backgroundImage:
                                  FileImage(controller.newImage.value),
                            );
                          } else {
                            if (controller.dataProfile['photoURL'] != null) {
                              return CircleAvatar(
                                radius: 55,
                                backgroundImage: NetworkImage(
                                    controller.dataProfile['photoURL']),
                              );
                            } else {
                              return Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              );
                            }
                          }
                        }),
                        Obx(() {
                          if (controller.isEdit.value) {
                            return Positioned(
                              bottom: 5,
                              right: 10,
                              child: InkWell(
                                onTap: () {
                                  controller.showBottomSheetImagePicker();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConfig.primaryColor,
                                  ),
                                  child: const Iconify(
                                    Mdi.camera_plus_outline,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        })
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.setEdit();
                          controller.initController();
                        },
                        icon: const Iconify(
                          Raphael.edit,
                          color: ColorConfig.primaryColor,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    if (controller.isEdit.value) {
                      return EditProfilePage(
                        controller: controller,
                      );
                    } else {
                      return DisplayProfilePage(
                        nama: controller.dataProfile['name'] ?? '',
                        username: controller.dataProfile['username'] ?? '',
                        jenisKelamin: controller.dataProfile['gender'] ?? '',
                        alamat:
                            "${controller.dataProfile['province'] ?? ''}, ${controller.dataProfile['kabupaten'] ?? ''}, ${controller.dataProfile['kecamatan'] ?? ''}",
                        alamatEmail: controller.dataProfile['email'] ?? '',
                      );
                    }
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
