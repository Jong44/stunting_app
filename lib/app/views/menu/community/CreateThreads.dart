import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/CommunityController.dart';
import 'package:stunting_app/app/widgets/DropdownInput.dart';
import 'package:stunting_app/app/widgets/InputText.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class CreateThreads extends StatelessWidget {
  const CreateThreads({super.key});

  @override
  Widget build(BuildContext context) {
    final CommunityController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buat Postingan Baru',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Judul",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                InputText(
                  textController: controller.titleController,
                  hintText: "Judul",
                  onChange: null,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Konten",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                InputText(
                  textController: controller.contentController,
                  hintText: "Konten",
                  onChange: null,
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Kategori",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return DropdownInput(
                    onChange: (value) {
                      controller.setSelectedKategori(value['name']);
                    },
                    items: controller.kategoriList,
                    hintText: controller.selectedKategori.value == ''
                        ? "Pilih Kategori"
                        : controller.selectedKategori.value,
                  );
                }),
                const SizedBox(height: 20),
                const Text(
                  "Gambar",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return InkWell(
                    onTap: controller.showBottomSheetImagePicker,
                    child: DottedBorder(
                      radius: const Radius.circular(10),
                      color: Colors.grey,
                      strokeWidth: 1,
                      child: controller.newImage.value.path == ''
                          ? Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: const Center(
                                child: Text(
                                  "Upload Gambar",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            )
                          : Image.file(
                              controller.newImage.value,
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                    ),
                  );
                }),
                const SizedBox(height: 20),
                PrimaryButton(
                  onPressed: controller.createThread,
                  text: "Buat Postingan",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
