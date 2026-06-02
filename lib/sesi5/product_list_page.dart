import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String? badge; // null = tidak ada badge, isi string = tampilkan badge

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.badge,
  });
}

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final List<Product> products = [
    Product(
      name: 'Wireless Headphones',
      description: 'High-quality noise-canceling headphones with up to 30 hours battery life.',
      price: 199.99,
      imageUrl: 'https://picsum.photos/200/300?random=1',
      badge: 'Best Seller',
    ),
    Product(
      name: 'Smartphone',
      description: 'Latest model.',
      price: 799.00,
      imageUrl: 'https://picsum.photos/200/220?random=2',
    ),
    Product(
      name: 'Laptop Pro',
      description: 'Powerful laptop for professionals. Equipped with the latest processor and long-lasting battery.',
      price: 1299.50,
      imageUrl: 'https://picsum.photos/200/260?random=3',
      badge: 'New',
    ),
    Product(
      name: 'Smart Watch',
      description: 'Track your fitness.',
      price: 149.99,
      imageUrl: 'https://picsum.photos/200/240?random=4',
    ),
    Product(
      name: 'Gaming Mouse',
      description: 'Ergonomic mouse with RGB lighting and adjustable DPI for precision gaming.',
      price: 59.90,
      imageUrl: 'https://picsum.photos/200/280?random=5',
      badge: 'Sale',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.blueAccent,
      ),

      // ─── MASONRY STAGGERED GRID ────────────────────────────────────────
      // MasonryGridView.count → grid 2 kolom dengan tinggi kartu yang bervariasi
      // (berbeda dari GridView biasa yang tiap sel punya tinggi sama)
      // Tinggi kartu mengikuti konten di dalamnya secara otomatis
      body: MasonryGridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,       // jumlah kolom
        mainAxisSpacing: 10,     // jarak vertikal antar kartu
        crossAxisSpacing: 10,    // jarak horizontal antar kartu
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-detail',
                arguments: product,
              );
            },
            child: Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Gambar produk ──────────────────────────────────
                  Stack(
                    children: [
                      Image.network(
                        product.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      // ── BADGE ──────────────────────────────────────
                      // Tampilkan badge hanya jika product.badge tidak null
                      // Jika null, gunakan SizedBox.shrink() → widget kosong
                      if (product.badge != null)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              product.badge!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      // ───────────────────────────────────────────────
                    ],
                  ),

                  // ── Info produk ────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.description,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // ──────────────────────────────────────────────────────────────────
    );
  }
}
