import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/utilities/ui_feedback.dart';

import 'blocs.dart';

class ABlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (event is! NoIndicator) {
      UIFeedback.showLoadingIndicator();
    }
    debugPrint('bloc: ${bloc.runtimeType}, event: ${event.runtimeType}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    UIFeedback.dismiss();
    debugPrint('bloc: ${bloc.runtimeType}, ${transition.toString()}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('bloc: ${bloc.runtimeType}, ${change.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint(error.toString());
  }
}
