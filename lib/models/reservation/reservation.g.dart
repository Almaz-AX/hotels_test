// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationImpl _$$ReservationImplFromJson(Map<String, dynamic> json) =>
    _$ReservationImpl(
      arrivalCountry: json['arrival_country'] as String,
      departure: DateTime.parse(json['departure'] as String),
      fuelCharge: (json['fuel_charge'] as num).toInt(),
      horating: (json['horating'] as num).toInt(),
      hotelAddress: json['hotel_address'] as String,
      hotelName: json['hotel_name'] as String,
      id: (json['id'] as num).toInt(),
      numberOfNights: json['number_of_nights'] as String,
      nutrition: json['nutrition'] as String,
      ratingName: json['rating_name'] as String,
      room: json['room'] as String,
      serviceCharge: (json['service_charge'] as num).toInt(),
      tourDateStart: DateTime.parse(json['tour_date_start'] as String),
      tourDateStop: DateTime.parse(json['tour_date_stop'] as String),
      tourPrice: (json['tour_price'] as num).toInt(),
    );

Map<String, dynamic> _$$ReservationImplToJson(_$ReservationImpl instance) =>
    <String, dynamic>{
      'arrival_country': instance.arrivalCountry,
      'departure': instance.departure.toIso8601String(),
      'fuel_charge': instance.fuelCharge,
      'horating': instance.horating,
      'hotel_address': instance.hotelAddress,
      'hotel_name': instance.hotelName,
      'id': instance.id,
      'number_of_nights': instance.numberOfNights,
      'nutrition': instance.nutrition,
      'rating_name': instance.ratingName,
      'room': instance.room,
      'service_charge': instance.serviceCharge,
      'tour_date_start': instance.tourDateStart.toIso8601String(),
      'tour_date_stop': instance.tourDateStop.toIso8601String(),
      'tour_price': instance.tourPrice,
    };
