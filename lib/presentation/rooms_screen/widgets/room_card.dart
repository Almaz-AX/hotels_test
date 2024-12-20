// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostels/injection_container.dart';
import 'package:hostels/presentation/widgets/image_carusel.dart';
import 'package:hostels/presentation/widgets/pecularities.dart';

import '../../../models/room/room.dart';
import '../../reservation_screen/bloc/reservation_bloc.dart';
import '../../reservation_screen/reservation_screen.dart';
import '../../widgets/decorated_container.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 8,
      ),
      DecoratedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            ImageCarusel(imageUrls: room.imageUrls),
            const SizedBox(
              height: 8,
            ),
            Text(
              room.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Pecularities(pecularities: room.pecularities),
            const SizedBox(
              height: 8,
            ),
            RichText(
                text: TextSpan(
                    text: '${room.price}  ₽',
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
                    children: [
                  TextSpan(
                      text: '  за ${room.pricePer}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black26))
                ])),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) =>
                        BlocProvider(
                          create: (context) => getIt<ReservationBloc>()..add(ReservationEvent.getReservation(room.id)),
                          child: const ReservatonScreen(),
                        )
                      ));
                    },
                    child: const Text('Выбрать номер')))
          ],
        ),
      ),
    ]);
  }
}
