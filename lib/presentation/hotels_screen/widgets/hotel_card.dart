import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostels/presentation/widgets/decorated_container.dart';

import '../../../injection_container.dart';
import '../../../models/hotel/hotel.dart';
import '../../rooms_screen/bloc/rooms_bloc.dart';
import '../../rooms_screen/rooms_screen.dart';
import '../../widgets/custom_button.dart';
import 'hotel_card_description.dart';
import 'hotel_card_title.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;
  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HotelCardTitle(hotel: hotel),
        const SizedBox(
          height: 16,
        ),
        HotelCardDescription(aboutHotel: hotel.aboutHotel),
        const SizedBox(
          height: 16,
        ),
        DecoratedContainer(
          child: CustomButton(
            title: 'К выбору номера',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => getIt<RoomsBloc>()
                              ..add(const RoomsEvent.getRooms()),
                            child: RoomsScreen(
                              hotelName: hotel.name,
                            ),
                          )));
            },
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
