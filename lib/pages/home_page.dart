import 'package:flutter/material.dart';

import '../widgets/header_status_widget.dart';
import '../widgets/promo_banner_widget.dart';
import '../widgets/menu_category_grid_widget.dart';
import '../widgets/floating_cart_widget.dart';
import '../widgets/testimonial_slider_widget.dart';

// Halaman beranda yang menggabungkan semua 5 widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data keranjang
    const int itemCount = 2;
    const int totalHarga = 23000;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // Widget 1
            const HeaderStatusWidget(),
            // Konten scroll
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Widget 2
                    const PromoBannerWidget(),
                    // Widget 3
                    const MenuCategoryGridWidget(),
                    const SizedBox(height: 20),
                    // Widget 5
                    const TestimonialSliderWidget(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            // Widget 4 (floating cart di bawah)
            FloatingCartWidget(
              itemCount: itemCount,
              totalHarga: totalHarga,
              onCheckout: () => Navigator.pushNamed(context, '/pesan'),
            ),
          ],
        ),
      ),
    );
  }
}
