class GetStatus {
  static String getStatus(int zScore) {
    if (zScore == -3) {
      return "Stunting";
    } else if (zScore == -2) {
      return "Stunting";
    } else if (zScore == -1) {
      return "Beresiko Stunting";
    } else if (zScore == 0) {
      return "Normal";
    } else if (zScore == 1) {
      return "Normal";
    } else if (zScore == 2) {
      return "Berisiko Obesitas";
    } else if (zScore == 3) {
      return "Berisiko Obesitas";
    } else {
      return "Normal";
    }
  }

  static List<Map<String, dynamic>> zScoreTable = [
    {
      "tinggi_badan": 45,
      "z_scores": [
        {"z": -3, "min": 2.0, "max": 2.4},
        {"z": -2, "min": 2.4, "max": 2.8},
        {"z": -1, "min": 2.8, "max": 3.2},
        {"z": 0, "min": 3.2, "max": 4.0},
        {"z": 1, "min": 4.0, "max": 4.8},
        {"z": 2, "min": 4.8, "max": 5.6},
        {"z": 3, "min": 5.6, "max": 6.4},
      ],
    },
    {
      "tinggi_badan": 50,
      "z_scores": [
        {"z": -3, "min": 2.5, "max": 3.0},
        {"z": -2, "min": 3.0, "max": 3.5},
        {"z": -1, "min": 3.5, "max": 4.0},
        {"z": 0, "min": 4.0, "max": 5.0},
        {"z": 1, "min": 5.0, "max": 6.0},
        {"z": 2, "min": 6.0, "max": 7.0},
        {"z": 3, "min": 7.0, "max": 8.0},
      ],
    },
    {
      "tinggi_badan": 55,
      "z_scores": [
        {"z": -3, "min": 3.0, "max": 3.6},
        {"z": -2, "min": 3.6, "max": 4.2},
        {"z": -1, "min": 4.2, "max": 4.8},
        {"z": 0, "min": 4.8, "max": 6.0},
        {"z": 1, "min": 6.0, "max": 7.2},
        {"z": 2, "min": 7.2, "max": 8.4},
        {"z": 3, "min": 8.4, "max": 9.6},
      ],
    },
    {
      "tinggi_badan": 60,
      "z_scores": [
        {"z": -3, "min": 3.5, "max": 4.2},
        {"z": -2, "min": 4.2, "max": 4.9},
        {"z": -1, "min": 4.9, "max": 5.6},
        {"z": 0, "min": 5.6, "max": 7.0},
        {"z": 1, "min": 7.0, "max": 8.4},
        {"z": 2, "min": 8.4, "max": 9.8},
        {"z": 3, "min": 9.8, "max": 11.2},
      ],
    },
    {
      "tinggi_badan": 65,
      "z_scores": [
        {"z": -3, "min": 4.0, "max": 4.8},
        {"z": -2, "min": 4.8, "max": 5.6},
        {"z": -1, "min": 5.6, "max": 6.4},
        {"z": 0, "min": 6.4, "max": 8.0},
        {"z": 1, "min": 8.0, "max": 9.6},
        {"z": 2, "min": 9.6, "max": 11.2},
        {"z": 3, "min": 11.2, "max": 12.8},
      ],
    },
    {
      "tinggi_badan": 70,
      "z_scores": [
        {"z": -3, "min": 5.0, "max": 5.8},
        {"z": -2, "min": 5.8, "max": 6.6},
        {"z": -1, "min": 6.6, "max": 7.4},
        {"z": 0, "min": 7.4, "max": 9.0},
        {"z": 1, "min": 9.0, "max": 10.6},
        {"z": 2, "min": 10.6, "max": 12.2},
        {"z": 3, "min": 12.2, "max": 13.8},
      ],
    },
    {
      "tinggi_badan": 75,
      "z_scores": [
        {"z": -3, "min": 5.5, "max": 6.4},
        {"z": -2, "min": 6.4, "max": 7.3},
        {"z": -1, "min": 7.3, "max": 8.2},
        {"z": 0, "min": 8.2, "max": 10.0},
        {"z": 1, "min": 10.0, "max": 11.8},
        {"z": 2, "min": 11.8, "max": 13.6},
        {"z": 3, "min": 13.6, "max": 15.4},
      ],
    },
    {
      "tinggi_badan": 80,
      "z_scores": [
        {"z": -3, "min": 6.0, "max": 6.9},
        {"z": -2, "min": 6.9, "max": 7.8},
        {"z": -1, "min": 7.8, "max": 8.7},
        {"z": 0, "min": 8.7, "max": 10.5},
        {"z": 1, "min": 10.5, "max": 12.3},
        {"z": 2, "min": 12.3, "max": 14.1},
        {"z": 3, "min": 14.1, "max": 15.9},
      ],
    },
    {
      "tinggi_badan": 85,
      "z_scores": [
        {"z": -3, "min": 6.5, "max": 7.4},
        {"z": -2, "min": 7.4, "max": 8.3},
        {"z": -1, "min": 8.3, "max": 9.2},
        {"z": 0, "min": 9.2, "max": 11.0},
        {"z": 1, "min": 11.0, "max": 12.8},
        {"z": 2, "min": 12.8, "max": 14.6},
        {"z": 3, "min": 14.6, "max": 16.4},
      ],
    },
    {
      "tinggi_badan": 90,
      "z_scores": [
        {"z": -3, "min": 7.0, "max": 7.9},
        {"z": -2, "min": 7.9, "max": 8.8},
        {"z": -1, "min": 8.8, "max": 9.7},
        {"z": 0, "min": 9.7, "max": 11.5},
        {"z": 1, "min": 11.5, "max": 13.3},
        {"z": 2, "min": 13.3, "max": 15.1},
        {"z": 3, "min": 15.1, "max": 16.9},
      ],
    },
    {
      "tinggi_badan": 95,
      "z_scores": [
        {"z": -3, "min": 7.5, "max": 8.4},
        {"z": -2, "min": 8.4, "max": 9.3},
        {"z": -1, "min": 9.3, "max": 10.2},
        {"z": 0, "min": 10.2, "max": 12.0},
        {"z": 1, "min": 12.0, "max": 13.8},
        {"z": 2, "min": 13.8, "max": 15.6},
        {"z": 3, "min": 15.6, "max": 17.4},
      ],
    },
    {
      "tinggi_badan": 100,
      "z_scores": [
        {"z": -3, "min": 8.0, "max": 8.9},
        {"z": -2, "min": 8.9, "max": 9.8},
        {"z": -1, "min": 9.8, "max": 10.7},
        {"z": 0, "min": 10.7, "max": 12.5},
        {"z": 1, "min": 12.5, "max": 14.3},
        {"z": 2, "min": 14.3, "max": 16.1},
        {"z": 3, "min": 16.1, "max": 17.9},
      ],
    },
    {
      "tinggi_badan": 105,
      "z_scores": [
        {"z": -3, "min": 8.5, "max": 9.4},
        {"z": -2, "min": 9.4, "max": 10.3},
        {"z": -1, "min": 10.3, "max": 11.2},
        {"z": 0, "min": 11.2, "max": 13.0},
        {"z": 1, "min": 13.0, "max": 14.8},
        {"z": 2, "min": 14.8, "max": 16.6},
        {"z": 3, "min": 16.6, "max": 18.4},
      ],
    },
    {
      "tinggi_badan": 110,
      "z_scores": [
        {"z": -3, "min": 9.0, "max": 9.9},
        {"z": -2, "min": 9.9, "max": 10.8},
        {"z": -1, "min": 10.8, "max": 11.7},
        {"z": 0, "min": 11.7, "max": 13.5},
        {"z": 1, "min": 13.5, "max": 15.3},
        {"z": 2, "min": 15.3, "max": 17.1},
        {"z": 3, "min": 17.1, "max": 18.9},
      ],
    },
    {
      "tinggi_badan": 115,
      "z_scores": [
        {"z": -3, "min": 9.5, "max": 10.4},
        {"z": -2, "min": 10.4, "max": 11.3},
        {"z": -1, "min": 11.3, "max": 12.2},
        {"z": 0, "min": 12.2, "max": 14.0},
        {"z": 1, "min": 14.0, "max": 15.8},
        {"z": 2, "min": 15.8, "max": 17.6},
        {"z": 3, "min": 17.6, "max": 19.4},
      ],
    },
    {
      "tinggi_badan": 120,
      "z_scores": [
        {"z": -3, "min": 10.0, "max": 10.9},
        {"z": -2, "min": 10.9, "max": 11.8},
        {"z": -1, "min": 11.8, "max": 12.7},
        {"z": 0, "min": 12.7, "max": 14.5},
        {"z": 1, "min": 14.5, "max": 16.3},
        {"z": 2, "min": 16.3, "max": 18.1},
        {"z": 3, "min": 18.1, "max": 19.9},
      ],
    },
  ];

