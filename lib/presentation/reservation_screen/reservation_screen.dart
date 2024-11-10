import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/reservation_bloc.dart';
import 'widgets/reservation_card.dart';

class ReservatonScreen extends StatelessWidget {
  const ReservatonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Бронирование',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left, size: 32),
        ),
      ),
      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          return state.when(
            initial:()=>  Container(), 
            loading: ()=>  const Center(child: CircularProgressIndicator(),), 
            success: (success)=> ReservationCard(reservation: success), 
            failure: (failure)=>  Center(child: Text(failure)));
        }
      ),
    );
  }
}


