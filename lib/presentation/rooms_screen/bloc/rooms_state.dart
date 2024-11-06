part of 'rooms_bloc.dart';

@freezed
class RoomsState with _$RoomsState {
  const factory RoomsState.initial() = _Initial;
  const factory RoomsState.loading() = _Loading;
  const factory RoomsState.success(List<Room> rooms) = _Success;
  const factory RoomsState.failure(String message) = _Failure;
}
