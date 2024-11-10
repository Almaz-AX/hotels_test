import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostels/repository/hotel_rest_client.dart';

import '../../../models/reservation/reservation.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';
part 'reservation_bloc.freezed.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final HotelRestClient client;
  ReservationBloc({required this.client}) : super(const _Initial()) {
    on<ReservationEvent>((event, emit) async {
      emit(const ReservationState.loading());
      try {
        final reservations = await client.getReservations();
        final reservationRoom =
            reservations.firstWhere((element) => element.id == event.roomId);
        emit(ReservationState.success(reservationRoom));
      } catch (e) {
        emit(
            const ReservationState.failure('Что-то пошло не такю Простите((('));
      }
    });
  }
}
