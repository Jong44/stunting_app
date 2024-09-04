import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/app/controllers/mainpage/pages/HomeController.dart';

class HomeCardChartAnak extends StatelessWidget {
  final Map dataAnak;
  final HomeController controller;
  const HomeCardChartAnak(
      {super.key, required this.dataAnak, required this.controller});

  @override
  Widget build(BuildContext context) {
    List jenisGrafik = [
      'Grafik Berat Badan',
      'Grafik Tinggi Badan',
      'Grafik Lingkar Kepala',
    ];

    String getUmur(String tanggal, String bulan, String tahun) {
      // Mengonversi input menjadi integer
      int intTanggal;
      int intBulan;
      int intTahun;

      try {
        intTanggal = int.parse(tanggal);
        intBulan = int.parse(bulan);
        intTahun = int.parse(tahun);
      } catch (e) {
        return 'Input tidak valid';
      }

      // Mengecek validitas tanggal
      DateTime now = DateTime.now();
      DateTime birthDate;

      try {
        birthDate = DateTime(intTahun, intBulan, intTanggal);
      } catch (e) {
        return 'Tanggal lahir tidak valid';
      }

      // Mengecek apakah tanggal lahir lebih awal dari tanggal saat ini
      if (birthDate.isAfter(now)) {
        return 'Tanggal lahir tidak valid';
      }

      // Menghitung umur dasar
      int age = now.year - birthDate.year;

      // Menyesuaikan umur berdasarkan bulan dan hari
      if (now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day)) {
        age--;
      }

      if (age == 0) {
        // Jika tahun kelahiran sama dengan tahun sekarang
        if (now.month > birthDate.month) {
          // Mengembalikan jarak bulan jika sudah melewati beberapa bulan
          int monthDifference = now.month - birthDate.month;
          return '$monthDifference bulan';
        } else if (now.month == birthDate.month) {
          // Mengembalikan jarak hari jika di bulan yang sama
          int dayDifference = now.day - birthDate.day;
          return '$dayDifference hari';
        } else {
          // Jika belum sampai bulan kelahiran
          int monthDifference = 12 - (birthDate.month - now.month);
          return '$monthDifference bulan';
        }
      }

      return '$age tahun';
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      height: 205,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${dataAnak['nama_bayi']} - ${getUmur(dataAnak['tanggal_lahir'], dataAnak['bulan_lahir'], dataAnak['tahun_lahir'])}",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return Text(
                  jenisGrafik[controller.indexGrafik.value],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              const Spacer(),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  controller.showDialogMenu();
                },
                child: const Icon(
                  Icons.more_horiz,
                  size: 15.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(() {
              // Menghitung maxX berdasarkan panjang data
              final int dataLength = controller.dataDisplay.length;
              final double maxX =
                  (dataLength > 0) ? dataLength.toDouble() - 1 : 0;

              // Menentukan nilai maxY secara dinamis jika diperlukan
              final listValue =
                  controller.dataDisplay.value.map((e) => e['value']).toList();

              // mengambil berat terbesar dari data berat badan per bulan
              double maxY = listValue.reduce(
                  (value, element) => value > element ? value : element);

              return LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 1,
                    verticalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(
                        color: Color.fromARGB(255, 206, 206, 206),
                        strokeWidth: 0.3,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return const FlLine(
                        color: Color.fromARGB(255, 206, 206, 206),
                        strokeWidth: 0.4,
                      );
                    },
                  ),
                  titlesData: const FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 20,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d).withOpacity(0.5),
                    ),
                  ),
                  minX: 0,
                  maxX: maxX,
                  minY: 0,
                  maxY: maxY,
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        dataLength,
                        (index) {
                          // Menyusun titik (spot) untuk grafik berdasarkan data
                          final double berat = controller.dataDisplay[index]
                                  ['value']!
                              .toDouble();
                          return FlSpot(index.toDouble(), berat);
                        },
                      ),
                      isCurved: true,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff23b6e6),
                          Color(0xff02d39a),
                        ],
                      ),
                      barWidth: 1,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(
                        show: true,
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff23b6e6).withOpacity(0.3),
                            const Color(0xff02d39a).withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  final HomeController controller = Get.find();
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 8,
  );
  Widget text;
  // Mengecek nilai value dan menentukan text yang akan ditampilkan pada bottom title namun bulannya dinamis menyesuaikan dengan data yang ada
  List bulan = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];

  // mengambil data bulan dari dataDisplay dari controller dan selalu dinamis sesuai dengan data yang ada
  return Obx(() {
    List bulanData =
        controller.dataDisplay.value.map((e) => e['bulan']).toList();

    if (value.toInt() >= 0 && value.toInt() < bulanData.length) {
      // Mengambil indeks bulan dari data yang sesuai dengan data yang ada
      int bulanIndex = bulanData[value.toInt()] - 1;

      // Memastikan bahwa bulanIndex valid (1 - 12)
      if (bulanIndex >= 0 && bulanIndex < bulan.length) {
        text = Text(
          bulan[bulanIndex],
          style: style,
          textAlign: TextAlign.center,
        );
      } else {
        // Fallback jika data tidak valid
        text = const Text(
          'N/A', // atau teks default lainnya
          style: style,
          textAlign: TextAlign.center,
        );
      }
    } else {
      // Fallback jika value tidak dalam range yang valid
      text = const Text(
        'N/A', // atau teks default lainnya
        style: style,
        textAlign: TextAlign.center,
      );
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  });
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  final HomeController controller = Get.find();
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  String text;

  // Mengecek nilai value dan menentukan text yang akan ditampilkan pada left title
  return Obx(() {
    final listValue = controller.dataDisplay.map((e) => e['value']).toList();

    // mengambil berat terbesar dari data berat badan per bulan
    double maxValue =
        listValue.reduce((value, element) => value > element ? value : element);

    // mengambil berat terkecil dari data berat badan per bulan
    double minValue =
        listValue.reduce((value, element) => value < element ? value : element);

    // membuat urutan berat yang akan ditampilkan pada left title sesuai dengan max dan min berat dimana maxY = maxBerat dan minY = minBerat dengan interval 5
    if (value == maxValue) {
      text = maxValue.toStringAsFixed(0);
    } else if (value == minValue) {
      text = minValue.toStringAsFixed(0);
    } else {
      text = '';
    }

    return Text(text, style: style, textAlign: TextAlign.right);
  });
}
