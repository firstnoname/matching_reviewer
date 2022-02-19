import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/utilities/ui_feedback.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  final BuildContext context;
  final UIFeedback uiFeedback;

  BaseBloc(
    this.context,
    this.uiFeedback,
    State initialState,
  ) : super(initialState);
}
