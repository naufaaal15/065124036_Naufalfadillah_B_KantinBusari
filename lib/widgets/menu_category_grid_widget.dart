import 'package:flutter/material.dart';

// Data dummy untuk menu (tanpa gambar)
class MenuItem {
  final String nama;
  final int harga;
  final String kategori;

  const MenuItem({
    required this.nama,
    required this.harga,
    required this.kategori,
  });
}

final List<MenuItem> dummyMenu = const [
  MenuItem(nama: 'Nasi Ayam Goreng', harga: 18000, kategori: 'Makanan'),
  MenuItem(nama: 'Mie Goreng Spesial', harga: 15000, kategori: 'Makanan'),
  MenuItem(nama: 'Es Teh Manis', harga: 5000, kategori: 'Minuman'),
  MenuItem(nama: 'Es Jeruk Segar', harga: 6000, kategori: 'Minuman'),
  MenuItem(nama: 'Gorengan Campur', harga: 4000, kategori: 'Cemilan'),
  MenuItem(nama: 'Pisang Goreng Keju', harga: 7000, kategori: 'Cemilan'),
];

// Widget 3: Kategori & Daftar Menu (Grid)
// Chip kategori berfungsi sebagai filter. Pilih salah satu untuk menyaring menu.
class MenuCategoryGridWidget extends StatefulWidget {
  const MenuCategoryGridWidget({super.key});

  @override
  State<MenuCategoryGridWidget> createState() => _MenuCategoryGridWidgetState();
}

class _MenuCategoryGridWidgetState extends State<MenuCategoryGridWidget> {
  String? _selectedKategori; // null = tampilkan semua

  final List<String> kategori = const ['Makanan', 'Minuman', 'Cemilan'];

  // Filter menu berdasarkan kategori yang dipilih
  List<MenuItem> get _filteredMenu {
    if (_selectedKategori == null) return dummyMenu;
    return dummyMenu.where((m) => m.kategori == _selectedKategori).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Menu Favorit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        // Chip kategori sebagai filter
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: kategori.length + 1,
            itemBuilder: (context, index) {
              // Index 0 = "Semua"
              final label = index == 0 ? 'Semua' : kategori[index - 1];
              final isSelected = _selectedKategori == label ||
                  (index == 0 && _selectedKategori == null);
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(label),
                  selected: isSelected,
                  selectedColor: Colors.deepOrange.shade100,
                  onSelected: (pilih) {
                    setState(() {
                      _selectedKategori = index == 0 ? null : label;
                    });
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Grid menu yang sudah difilter
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: _filteredMenu.length,
          itemBuilder: (context, index) {
            final item = _filteredMenu[index];
            return _MenuCard(item: item);
          },
        ),
      ],
    );
  }
}

// Kartu satu item menu (tanpa gambar, hanya ikon makanan)
class _MenuCard extends StatelessWidget {
  final MenuItem item;
  const _MenuCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          // Area ikon menggantikan gambar (kosongkan gambar asli)
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.deepOrange.shade50,
              child: const Icon(Icons.fastfood, color: Colors.deepOrange, size: 40),
            ),
          ),
          // Info & tombol
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('Rp ${item.harga}', style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item.nama} ditambahkan ke keranjang')));
                    },
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Tambah', style: TextStyle(fontSize: 12)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.deepOrange,
                      side: const BorderSide(color: Colors.deepOrange),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
