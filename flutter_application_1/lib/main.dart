import 'package:flutter/material.dart';
import 'Product_Card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List UI',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const ProductList(),

      routes: {
        '/product-detail': (context) => const ProductDetail(),
      },
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),

        children: const [
          ProductCard(
            name: 'Apple',
            description: 'This is an apple.',
            price: '100',
            image: 'assets/apple.png',
          ),

          ProductCard(
            name: 'Banana',
            description: 'This is a banana.',
            price: '69',
            image: 'assets/banana.png',
          ),

          ProductCard(
            name: 'Cherry',
            description: 'This is a cherry.',
            price: '160',
            image: 'assets/cherry.png',
          ),

          ProductCard(
            name: 'Dragonfruit',
            description: 'This is a dragonfruit.',
            price: '130',
            image: 'assets/dragon_fruit.png',
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),

      body: const Center(
        child: Text(
          'Product Details',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}




