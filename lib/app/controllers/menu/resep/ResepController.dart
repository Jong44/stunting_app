import 'package:get/get.dart';
import 'package:stunting_app/app/services/ResepService.dart';

class ResepController extends GetxController {
  var isLoading = false.obs;
  var isLoadingDetail = false.obs;
  var indexCategory = 0.obs;
  var indexTab = 0.obs;

  var kategoriList = [].obs;
  var resepPopulerList = [].obs;
  var resepRekomendasiList = [].obs;
  var resepById = {}.obs;
  var resepByCategory = [].obs;
  var resepBySearch = [].obs;
  var search = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getResep();
    getCategory();
  }

  void getResep() async {
    isLoading(true);
    final response = await ResepService().getAllResep();
    if (response['status']) {
      resepRekomendasiList.value = response['data'];
    }
    getResepPopuler();
    isLoading(false);
  }

  void getCategory() async {
    isLoading(true);
    final response = await ResepService().getCatergory();
    if (response['status']) {
      kategoriList.value = response['data'];
      kategoriList.insert(0, {'category': 'Semua'});
    }
    isLoading(false);
  }

  void getResepPopuler() async {
    var list = resepRekomendasiList;
    list.sort((a, b) {
      // cek apakah ada field jumlah penonton
      if (a['data']['jumlahPengunjung'] != null &&
          b['data']['jumlahPengunjung'] != null) {
        return b['data']['jumlahPengunjung']
            .compareTo(a['data']['jumlahPengunjung']);
      } else {
        return 0;
      }
    });
    resepPopulerList.value = list;
  }

  void updateIndexCategory(int index) {
    indexCategory.value = index;
    filterResepByCategory();
  }

  void getResepById(String id) async {
    isLoadingDetail(true);
    final response = await ResepService().getResepById(id);
    if (response['status']) {
      resepById.value = response['data'];
    }
    isLoadingDetail(false);
  }

  void updateIndexTab(int index) {
    indexTab.value = index;
  }

  void updateJumlahPengunjung(String id) async {
    final response = await ResepService().updateJumlahPengunjung(id);
    if (response['status']) {
      resepPopulerList.map((element) {
        if (element['id'] == id) {
          element['data']['jumlahPengunjung'] =
              response['data']['jumlahPengunjung'];
        }
      }).toList();
    }
    getResepPopuler();
  }

  void setSearch(String value) {
    search.value = value;
    if (value == "") {
      resepBySearch.clear();
    } else {
      resepBySearch.value = resepRekomendasiList.where((element) {
        return element['data']['title'].toLowerCase().contains(value);
      }).toList();
    }
  }

  void filterResepByCategory() {
    if (indexCategory.value == 0) {
      resepByCategory.clear();
    } else {
      resepByCategory.value = resepRekomendasiList.where((element) {
        return element['data']['category'] ==
            kategoriList[indexCategory.value]['category'];
      }).toList();
    }
  }
}
