part of 'local_or_online_bloc.dart';

abstract class LocalOrOnlineState extends Equatable {
  const LocalOrOnlineState();
  @override
  List<Object> get props => [];
}

class LocalOrOnlineLoading extends LocalOrOnlineState {
  @override
  List<Object> get props => [];
}

class LocalOrOnlineLoaded extends LocalOrOnlineState {
  final LocalOrOnline localOrOnline;


  const LocalOrOnlineLoaded(this.localOrOnline);

  @override
  List<Object> get props => [localOrOnline];
}

class LocalOrOnlineError extends LocalOrOnlineState {
  const LocalOrOnlineError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}