  static int calculateZScore(double tinggiBadan, double beratBadan) {
    Map<String, dynamic>? nearestData = _findNearestHeight(tinggiBadan);

    if (nearestData == null) return 0;

    for (var zData in nearestData["z_scores"]) {
      double min = zData["min"];
      double max = zData["max"];

      if (beratBadan >= min && beratBadan <= max) {
        return zData["z"]; // Z-score ditemukan
      }
    }

    return 0;
  }

  static Map<String, dynamic>? _findNearestHeight(double tinggiBadan) {
    // Cari data tinggi badan terdekat
    Map<String, dynamic>? nearest = null;
    double minDifference = double.infinity;

    for (var data in zScoreTable) {
      double difference = (data["tinggi_badan"] - tinggiBadan).abs();
      if (difference < minDifference) {
        nearest = data;
        minDifference = difference;
      }
    }

    return nearest;
  }

  static int getZscoreLakiLaki(double tinggiCm, double beratKg) {
    print(tinggiCm);
    // Dataset Z-score
    List<List<double>> zScores = [
      [45, 4, 4.5, 5, 5.5, 6, 6.5], // Tinggi 45 cm
      [50, 5, 5.5, 6, 6.5, 7, 7.5], // Tinggi 50 cm
      [55, 6, 6.5, 7, 7.5, 8, 8.5], // Tinggi 55 cm
      [60, 7, 7.5, 8, 8.5, 9, 9.5], // Tinggi 60 cm
      [65, 8, 8.5, 9, 9.5, 10, 10.5], // Tinggi 65 cm
      [70, 9, 9.5, 10, 10.5, 11, 11.5], // Tinggi 70 cm
      [75, 10, 10.5, 11, 11.5, 12, 12.5], // Tinggi 75 cm
      [80, 11, 11.5, 12, 12.5, 13, 13.5], // Tinggi 80 cm
      [85, 12, 12.5, 13, 13.5, 14, 14.5], // Tinggi 85 cm
      [90, 13, 13.5, 14, 14.5, 15, 15.5], // Tinggi 90 cm
      [95, 14, 14.5, 15, 15.5, 16, 16.5], // Tinggi 95 cm
      [100, 15, 15.5, 16, 16.5, 17, 17.5], // Tinggi 100 cm
    ];

    // Pastikan tinggi badan valid
    if (tinggiCm < zScores.first[0] || tinggiCm > zScores.last[0]) {
      return 0; // Di luar rentang tinggi
    }

    // Temukan rentang tinggi badan
    for (int i = 0; i < zScores.length - 1; i++) {
      if (tinggiCm >= zScores[i][0] && tinggiCm <= zScores[i + 1][0]) {
        List<double> lower = zScores[i];
        List<double> upper = zScores[i + 1];

        // Periksa setiap z-score
        for (int j = 1; j < lower.length - 1; j++) {
          double beratMin =
              interpolate(lower[0], upper[0], lower[j], upper[j], tinggiCm);
          double beratMax = interpolate(
              lower[0], upper[0], lower[j + 1], upper[j + 1], tinggiCm);

          // Periksa toleransi berat badan
          if (beratKg >= beratMin && beratKg <= beratMax) {
            return j - 4; // Z-score (-3 to +3)
          }
        }

        // Jika berat mendekati batas, berikan toleransi
        double toleransi = 0.5; // Atur sesuai kebutuhan
        if (beratKg >= lower[1] - toleransi &&
            beratKg <= upper.last + toleransi) {
          return 0; // Berat badan mendekati rentang
        }
      }
    }

    // Jika tidak cocok, return 0
    return 0;
  }

