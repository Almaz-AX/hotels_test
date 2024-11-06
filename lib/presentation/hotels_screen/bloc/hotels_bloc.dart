import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/hotel/hotel.dart';
import '../../../repository/hotel_rest_client.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';
part 'hotels_bloc.freezed.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final HotelRestClient client;
  HotelsBloc({required this.client}) : super(const _Initial()) {
    on<HotelsEvent>((event, emit) async {
      emit(const HotelsState.loading());
      try {
        final hotels = await client.getHotels();
        emit(HotelsState.success(hotels));
      } catch (e) {
        emit(const HotelsState.failure('Что-то пошло не так( Простите!!!'));
      }
    });
  }
}
