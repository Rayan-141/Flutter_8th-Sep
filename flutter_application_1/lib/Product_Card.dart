import 'package:flutter/material.dart';
import 'package:flutter_application_1/rate_card.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String image;

  const ProductCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(description),

                  const SizedBox(height: 5),

                  Text(
                    '₹$price',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const RatingCard(),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/product-detail',
                      );
                    },
                    child: const Text(
                      'Read More ...',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



