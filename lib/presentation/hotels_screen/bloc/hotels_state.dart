part of 'hotels_bloc.dart';

@freezed
sealed class HotelsState with _$HotelsState {
  const factory HotelsState.initial() = _Initial;
  const factory HotelsState.loading() = _Loading;
  const factory HotelsState.success(List<Hotel> hotels) = _Success;
  const factory HotelsState.failure(String message) = _Failure;
}
