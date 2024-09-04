import 'package:get/get.dart';
import 'package:stunting_app/app/services/ArtikelService.dart';

class ArtikelController extends GetxController {
  var idArtikel = "".obs;

  var isLoading = false.obs;
  var mapArtikel = {}.obs;
  var listArtikel = [].obs;
  var listArtikelByCategory = [].obs;
  var listArtikelPopuler = [].obs;
  var listArtikelBySearch = [].obs;
  var search = "".obs;

  var indexCategory = 0.obs;
  var listCategory = [].obs;

  @override
  void onInit() {
    super.onInit();
    idArtikel.value = Get.parameters['id'] ?? "";
    print(idArtikel);
    if (idArtikel.value != "") {
      getArtikelById();
    } else {
      getArtikelAll();
      getCategory();
    }
  }

  void getArtikelById() async {
    isLoading.value = true;
    final response = await ArtikelService().getArtikelById(idArtikel.value);
    if (response['status']) {
      mapArtikel.value = response['data'];
    }
    isLoading.value = false;
  }

  void getArtikelAll() async {
    isLoading.value = true;
    final response = await ArtikelService().getAllArtikel();
    if (response['status']) {
      listArtikel.value = response['data'];
    }
    getArtikelPopuler();
    isLoading.value = false;
  }

  void getArtikelPopuler() {
    // mengurutkan artikel berdasarkan jumlah penonton
    var list = listArtikel;
    list.sort((a, b) {
      // cek apakah ada field jumlah penonton
      if (a['data']['jumlah_penonton'] != null &&
          b['data']['jumlah_penonton'] != null) {
        return b['data']['jumlah_penonton']
            .compareTo(a['data']['jumlah_penonton']);
      } else {
        return 0;
      }
    });
    listArtikelPopuler.value = list;
  }

  void getCategory() async {
    isLoading.value = true;
    final response = await ArtikelService().getCategoryArtikel();
    if (response['status']) {
      listCategory.value = response['data'];
      listCategory.insert(0, {
        "data": {"category": "Semua"}
      });
    }
    isLoading.value = false;
  }

  void setIndexCategory(int index) {
    indexCategory.value = index;
    filterArtikelByCategory();
  }

  void updateJumlahPenonton(String id) async {
    final response = await ArtikelService().updateJumlahPenonton(id);
    if (response['status']) {
      listArtikel.map((e) {
        if (e['id'] == idArtikel.value) {
          e['data']['jumlah_penonton'] = response['data']['jumlah_penonton'];
        }
      }).toList();
    }
    getArtikelPopuler();
  }

  void filterArtikelByCategory() {
    if (indexCategory.value == 0) {
      listArtikelByCategory.clear();
    } else {
      if (search.value == "") {
        listArtikelByCategory.value = listArtikel.where((element) {
          return element['data']['category'] ==
              listCategory[indexCategory.value]['data']['category'];
        }).toList();
      } else {
        listArtikelByCategory.value = listArtikelBySearch.where((element) {
          return element['data']['category'] ==
              listCategory[indexCategory.value]['data']['category'];
        }).toList();
      }
    }
  }

  void setSearch(String search) {
    this.search.value = search;
    if (search == "") {
      listArtikelBySearch.clear();
    } else {
      listArtikelBySearch.value = listArtikel.where((element) {
        return element['data']['title'].toLowerCase().contains(search);
      }).toList();
    }
  }
}
