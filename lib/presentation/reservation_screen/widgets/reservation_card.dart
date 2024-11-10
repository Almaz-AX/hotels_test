// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hostels/models/reservation/reservation.dart';
import 'package:hostels/presentation/reservation_screen/widgets/about_client.dart';
import 'package:hostels/presentation/success_screen/success_screen.dart';
import 'package:hostels/presentation/widgets/decorated_container.dart';
import 'about_hotel.dart';
import 'about_reservation.dart';
import 'for_payment.dart';
import 'tourist_form.dart';

class ReservationCard extends StatefulWidget {
  final Reservation reservation;
  const ReservationCard({
    super.key,
    required this.reservation,
  });

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  final List<Widget> tourists = [
    const TouristForm(
      key: ValueKey('0'),
      title: 'Первый турист',
    )
  ];
  @override
  void didChangeDependencies() {
    tourSumPrice();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8,
          ),
          AboutHotel(
            hotelName: widget.reservation.hotelName,
            hotelAddress: widget.reservation.hotelAddress,
            rating: widget.reservation.horating,
            ratngName: widget.reservation.ratingName,
          ),
          const SizedBox(
            height: 8,
          ),
          AboutReservation(reservation: widget.reservation),
          const SizedBox(
            height: 8,
          ),
          const AboutClient(),
          const SizedBox(
            height: 8,
          ),
          ...tourists,
          DecoratedContainer(
              child: Row(
            children: [
              const Text(
                'Добавить туриста',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const Expanded(
                child: SizedBox(
                  height: 8,
                ),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0)),
                    onPressed: tourists.length < 3
                        ? () {
                            addTourist(tourists.length);
                          }
                        : null,
                    child: const Center(child: Icon(Icons.add))),
              )
            ],
          )),
          ForPayment(
            touristCount: tourists.length,
            tourPrice: widget.reservation.tourPrice,
            serviceCharge: widget.reservation.serviceCharge,
            fuelCharge: widget.reservation.fuelCharge,
          ),
          const SizedBox(
            height: 8,
          ),
          DecoratedContainer(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SuccessScreen()));
                  },
                  child: Text('Оплатить ${tourSumPrice()} ₽')))
        ],
      ),
    );
  }

  int tourSumPrice() {
    return widget.reservation.tourPrice * tourists.length +
        widget.reservation.serviceCharge * tourists.length +
        widget.reservation.fuelCharge * tourists.length;
  }

  void addTourist(int touristNumber) {
    String title = '';
    if (touristNumber == 1) {
      title = 'Второй турист';
    } else {
      title = 'Третий туриcт';
    }
    setState(() {
      tourists.add(
          TouristForm(key: ValueKey(touristNumber.toString), title: title));
    });
  }
}
