import 'package:flutter/material.dart';

import '../../widgets/decorated_container.dart';

class ForPayment extends StatelessWidget {
  final int touristCount;
  final int tourPrice;
  final int serviceCharge;
  final int fuelCharge;
  const ForPayment({
    super.key,
    required this.touristCount,
    required this.tourPrice,
    required this.serviceCharge,
    required this.fuelCharge,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
        child: Table(
          defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width/2),
      children: [
        _buildRow(rowName: 'Тур', rowDescription: '${tourPrice*touristCount} ₽'),
        _buildRow(rowName: 'Топливный сбор', rowDescription: '${fuelCharge*touristCount} ₽'),
        _buildRow(rowName: 'Сервисный сбор', rowDescription: '${serviceCharge*touristCount} ₽'),
        _buildRow(rowName: 'К оплате', rowDescription: '${(tourPrice+serviceCharge+fuelCharge)*touristCount} ₽'),

      ],
    ));
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
      
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Text(rowDescription, textAlign: TextAlign.end,),
      )
    ]);
  }
}
