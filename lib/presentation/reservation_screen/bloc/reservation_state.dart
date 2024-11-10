part of 'reservation_bloc.dart';

@freezed
class ReservationState with _$ReservationState {
  const factory ReservationState.initial() = _Initial;
  const factory ReservationState.loading() = _Loading;
  const factory ReservationState.success(Reservation reservation) = _Success;
  const factory ReservationState.failure(String message) = _Failure;
}
