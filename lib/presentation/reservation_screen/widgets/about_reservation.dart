// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../models/reservation/reservation.dart';
import '../../widgets/decorated_container.dart';

class AboutReservation extends StatelessWidget {
  final Reservation reservation;

  const AboutReservation({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Table(
        children: [
          _buildRow(rowName: 'Вылет из', rowDescription: 'Минск'),
          _buildRow(
              rowName: 'Страна, город',
              rowDescription:
                  '${reservation.arrivalCountry}, ${reservation.hotelAddress.split(',').first}'),
          _buildRow(
              rowName: 'Даты',
              rowDescription:
                  '${_convertDate(reservation.tourDateStart)} - ${_convertDate(reservation.tourDateStop)}'),
          _buildRow(
              rowName: 'Кол-во ночей',
              rowDescription: '${reservation.numberOfNights} ночей'),
          _buildRow(rowName: 'Отель', rowDescription: reservation.hotelName),
          _buildRow(rowName: 'Номер', rowDescription: reservation.room),
          _buildRow(rowName: 'Питание', rowDescription: reservation.nutrition)
        ],
      ),
    );
  }

  String _convertDate(DateTime time) {
    return '${time.day.toString().padLeft(2, '0')}.${time.month.toString().padLeft(2, '0')}. ${time.year}';
  }

  TableRow _buildRow(
      {required String rowName, required String rowDescription}) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          rowName,
          style: const TextStyle(color: Colors.black38),
        ),
      ),
      Text(rowDescription)
    ]);
  }
}
