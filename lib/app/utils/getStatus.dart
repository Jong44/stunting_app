class GetStatus {
  static String getStatusLaki(double tinggiCm, double beratKg) {
    if (beratKg <= 18 && tinggiCm <= 100) {
      return 'Stunting';
    } else if (beratKg <= 20 && tinggiCm < 110) {
      return 'Berisiko Stunting';
    } else {
      return 'Normal';
    }
  }

  static String getStatusPerempuan(double tinggiCm, double beratKg) {
    if (beratKg <= 19 && tinggiCm <= 100) {
      return 'Stunting';
    } else if (beratKg <= 21 && tinggiCm < 110) {
      return 'Berisiko Stunting';
    } else {
      return 'Normal';
    }
  }
}
