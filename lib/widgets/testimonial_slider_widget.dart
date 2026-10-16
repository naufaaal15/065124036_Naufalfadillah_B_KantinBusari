import 'package:flutter/material.dart';

// Data dummy untuk testimoni
class Testimonial {
  final String nama;
  final String komentar;
  final int rating; // 1-5

  const Testimonial({required this.nama, required this.komentar, required this.rating});
}

final List<Testimonial> dummyTestimonials = const [
  Testimonial(nama: 'Siti Aminah', komentar: 'Nasi ayamnya enak banget!', rating: 5),
  Testimonial(nama: 'Budi Santoso', komentar: 'Harga terjangkau, rasanya konsisten.', rating: 4),
  Testimonial(nama: 'Dewi Lestari', komentar: 'Es tehnya segar dan pas.', rating: 5),
  Testimonial(nama: 'Rudi Hartono', komentar: 'Pelayanan ramah, makanannya maknyus.', rating: 5),
];

// Widget 5: Ulasan Pelanggan (Testimonial Slider)
// Slider sederhana dengan rating bintang, nama, dan komentar.
class TestimonialSliderWidget extends StatefulWidget {
  const TestimonialSliderWidget({super.key});

  @override
  State<TestimonialSliderWidget> createState() => _TestimonialSliderWidgetState();
}

class _TestimonialSliderWidgetState extends State<TestimonialSliderWidget> {
  int _index = 0;

  Widget _stars(int rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) => Icon(i < rating ? Icons.star : Icons.star_border, color: Colors.deepOrange, size: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Ulasan Pelanggan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: PageView.builder(
            itemCount: dummyTestimonials.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (context, i) {
              final t = dummyTestimonials[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
                          const SizedBox(width: 10),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(t.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 2),
                              _stars(t.rating),
                            ],
                          )),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('"${t.komentar}"', style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(dummyTestimonials.length, (i) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: _index == i ? 10 : 6,
            height: 6,
            decoration: BoxDecoration(color: _index == i ? Colors.deepOrange : Colors.grey.shade300, borderRadius: BorderRadius.circular(3)),
          )),
        ),
      ],
    );
  }
}
