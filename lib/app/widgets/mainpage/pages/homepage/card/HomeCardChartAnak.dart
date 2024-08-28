import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stunting_app/app/widgets/PrimaryButton.dart';

class HomeCardChartAnak extends StatelessWidget {
  const HomeCardChartAnak({super.key});

  @override
  Widget build(BuildContext context) {
    List dataBeratBadanPerBulan = [
      {
        "bulan": "Jan",
        "berat": 3,
      },
      {
        "bulan": "Feb",
        "berat": 1,
      },
      {
        "bulan": "Mar",
        "berat": 4,
      },
      {
        "bulan": "Apr",
        "berat": 2,
      },
      {
        "bulan": "Mei",
        "berat": 5,
      },
      {
        "bulan": "Jun",
        "berat": 3,
      },
      {
        "bulan": "Jul",
        "berat": 4,
      },
      {
        "bulan": "Agu",
        "berat": 2,
      },
      {
        "bulan": "Sep",
        "berat": 3,
      },
      {
        "bulan": "Okt",
        "berat": 1,
      },
      {
        "bulan": "Nov",
        "berat": 5,
      },
      {
        "bulan": "Des",
        "berat": 4,
      },
    ];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: 195,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Grafik Berat Badan Anak",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Icon(
                  CupertinoIcons.pencil,
                  size: 15.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color.fromARGB(255, 206, 206, 206),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return const FlLine(
                      color: Color.fromARGB(255, 206, 206, 206),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
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
                      interval: 1,
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 20,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                      color: const Color(0xff37434d).withOpacity(0.5)),
                ),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    // Data berat badan
                    spots:
                        List.generate(dataBeratBadanPerBulan.length, (index) {
                      return FlSpot(index.toDouble(),
                          dataBeratBadanPerBulan[index]['berat'].toDouble());
                    }),
                    isCurved: true,
                    gradient: LinearGradient(colors: [
                      const Color(0xff23b6e6),
                      const Color(0xff02d39a),
                    ]),
                    barWidth: 1,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(
                      show: true,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(colors: [
                        const Color(0xff23b6e6).withOpacity(0.3),
                        const Color(0xff02d39a).withOpacity(0.3),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 8,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('JAN', style: style);
      break;
    case 1:
      text = const Text('FEB', style: style);
      break;
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 3:
      text = const Text('APR', style: style);
      break;
    case 4:
      text = const Text('MAY', style: style);
      break;
    case 5:
      text = const Text('JUN', style: style);
      break;
    case 6:
      text = const Text('JUL', style: style);
      break;
    case 7:
      text = const Text('AUG', style: style);
      break;
    case 8:
      text = const Text('SEP', style: style);
      break;
    case 9:
      text = const Text('OCT', style: style);
      break;
    case 10:
      text = const Text('NOV', style: style);
      break;
    case 11:
      text = const Text('DEC', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0';
      break;
    case 1:
      text = '1';
      break;
    case 2:
      text = '2';
      break;
    case 3:
      text = '3';
      break;
    case 4:
      text = '4';
      break;
    case 5:
      text = '5';
      break;
    case 6:
      text = '6';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