  // Fungsi interpolasi linear
  static double interpolate(
      double x1, double x2, double y1, double y2, double x) {
    return y1 + (y2 - y1) * (x - x1) / (x2 - x1);
  }

  static int getZscorePerempuan(double tinggiCm, double beratKg) {
    // Data Z-score (sesuaikan dengan chart)
    List<List<double>> zScores = [
      [45, 4, 4.5, 5, 5.5, 6, 6.5], // Tinggi 45 cm
      [50, 5, 5.5, 6, 6.5, 7, 7.5], // Tinggi 50 cm
      [55, 6, 6.5, 7, 7.5, 8, 8.5], // Tinggi 55 cm
      [60, 7, 7.5, 8, 8.5, 9, 9.5], // Tinggi 60 cm
      [65, 8, 8.5, 9, 9.5, 10, 10.5], // Tinggi 65 cm
      [70, 9, 9.5, 10, 10.5, 11, 11.5], // Tinggi 70 cm
      [75, 10, 10.5, 11, 11.5, 12, 12.5], // Tinggi 75 cm
      [80, 11, 11.5, 12, 12.5, 13, 13.5], // Tinggi 80 cm
      [85, 12, 12.5, 13, 13.5, 14, 14.5], // Tinggi 85 cm
      [90, 13, 13.5, 14, 14.5, 15, 15.5], // Tinggi 90 cm
      [95, 14, 14.5, 15, 15.5, 16, 16.5], // Tinggi 95 cm
      [100, 15, 15.5, 16, 16.5, 17, 17.5], // Tinggi 100 cm
    ];

    if (tinggiCm < 45 || tinggiCm > 100) {
      throw Exception("Tinggi di luar rentang 45-100 cm.");
    }

    // Cari z-score berdasarkan tinggi
    for (int i = 0; i < zScores.length - 1; i++) {
      if (tinggiCm >= zScores[i][0] && tinggiCm <= zScores[i + 1][0]) {
        List<double> lower = zScores[i];
        List<double> upper = zScores[i + 1];

        // Interpolasi berat berdasarkan tinggi
        for (int j = 1; j < lower.length - 1; j++) {
          double beratMin =
              interpolate(lower[0], upper[0], lower[j], upper[j], tinggiCm);
          double beratMax = interpolate(
              lower[0], upper[0], lower[j + 1], upper[j + 1], tinggiCm);

          if (beratKg >= beratMin && beratKg < beratMax) {
            return j - 4; // Z-score range dari -3 ke 3
          }
        }
      }
    }

    return 0;
  }
}
