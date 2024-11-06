import 'package:dio/dio.dart';
import 'package:hostels/models/room/room.dart';
import 'package:retrofit/retrofit.dart';

import 'package:hostels/models/hotel/hotel.dart';

part 'hotel_rest_client.g.dart';

@RestApi(baseUrl: 'http://node1.flyer-b2b.ru:5001/api/')
abstract class HotelRestClient {
  factory HotelRestClient(Dio dio, {String? baseUrl}) = _HotelRestClient;

  @GET('/hotels')
  Future<List<Hotel>> getHotels();

  @GET('/rooms')
  Future<List<Room>> getRooms();
}
