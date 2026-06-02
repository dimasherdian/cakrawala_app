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
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.network(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(product.description),
              trailing: Text(
                '\$${product.price}',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // ─── NAVIGASI DENGAN NAMED ROUTE ───────────────────────────
              // Navigator.pushNamed → berpindah ke route bernama '/product-detail'
              // arguments: product → data Product dikirim ke halaman berikutnya
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/product-detail',
                  arguments: product, // kirim objek Product sebagai argumen
                );
              },
              // ───────────────────────────────────────────────────────────
            ),
          );
        },
      ),
    );
  }
}
