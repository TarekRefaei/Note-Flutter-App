part of 'local_or_online_bloc.dart';

abstract class LocalOrOnlineEvent extends Equatable {
  const LocalOrOnlineEvent();

  @override
  List<Object> get props => [];
}
class StartOptions extends LocalOrOnlineEvent {
  const StartOptions();

  @override
  List<Object> get props => [];
}

class ToggleSwitch extends LocalOrOnlineEvent {
  const ToggleSwitch();

  @override
  List<Object> get props => [];
}
