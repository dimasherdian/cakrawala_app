import 'package:flutter/material.dart';
import 'product_list_page.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ─── MENERIMA ARGUMEN DARI HALAMAN SEBELUMNYA ─────────────────────
    // ModalRoute.of(context)!.settings.arguments berisi data yang dikirim
    // via Navigator.pushNamed(..., arguments: product)
    // Kita cast ke tipe Product agar bisa digunakan
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    // ──────────────────────────────────────────────────────────────────

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),

            // ─── NAVIGASI DENGAN NAMED ROUTE ─────────────────────────
            // Lanjut ke '/checkout' sambil meneruskan objek Product
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/checkout',
                    arguments: product, // teruskan Product ke halaman checkout
                  );
                },
                child: const Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            // ─────────────────────────────────────────────────────────
          ],
        ),
      ),
    );
  }
}
