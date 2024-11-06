// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hostels/repository/hotel_rest_client.dart';

import '../../../models/room/room.dart';

part 'rooms_bloc.freezed.dart';
part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final HotelRestClient client;
  RoomsBloc({required this.client}) : super(const _Initial()) {
    on<RoomsEvent>((event, emit) async {
      emit(const RoomsState.loading());
      try {
        final rooms = await client.getRooms();
        emit(RoomsState.success(rooms));
      } catch (e) {
        emit(const RoomsState.failure('Что-то пошло не так( Простите!!!'));
      }
    });
  }
    }
