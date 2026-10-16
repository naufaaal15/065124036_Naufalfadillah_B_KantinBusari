import 'package:flutter/material.dart';

import '../utils/currency_format.dart';

// Data dummy untuk item dalam keranjang
class CartItem {
  final String nama;
  final int harga;
  final int qty;

  const CartItem({required this.nama, required this.harga, required this.qty});
}

final List<CartItem> dummyCart = const [
  CartItem(nama: 'Nasi Ayam Goreng', harga: 18000, qty: 1),
  CartItem(nama: 'Es Teh Manis', harga: 5000, qty: 1),
];

// Halaman "Pesanan Kamu" dengan daftar item, total, tombol hapus, dan checkout.
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late List<CartItem> _cart;

  @override
  void initState() {
    super.initState();
    _cart = List.from(dummyCart);
  }

  int get _total => _cart.fold(0, (sum, item) => sum + item.harga * item.qty);

  void _hapusItem(int index) {
    setState(() => _cart.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Kamu'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Daftar pesanan
            Expanded(
              child: _cart.isEmpty
                  ? const Center(child: Text('Keranjang kosong'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _cart.length,
                      itemBuilder: (context, index) {
                        final item = _cart[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: const Icon(Icons.fastfood, color: Colors.deepOrange),
                            title: Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('Rp ${formatHarga(item.harga)} x ${item.qty}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _hapusItem(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          // Ringkasan total dan tombol checkout
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Total: Rp ${formatHarga(_total)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _cart.isEmpty ? null : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pesanan berhasil dikirim ke kasir!')),
                    );
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.payment),
                  label: const Text('Checkout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
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
