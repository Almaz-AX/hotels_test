import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  final num rating;
  final String ratingName;

  @override
  Widget build(BuildContext context) {
    late final Color? backgroundColor;
    late final Color? foregroundColor;
    if (rating > 4) {
      foregroundColor = Colors.yellow[800];
      backgroundColor = Colors.yellow[300];
    }else if (rating <= 4 && rating > 3){
      foregroundColor = Colors.green[800];
      backgroundColor = Colors.green[300];
    }else {
      foregroundColor = Colors.grey[800];
      backgroundColor = Colors.grey[300];
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: backgroundColor),
      child: Wrap(
        children: [
          Icon(
            Icons.star,
            color: foregroundColor,
            size: 20,
          ),
          Text(
            '$rating $ratingName',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: foregroundColor),
          ),
        ],
      ),
    );
  }
}