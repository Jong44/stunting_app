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
