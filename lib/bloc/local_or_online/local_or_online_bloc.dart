import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/local_or_online.dart';

part 'local_or_online_event.dart';

part 'local_or_online_state.dart';

class LocalOrOnlineBloc extends Bloc<LocalOrOnlineEvent, LocalOrOnlineState> {
  LocalOrOnlineBloc() : super(LocalOrOnlineLoading()) {
    on<StartOptions>((event, emit) {
      emit(
        const LocalOrOnlineLoaded(
          LocalOrOnline(),
        ),
      );
    });

    on<ToggleSwitch>((event, emit) {
      final state = this.state;
      if (state is LocalOrOnlineLoaded) {
        emit(
          LocalOrOnlineLoaded(
            state.localOrOnline.copyWith(
              localOrOnline: !state.localOrOnline.localOrOnline,
            ),
          ),
        );
      } else {
        (message) {
          emit(
            LocalOrOnlineError(
              message.toString(),
            ),
          );
        };
      }
    });
  }
}
