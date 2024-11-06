import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
class Hotel with _$Hotel {
  factory Hotel(
      {required AboutHotel aboutHotel,
      required String address,
      required int id,
      @JsonKey(name: 'image_urls')
      required List<String> imageUrls,
      @JsonKey(name: 'minimal_price')
      required int minimalPrice,
      required String name,
      required num rating,
       @JsonKey(name: 'rating_name')
      required String ratingName}) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}

@freezed
class AboutHotel with _$AboutHotel {
  factory AboutHotel(
      {required String description,
      required List<String> pecularities}) = _AboutHotel;

  factory AboutHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutHotelFromJson(json);
}
