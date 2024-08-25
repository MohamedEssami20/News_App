part of 'internet_conncetion_cubit.dart';

@immutable
sealed class InternetConncetionState {}

final class InternetConncetionInitial extends InternetConncetionState {}

final class InternetConncetionFailure extends InternetConncetionState {}

final class InternetConncetionSuccess extends InternetConncetionState {
  final List<ConnectivityResult> connected;

  InternetConncetionSuccess({required this.connected});
}
