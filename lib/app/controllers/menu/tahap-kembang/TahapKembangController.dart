import 'package:get/get.dart';
import 'package:stunting_app/app/services/GrafikAnakService.dart';

class TahapKembangController extends GetxController {
  var isLoading = true.obs;
  var listHistoryTahapKembang = [].obs;
  var filterListHistoryTahapKembang = {}.obs;
  var indexAnak = 0.obs;

  void getDataAnak() async {
    isLoading.value = true;
    final response = await GrafikAnakService().getAnakList();
    if (response['status']) {
      final result = response['data'];
      listHistoryTahapKembang.value = result;
      getFilterDataAnak();
    }
    isLoading.value = false;
  }

  void getFilterDataAnak() {
    isLoading.value = true;
    filterListHistoryTahapKembang.value =
        listHistoryTahapKembang[indexAnak.value];
    filterListHistoryTahapKembang['data']['data_pertumbuhan']
        .sort((a, b) => int.parse(b['bulan_cek']) - int.parse(a['bulan_cek']));
    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataAnak();
  }
}
