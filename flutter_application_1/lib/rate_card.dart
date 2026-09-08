import 'package:flutter/material.dart';

class RatingCard extends StatefulWidget {
  const RatingCard({super.key});

  @override
  State<RatingCard> createState() => RatingCardState();
}

class RatingCardState extends State<RatingCard> {
  int rating = 0;

  void setRating(int value) {
    setState(() {
      rating = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => setRating(1),
          icon: Icon(
            rating >= 1 ? Icons.star : Icons.star_border,
          ),
          color: Colors.amber,
        ),

        IconButton(
          onPressed: () => setRating(2),
          icon: Icon(
            rating >= 2 ? Icons.star : Icons.star_border,
          ),
          color: Colors.amber,
        ),

        IconButton(
          onPressed: () => setRating(3),
          icon: Icon(
            rating >= 3 ? Icons.star : Icons.star_border,
          ),
          color: Colors.amber,
        ),

        IconButton(
          onPressed: () => setRating(4),
          icon: Icon(
            rating >= 4 ? Icons.star : Icons.star_border,
          ),
          color: Colors.amber,
        ),

        IconButton(
          onPressed: () => setRating(5),
          icon: Icon(
            rating >= 5 ? Icons.star : Icons.star_border,
          ),
          color: Colors.amber,
        ),
      ],
    );
  }
}


