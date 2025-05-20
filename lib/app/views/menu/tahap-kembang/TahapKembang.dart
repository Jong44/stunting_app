import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/menu/tahap-kembang/TahapKembangController.dart';
import 'package:stunting_app/app/utils/getUmur.dart';
import 'package:stunting_app/app/widgets/menu/tahap-kembang/CardHistoryTahapKembang.dart';

class TahapKembang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TahapKembangController controllerTahapKembang =
        Get.put(TahapKembangController());

    return Obx(() {
      if (controllerTahapKembang.isLoading.value) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (controllerTahapKembang.listHistoryTahapKembang.isEmpty) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Data Kosong',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tahap Kembang',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => controllerTahapKembang.listHistoryTahapKembang.isEmpty
                        ? const CircularProgressIndicator()
                        : DropdownButton(
                            value: controllerTahapKembang.indexAnak.value,
                            items: List.generate(
                              controllerTahapKembang
                                  .listHistoryTahapKembang.length,
                              (index) {
                                final data = controllerTahapKembang
                                    .listHistoryTahapKembang[index]['data'];
                                return DropdownMenuItem(
                                  value: index,
                                  child: Text(
                                    data['nama_bayi'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                            onChanged: (value) {
                              controllerTahapKembang.indexAnak.value = value!;
                              controllerTahapKembang.getFilterDataAnak();
                            },
                          ),
                  ),
                  const SizedBox(width: 10),
                  Obx(
                    () => Text(
                      'Umur : ${getUmur(
                        controllerTahapKembang
                                .filterListHistoryTahapKembang['data']
                            ['tanggal_lahir'],
                        controllerTahapKembang
                                .filterListHistoryTahapKembang['data']
                            ['bulan_lahir'],
                        controllerTahapKembang
                                .filterListHistoryTahapKembang['data']
                            ['tahun_lahir'],
                      )}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Obx(() {
                    if (controllerTahapKembang.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(
                                show: true,
                                horizontalInterval:
                                    (controllerTahapKembang.maxY.value -
                                            controllerTahapKembang.minY.value) /
                                        5, // Dinamis
                                verticalInterval:
                                    (controllerTahapKembang.maxX.value -
                                            controllerTahapKembang.minX.value) /
                                        5, // Dinamis
                              ), // Menampilkan grid
                              titlesData: FlTitlesData(
                                rightTitles: const AxisTitles(
                                  axisNameWidget: Text(
                                    'Berat Badan (kg)',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                topTitles: const AxisTitles(
                                  axisNameWidget: Text(
                                    'Tinggi Badan (cm)',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 22,
                                    getTitlesWidget: (value, meta) {
                                      return Text("${value.toInt()}",
                                          style: const TextStyle(fontSize: 12));
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 32,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        "${value.toInt()}",
                                        style: TextStyle(fontSize: 12),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              minX: controllerTahapKembang
                                  .minX.value, // Min tinggi badan
                              maxX: controllerTahapKembang
                                  .maxX.value, // Max tinggi badan
                              minY: controllerTahapKembang
                                  .minY.value, // Min berat badan
                              maxY: controllerTahapKembang
                                  .maxY.value, // Max berat badan
                              lineBarsData: [
                                LineChartBarData(
                                  spots: _generateDataForTinggidanBerat(
                                      controllerTahapKembang
                                          .listTrackPerkembangan.value),
                                  color: Colors.black,
                                  isCurved: false,
                                  barWidth: 2,
                                  isStrokeCapRound: true,
                                  dotData: const FlDotData(show: true),
                                ),
                                ..._generateZScoreLines(
                                  controllerTahapKembang.zScore.value,
                                  controllerTahapKembang
                                              .filterListHistoryTahapKembang[
                                          'data']['indexGender'] ??
                                      0,
                                  controllerTahapKembang.minX.value,
                                  controllerTahapKembang.maxX.value,
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Z-Score : ${controllerTahapKembang.zScore.value}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() {
                          return Text(
                            'Gender : ${controllerTahapKembang.filterListHistoryTahapKembang['data']['indexGender'] == 0 ? 'Laki-laki' : 'Perempuan'}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        })
                      ],
                    );
                  })),
              const SizedBox(height: 20),
              const Text(
                'Histori Tahap Kembang',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  controllerTahapKembang.getAllTrackPerkembangan();
                },
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(
                () {
                  if (controllerTahapKembang.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (controllerTahapKembang
                      .filterListHistoryTahapKembang['data']['data_pertumbuhan']
                      .isEmpty) {
                    return const Center(
                      child: Text('Data Kosong'),
                    );
                  }
                  return Column(
                    children: List.generate(
                      controllerTahapKembang
                          .filterListHistoryTahapKembang['data']
                              ['data_pertumbuhan']
                          .length,
                      (index) {
                        final data = controllerTahapKembang
                                .filterListHistoryTahapKembang['data']
                            ['data_pertumbuhan'][index];
                        return GestureDetector(
                          onTap: () {
                            controllerTahapKembang.changeActiveIndex(index);
                          },
                          child: CardHistoryTahapKembang(
                            zScore: data['zScore'],
                            isActive:
                                controllerTahapKembang.indexActive.value ==
                                    index,
                            tinggiBadan: data['tinggi_badan'],
                            beratBadan: data['berat_badan'],
                            tanggalCek: data['tanggal_cek'] ?? '-',
                            bulanCek: data['bulan_cek'],
                            tahunCek: data['tahun_cek'],
                            indexGender: controllerTahapKembang
                                    .filterListHistoryTahapKembang['data']
                                ['indexGender'],
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }

  List<LineChartBarData> _generateZScoreLines(
      int highlightedZScore, int indexGender, double minX, double maxX) {
    final List<double> zScores = [-2, -1, 0, 1, 2];
    final List colors = [
      Colors.orange.withOpacity(0.5),
      Colors.amber.withOpacity(0.5),
      Colors.green.withOpacity(1),
      Colors.blue.withOpacity(0.5),
      Colors.purple.withOpacity(0.5),
    ];

    final List colorsHighlight = [
      Colors.orange,
      Colors.amber,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];

    return zScores.map((z) {
      final isHighlighted = z == highlightedZScore;
      return LineChartBarData(
        spots: indexGender == 0
            ? _generateDataForZMan(z, minX, maxX)
            : _generateDataForZWoman(z, minX, maxX),
        isCurved: false,
        color: isHighlighted
            ? colorsHighlight[zScores.indexOf(z)]
            : colors[zScores.indexOf(z)],
        barWidth: colors[zScores.indexOf(2)] == Colors.green
            ? 1.5
            : isHighlighted
                ? 2
                : 1,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
      );
    }).toList();
  }

  List<FlSpot> _generateDataForZWoman(double zScore, double minX, double maxX) {
    // Data rata-rata (mu) dan standar deviasi (sigma) berdasarkan grafik WHO untuk wanita
    final data = {
      45: {'mu': 2.3, 'sigma': 0.4},
      50: {'mu': 3.4, 'sigma': 0.5},
      55: {'mu': 4.5, 'sigma': 0.6},
      60: {'mu': 5.8, 'sigma': 0.7},
      65: {'mu': 7.2, 'sigma': 0.8},
      70: {'mu': 8.7, 'sigma': 0.9},
      75: {'mu': 10.2, 'sigma': 1.0},
      80: {'mu': 11.8, 'sigma': 1.1},
      85: {'mu': 13.5, 'sigma': 1.2},
      90: {'mu': 15.3, 'sigma': 1.3},
      95: {'mu': 17.0, 'sigma': 1.4},
      100: {'mu': 18.9, 'sigma': 1.5},
      105: {'mu': 20.8, 'sigma': 1.6},
      110: {'mu': 22.8, 'sigma': 1.7},
      115: {'mu': 24.8, 'sigma': 1.8},
      120: {'mu': 26.8, 'sigma': 1.9},
    };

    // Generate data untuk setiap tinggi badan
    return data.entries
        .where((entry) =>
            entry.key.toDouble() >= minX && entry.key.toDouble() <= maxX)
        .map((entry) {
      final height = entry.key.toDouble();
      final mu = entry.value['mu']!;
      final sigma = entry.value['sigma']!;
      final weight = mu + zScore * sigma;
      return FlSpot(height, weight);
    }).toList();
  }

  List<FlSpot> _generateDataForZMan(double zScore, double minX, double maxX) {
    final data = {
      45: {'mu': 4.5, 'sigma': 0.5},
      50: {'mu': 5.5, 'sigma': 0.6},
      55: {'mu': 6.7, 'sigma': 0.7},
      60: {'mu': 7.9, 'sigma': 0.8},
      65: {'mu': 9.1, 'sigma': 0.9},
      70: {'mu': 10.5, 'sigma': 1.0},
      75: {'mu': 11.8, 'sigma': 1.1},
      80: {'mu': 13.2, 'sigma': 1.2},
      85: {'mu': 14.5, 'sigma': 1.3},
      90: {'mu': 15.8, 'sigma': 1.4},
      95: {'mu': 17.0, 'sigma': 1.5},
      100: {'mu': 18.2, 'sigma': 1.6},
      105: {'mu': 19.5, 'sigma': 1.7},
      110: {'mu': 20.8, 'sigma': 1.8},
      115: {'mu': 22.0, 'sigma': 1.9},
      120: {'mu': 23.2, 'sigma': 2.0},
    };

    return data.entries
        .where((entry) =>
            entry.key.toDouble() >= minX && entry.key.toDouble() <= maxX)
        .map((entry) {
      final height = entry.key.toDouble();
      final mu = entry.value['mu']!;
      final sigma = entry.value['sigma']!;
      final weight = mu + zScore * sigma;
      return FlSpot(height, weight);
    }).toList();
  }

  List<FlSpot> _generateDataForTinggidanBerat(List perkembangan) {
    // menyesuaikann zoom in dan zoom out
    return [
      for (final data in perkembangan)
        FlSpot(
          data['tinggi_badan'],
          data['berat_badan'],
        )
    ];
  }
}
