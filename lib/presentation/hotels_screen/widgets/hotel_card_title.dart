// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hostels/presentation/widgets/image_carusel.dart';
import 'package:hostels/presentation/widgets/rating.dart';

import '../../../models/hotel/hotel.dart';
import '../../widgets/decorated_container.dart';

class HotelCardTitle extends StatelessWidget {
  const HotelCardTitle({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCarusel(imageUrls: hotel.imageUrls),
          const SizedBox(
            height: 25,
          ),
          RatingWidget(
            rating: hotel.rating,
            ratingName: hotel.ratingName,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${hotel.name}, ${hotel.address.split(',').first}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            hotel.address,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
          RichText(
              text: TextSpan(
                  text: 'от ${hotel.minimalPrice}  ₽',
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                  children: const [
                TextSpan(
                    text: '  за тур с перелетом',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black26))
              ])),
        ],
      ),
    );
  }
}
