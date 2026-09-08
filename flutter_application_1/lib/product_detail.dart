import 'package:flutter/material.dart';

class Product {
  String name;
  String description;
  String price;
  String image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class ProductDetail extends StatelessWidget {
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail")),
      body: Center(
        child: Column(
          children: [
            Image.asset(product.image,width: 200,height: 100),
            Text(product.name),
            Text(product.description),
            Text(product.price),
          ],
        ),
      ),
    );
  }
}

