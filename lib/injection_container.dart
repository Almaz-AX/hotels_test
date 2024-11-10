import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hostels/presentation/hotels_screen/bloc/hotels_bloc.dart';
import 'package:hostels/repository/hotel_rest_client.dart';

import 'presentation/reservation_screen/bloc/reservation_bloc.dart';
import 'presentation/rooms_screen/bloc/rooms_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //presentation

  //hotels_screen
  getIt.registerFactory(() => HotelsBloc(client: getIt()));

  //rooms_screen
  getIt.registerFactory(() => RoomsBloc(client:getIt()));

  //resevation_screen
  getIt.registerFactory(() => ReservationBloc(client:getIt()));


  //repository
  getIt.registerLazySingleton<HotelRestClient>(() => HotelRestClient(getIt()));

  //external
  getIt.registerLazySingleton<Dio>(() => Dio());
}
