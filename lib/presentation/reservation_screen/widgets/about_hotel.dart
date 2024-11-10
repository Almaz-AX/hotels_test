import 'package:flutter/material.dart';

import '../../widgets/decorated_container.dart';
import '../../widgets/rating.dart';

class AboutHotel extends StatelessWidget {
  const AboutHotel({
    super.key,
    required this.rating,
    required this.ratngName,
    required this.hotelName,
    required this.hotelAddress,
  });

  final num rating;
  final String ratngName;
  final String hotelName;
  final String hotelAddress;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingWidget(rating: rating, ratingName: ratngName),
          const SizedBox(
            height: 8,
          ),
          Text(
            hotelName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            hotelAddress,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
