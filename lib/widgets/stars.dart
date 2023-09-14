import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../helpers/colors.dart';

class Stars extends StatelessWidget {
  const Stars({
    Key? key,
    required this.count,
    this.size = 20,
  }) : super(key: key);
  final double count;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: count,
      minRating: 0,
      ignoreGestures: true,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: starColor,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
