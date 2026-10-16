/// Utilitas format harga untuk mata uang Rupiah Indonesia.
/// Contoh: 18000 -> "18.000", 7000 -> "7.000"
String formatHarga(int harga) {
  return harga.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})(?!\d))'),
    (Match m) => '${m[1]}.',
  );
}
