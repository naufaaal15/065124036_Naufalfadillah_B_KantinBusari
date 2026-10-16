import 'package:flutter/material.dart';

// Widget 1: Header & Status
// Menampilkan logo, nama "Kantin Busari", jam operasional, dan indikator
// buka/tutup (hijau = buka, merah = tutup).
class HeaderStatusWidget extends StatelessWidget {
  const HeaderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data: status buka dan jam operasional
    final bool isOpen = true;
    final String jam = '07:00 - 15:00 WIB';

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      color: Colors.white,
      child: Row(
        children: [
          // Ikon/logo kantin (kotak oranye dengan ikon restoran)
          Container(
            width: 50,
            height: 50,
            color: Colors.deepOrange.shade100,
            child: const Icon(
              Icons.restaurant,
              color: Colors.deepOrange,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kantin Busari',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // Lingkaran status: hijau jika buka, merah jika tutup
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: isOpen ? Colors.green : Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isOpen ? 'Buka' : 'Tutup',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isOpen ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.access_time, size: 13, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(jam, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
