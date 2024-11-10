import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';


@freezed
class Reservation with _$Reservation {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Reservation({
    required String arrivalCountry,
    required DateTime departure,
    required int fuelCharge,
    required int horating,
    required String hotelAddress,
    required String hotelName,
    required int id,
    required String numberOfNights,
    required String nutrition,
    required String ratingName,
    required String room,
    required int serviceCharge,
    required DateTime tourDateStart,
    required DateTime tourDateStop,
    required int tourPrice,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}
