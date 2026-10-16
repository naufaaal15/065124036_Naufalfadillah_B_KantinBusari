import 'package:flutter/material.dart';

// Widget 4: Keranjang Ringkas (Bottom Bar / Floating Cart)
// Menampilkan jumlah item, total harga, dan tombol Pesan Sekarang.
class FloatingCartWidget extends StatelessWidget {
  final int itemCount;
  final int totalHarga;
  final VoidCallback onCheckout;

  const FloatingCartWidget({
    super.key,
    required this.itemCount,
    required this.totalHarga,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$itemCount item', style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('Rp $totalHarga', style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: onCheckout,
            icon: const Icon(Icons.payment, size: 18),
            label: const Text('Pesan Sekarang'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
