import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  factory Room(
      {required int id,
      @JsonKey(name: 'image_urls')
      required List<String> imageUrls,
      required String name,
      required List<String> pecularities,
      required int price,
      @JsonKey(name: 'price_per')
      required String pricePer,
      }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}