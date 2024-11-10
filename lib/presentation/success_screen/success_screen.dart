import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostels/asset.dart';
import 'package:hostels/presentation/widgets/decorated_container.dart';

import '../../injection_container.dart';
import '../hotels_screen/bloc/hotels_bloc.dart';
import '../hotels_screen/hotels_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Заказ оплачен',
          style: TextStyle(fontWeight: FontWeight.w700),
        )),
      ),
      body: Stack(
        children: [
          DecoratedContainer(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(MyAssetImage.partyImage),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Ваш заказ принят в работу',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Подтверждение заказа № ${Random().nextInt(1000)} может занять некоторе время (от 1 часа до суток).\n Как только мы поучим ответ от туроператора, вам на почту придет уведомление',
                      style: const TextStyle(color: Colors.black26),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: DecoratedContainer(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                      create: (context) => getIt<HotelsBloc>()
                                        ..add(const HotelsEvent.getHotels()),
                                      child: const HotelsScreen(),
                                    )),
                            (route) => false);
                      },
                      child: const Text('Супер'))))
        ],
      ),
    );
  }
}
