import 'package:get/get.dart';
import 'package:stunting_app/app/services/GrafikAnakService.dart';
import 'package:stunting_app/app/utils/getStatus.dart';

class TahapKembangController extends GetxController {
  var isLoading = true.obs;
  var listHistoryTahapKembang = [].obs;
  var filterListHistoryTahapKembang = {}.obs;
  var indexAnak = 0.obs;
  var zScore = 2.obs;
  var indexActive = 0.obs;
  var listTrackPerkembangan = [].obs;

  var minX = 45.0.obs;
  var maxX = 120.0.obs;
  var minY = 2.0.obs;
  var maxY = 35.0.obs;

  var _centerTinggi = 0.0.obs;
  var _centerBerat = 0.0.obs;

  void calculateHighlightCenter(List<dynamic> highlightedDataList) {
    // Pastikan daftar tidak kosong
    if (highlightedDataList.isEmpty) return;

    double totalTinggi = 0.0;
    double totalBerat = 0.0;

    // Cek format data (apakah Map atau FlSpot)
    for (var data in highlightedDataList) {
      if (data is Map<String, double>) {
        // Format Map: {'tinggi_badan': value, 'berat_badan': value}
        totalTinggi += data['tinggi_badan']!;
        totalBerat += data['berat_badan']!;
      }
    }

    // Hitung rata-rata
    _centerTinggi.value = totalTinggi / highlightedDataList.length;
    _centerBerat.value = totalBerat / highlightedDataList.length;
  }

  void zoomIn(List<dynamic> highlightedDataList) {
    // Hitung pusat data highlight
    calculateHighlightCenter(highlightedDataList);

    // Hitung rentang baru untuk zoom in (20% lebih kecil dari rentang saat ini)
    final newXRange = (maxX.value - minX.value) * 0.8; // Zoom in 20%
    final newYRange = (maxY.value - minY.value) * 0.8;

    // Pusatkan daftar highlight di tengah
    minX.value = _centerTinggi.value - newXRange / 2;
    maxX.value = _centerTinggi.value + newXRange / 2;
    minY.value = _centerBerat.value - newYRange / 2;
    maxY.value = _centerBerat.value + newYRange / 2;

    // Validasi batas zoom
    _validateZoomBounds();
  }

  // Fungsi untuk zoom in
  void zoomOut(List highlightedDataList) {
    // Hitung pusat data highlight
    calculateHighlightCenter(highlightedDataList);

    // Hitung rentang baru untuk zoom out
    final newXRange = (maxX.value - minX.value) * 1.25; // Zoom 25% out
    final newYRange = (maxY.value - minY.value) * 1.25;

    // Pusatkan daftar highlight di tengah
    minX.value = _centerTinggi.value - newXRange / 2;
    maxX.value = _centerTinggi.value + newXRange / 2;
    minY.value = _centerBerat.value - newYRange / 2;
    maxY.value = _centerBerat.value + newYRange / 2;

    // Validasi batas zoom
    _validateZoomBounds();
  }

  void _validateZoomBounds() {
    const globalMinX = 0.0; // Batas minimum global X
    const globalMaxX = 200.0; // Batas maksimum global X
    const globalMinY = 0.0; // Batas minimum global Y
    const globalMaxY = 50.0; // Batas maksimum global Y

    // Validasi nilai min dan max
    minX.value = minX.value.clamp(globalMinX, globalMaxX);
    maxX.value = maxX.value.clamp(globalMinX, globalMaxX);
    minY.value = minY.value.clamp(globalMinY, globalMaxY);
    maxY.value = maxY.value.clamp(globalMinY, globalMaxY);

    // Pastikan min < max
    if (minX.value >= maxX.value) {
      final centerX = (minX.value + maxX.value) / 2;
      minX.value = centerX - 1; // Atur jarak minimal
      maxX.value = centerX + 1;
    }
    if (minY.value >= maxY.value) {
      final centerY = (minY.value + maxY.value) / 2;
      minY.value = centerY - 1; // Atur jarak minimal
      maxY.value = centerY + 1;
    }
  }

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
    // urutkan data berdasarkan bulan cek dan tahun cek
    filterListHistoryTahapKembang['data']['data_pertumbuhan'].sort((a, b) {
      return int.parse(b['tahun_cek']).compareTo(int.parse(a['tahun_cek']));
    });
    filterListHistoryTahapKembang['data']['data_pertumbuhan'].map((e) {
      e['zScore'] = GetStatus.calculateZScore(
          double.parse(e['tinggi_badan']), double.parse(e['berat_badan']));
    }).toList();
    isLoading.value = false;
  }

  void changeActiveIndex(int index) {
    indexActive.value = index;
    zScore.value = GetStatus.calculateZScore(
      double.parse(filterListHistoryTahapKembang['data']['data_pertumbuhan']
          [index]['tinggi_badan']),
      double.parse(filterListHistoryTahapKembang['data']['data_pertumbuhan']
          [index]['berat_badan']),
    );
    listTrackPerkembangan.clear();
    listTrackPerkembangan.add({
      'tinggi_badan': double.parse(filterListHistoryTahapKembang['data']
          ['data_pertumbuhan'][index]['tinggi_badan']),
      'berat_badan': double.parse(filterListHistoryTahapKembang['data']
          ['data_pertumbuhan'][index]['berat_badan']),
    });
    calculateHighlightCenter(listTrackPerkembangan);
  }

  void getAllTrackPerkembangan() {
    listTrackPerkembangan.clear();
    for (var i = 0;
        i < filterListHistoryTahapKembang['data']['data_pertumbuhan'].length;
        i++) {
      listTrackPerkembangan.add({
        'tinggi_badan': double.parse(filterListHistoryTahapKembang['data']
            ['data_pertumbuhan'][i]['tinggi_badan']),
        'berat_badan': double.parse(filterListHistoryTahapKembang['data']
            ['data_pertumbuhan'][i]['berat_badan']),
      });
    }
    calculateHighlightCenter(listTrackPerkembangan);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataAnak();
  }
}
