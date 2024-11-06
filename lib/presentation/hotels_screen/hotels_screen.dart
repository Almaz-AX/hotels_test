import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/hotels_bloc.dart';
import 'widgets/hotel_card.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Отель',
        )),
      ),
      body: BlocBuilder<HotelsBloc, HotelsState>(
        builder: (context, state) {
          return state.when(
              initial: () => Container(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (hotels) {
                return ListView.builder(
                    itemCount: hotels.length,
                    itemBuilder: ((context, index) => HotelCard(
                          hotel: hotels[index],
                        )),);
              },
              failure: (message) =>
                  Center(child: Text(message)));
        },
      ),
    );
  }
}

