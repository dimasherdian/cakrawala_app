import 'package:flutter/material.dart';

// Model Product didefinisikan di sini agar bisa diimport oleh halaman lain
class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final List<Product> products = [
    Product(
      name: 'Wireless Headphones',
      description: 'High-quality noise-canceling headphones.',
      price: 199.99,
      imageUrl: 'https://picsum.photos/200/300?random=1',
    ),
    Product(
      name: 'Smartphone',
      description: 'Latest model with a stunning display.',
      price: 799.00,
      imageUrl: 'https://picsum.photos/200/300?random=2',
    ),
    Product(
      name: 'Laptop Pro',
      description: 'Powerful laptop for professionals.',
      price: 1299.50,
      imageUrl: 'https://picsum.photos/200/300?random=3',
    ),
    Product(
      name: 'Smart Watch',
      description: 'Track your fitness and notifications.',
      price: 149.99,
      imageUrl: 'https://picsum.photos/200/300?random=4',
    ),
    Product(
      name: 'Gaming Mouse',
      description: 'Ergonomic mouse with RGB lighting.',
      price: 59.90,
      imageUrl: 'https://picsum.photos/200/300?random=5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.blueAccent,
      ),
      // ─── GRIDVIEW: menampilkan item dalam 2 kolom ─────────────────────
      // crossAxisCount: 2  → jumlah kolom
      // crossAxisSpacing  → jarak horizontal antar kartu
      // mainAxisSpacing   → jarak vertikal antar kartu
      // childAspectRatio  → rasio lebar:tinggi tiap sel (lebih kecil = lebih tinggi)
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.72,
        ),
        // ──────────────────────────────────────────────────────────────
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            // ─── NAVIGASI DENGAN NAMED ROUTE ────────────────────────
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-detail',
                arguments: product,
              );
            },
            // ────────────────────────────────────────────────────────
            child: Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.description,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
    );
  }
}
