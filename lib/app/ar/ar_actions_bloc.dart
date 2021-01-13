import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'ar_actions_event.dart';

part 'ar_actions_state.dart';

part 'ar_actions_bloc.freezed.dart';

@injectable
class ArActionsBloc extends Bloc<ArActionsEvent, ArActionsState> {
  ArActionsBloc() : super(ArActionsState.initial());

  @override
  Stream<ArActionsState> mapEventToState(
    ArActionsEvent event,
  ) async* {
    yield* event.map(
      place: (_Place value) async* {
        yield state.copyWith(action: ArAction.placing);
      },
      release: (_Release value) async* {
        yield state.copyWith(action: ArAction.releasing);
      },
      capture: (_Capture value) async* {
        yield state.copyWith(action: ArAction.capturing);
      },
      notifyPlaced: (_NotifyPlaced value) async* {
        yield state.copyWith(action: ArAction.placed);
      },
      notifyReleased: (_NotifyRelesed value) async* {
        yield state.copyWith(action: ArAction.idle);
      },
      notifyCaptured: (_NotifyCaptured value) async* {
        yield state.copyWith(action: ArAction.captured);
      },
    );
  }
}
