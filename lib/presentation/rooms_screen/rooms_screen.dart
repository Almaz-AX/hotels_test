import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/rooms_bloc.dart';
import 'widgets/room_card.dart';

class RoomsScreen extends StatelessWidget {
  final String hotelName;
  const RoomsScreen({super.key, required this.hotelName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          hotelName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.chevron_left, size:32),
        ),
      ),
      body: BlocBuilder<RoomsBloc, RoomsState>(
        builder: (context, state) {
          return state.when(
              initial: () => Container(),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (rooms) {
                return ListView.builder(
                    itemCount: rooms.length,
                    itemBuilder: ((context, index) => RoomCard(
                          room: rooms[index],
                        )));
              },
              failure: (message) => Center(child: Text(message)));
        },
      ),
    );
  }
}
